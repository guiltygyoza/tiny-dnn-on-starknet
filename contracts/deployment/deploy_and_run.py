import sys
import numpy as np
import subprocess
import time
import json
from joblib import delayed, Parallel
from timeit import default_timer as timer

def subprocess_run (cmd):
	result = subprocess.run(cmd, stdout=subprocess.PIPE)
	result = result.stdout.decode('utf-8')[:-1] # remove trailing newline
	return result

## compile and deploy contract
def _compile_and_deploy_contract(name):
	cmd = f'starknet-compile {name}.cairo --output {name}_compiled.json --abi {name}_abi.json'
	cmd = cmd.split(' ')
	_ = subprocess_run(cmd)

	cmd = f'starknet deploy --contract {name}_compiled.json --network=alpha'
	cmd = cmd.split(' ')
	deploy_ret = subprocess_run(cmd)
	deploy_ret = deploy_ret.split(': ')
	addr = deploy_ret[1].split('\n')[0]
	tx_hash = deploy_ret[-1]
	return {'addr':addr, 'tx_hash':tx_hash}

## polling list of hashes over given time interval until all accepted on StarkNet
## cached accepted tx_hash to avoid unnecessary polling of accepted tx
def _poll_list_tx_hashes_until_all_accepted(list_of_tx_hashes, interval_in_sec):
	accepted_list = [False for _ in list_of_tx_hashes]

	while True:
		all_accepted = True
		print(f'> begin polling tx status.')
		for i, tx_hash in enumerate(list_of_tx_hashes):
			if accepted_list[i]:
				continue
			cmd = f"starknet tx_status --network=alpha --hash={tx_hash}".split(' ')
			ret = subprocess_run(cmd)
			ret = json.loads(ret)
			if ret['tx_status'] != 'ACCEPTED_ONCHAIN':
				print(f"> {tx_hash} ({ret['tx_status']}) not accepted onchain yet.")
				all_accepted = False
				break
			else:
				print(f"> {i}th hash {tx_hash} is accepted onchain.")
				accepted_list[i] = True
		if all_accepted:
			break
		else:
			print(f'> retry polling in {interval_in_sec} seconds.')
			time.sleep(interval_in_sec)
	print(f'> all tx hashes are accepted onchain.')
	return

## invoking admin_store_addresses of contract
def _admin_store_addresses(name, contract_addr, idx, store_addr):
	cmd = f"starknet invoke --network=alpha --address {contract_addr} --abi ../{name}_abi.json --function admin_store_addresses --inputs {idx} {store_addr}"
	cmd = cmd.split(' ')
	ret = subprocess_run(cmd)
	ret = ret.split(': ')
	#addr = ret[1].split('\n')[0]
	tx_hash = ret[-1]
	return tx_hash

def _inference(contract_addr, img_input):
	img_input_string = [str(e) for e in img_input]
	img_input_joined = ' '.join(img_input_string)
	cmd = f"starknet call --network=alpha --address {contract_addr} --abi ../mnist_abi.json --function inference --inputs {img_input_joined}"
	cmd = cmd.split(' ')
	ret = subprocess_run(cmd)
	return ret

def _call(name, contract_addr, func_name, img_input):
	img_input_string = [str(e) for e in img_input]
	img_input_joined = ' '.join(img_input_string)
	cmd = f"starknet call --network=alpha --address {contract_addr} --abi ../{name}_abi.json --function {func_name} --inputs {img_input_joined}"
	cmd = cmd.split(' ')
	ret = subprocess_run(cmd)
	return ret

def _call_compute(name):
	img_input_string = [str(e) for e in IMG_INPUT]
	img_input_joined = ' '.join(img_input_string)
	cmd = f"starknet call --network=alpha --address {deployed_extracted[name]['addr']} --abi ../{name}_abi.json --function compute --inputs {img_input_joined}"
	cmd = cmd.split(' ')
	ret = subprocess_run(cmd)
	return ret

## Cairo constant
PRIME = 3618502788666131213697322783095070105623107215331596699973092056135872020481
PRIME_HALF = PRIME//2

# ###################################################

## 1. create list of contract names to be deployed
NAMES = []
NAMES += ['mnist', 'mnist_v1', 'mnist_h1', 'mnist_z']
for sop_idx in range(32):
	NAMES.append(f'mnist_v1_sop{sop_idx}')
	for subsop_idx in range(8):
		NAMES.append(f'mnist_v1_sop{sop_idx}_subsop{subsop_idx}')
for sop_idx in range(10):
	NAMES.append(f'mnist_z_sop{sop_idx}')

# ## 2. deploy the contracts and save the address and tx hashes
# deployed = {}
# for name in NAMES:
# 	deployed[name] = _compile_and_deploy_contract(f'../{name}')
# 	print(f'> Tx sent to deploy {name}.cairo')
# 	print(f'> {deployed[name]}')
# 	print()

# ### export file listing all contract's addresses
# with open('deploy_log_addresses.txt', 'a') as f:
# 	f.write('contract addresses and deployment tx hashes:\n')
# 	for name in NAMES:
# 		f.write(f"{name} deployed at addr={deployed[name]['addr']} with tx_hash={deployed[name]['tx_hash']}")
# 		f.write('\n')
# 	f.write('\n')
# print('> Created deploy_log_addresses.txt')

# # ## 3. monitor tx hashes to wait for all contracts to be deployed
# # print(f'> Begin monitoring tx hashes for contract deployment')
# # deployed_tx_hashes = [deployed_extracted[name]['tx_hash'] for name in NAMES]
# # _poll_list_tx_hashes_until_all_accepted(deployed_tx_hashes, interval_in_sec=30)

# ## 4. invoke functions to store addresses into the contracts; save tx hashes
# store_addr_tx_hashes = []
# ### store sop in v1; store subsop in v1's sop
# for sop_idx in range(32):
# 	tx_hash = _admin_store_addresses('mnist_v1', deployed_extracted['mnist_v1']['addr'], sop_idx, deployed_extracted[f'mnist_v1_sop{sop_idx}']['addr'])
# 	store_addr_tx_hashes.append(tx_hash)
# 	for subsop_idx in range(8):
# 		tx_hash = _admin_store_addresses(f'mnist_v1_sop{sop_idx}', deployed_extracted[f'mnist_v1_sop{sop_idx}']['addr'], subsop_idx, deployed_extracted[f'mnist_v1_sop{sop_idx}_subsop{subsop_idx}']['addr'])
# 		store_addr_tx_hashes.append(tx_hash)

# ### store sop in z
# for sop_idx in range(10):
# 	tx_hash = _admin_store_addresses('mnist_z', deployed_extracted['mnist_z']['addr'], sop_idx, deployed_extracted[f'mnist_z_sop{sop_idx}']['addr'])
# 	store_addr_tx_hashes.append(tx_hash)

# ### store v1, h1, z in top-level contract
# tx_hash = _admin_store_addresses('mnist', deployed_extracted['mnist']['addr'], 0, deployed_extracted['mnist_v1']['addr'])
# store_addr_tx_hashes.append(tx_hash)
# tx_hash = _admin_store_addresses('mnist', deployed_extracted['mnist']['addr'], 1, deployed_extracted['mnist_h1']['addr'])
# store_addr_tx_hashes.append(tx_hash)
# tx_hash = _admin_store_addresses('mnist', deployed_extracted['mnist']['addr'], 2, deployed_extracted['mnist_z']['addr'])
# store_addr_tx_hashes.append(tx_hash)

# ## 5. monitor tx hashes to wait for all invokes to settle
# print(f'> Begin monitoring tx hashes for admin_store_addresses() invokes')
# _poll_list_tx_hashes_until_all_accepted(store_addr_tx_hashes, interval_in_sec=30)

# # ## 6. export file listing address-storing tx hashes
# with open('deploy_log_hashes.txt', 'a') as f:
# 	# address-storing tx hashes
# 	f.write('address-storing tx hashes\n')
# 	for tx_hash in store_addr_tx_hashes:
# 		f.write(f'{tx_hash}\n')
# print('> Created deploy_log_hashes.txt')
# print('> Deployment completed.')


########################################################

## parse deployed contract logs for address and tx_hash
deployed_extracted = {}
with open('log_contract_deployment_txhash.txt', 'r') as f:
	lines = f.readlines()
	lines = [line.rstrip() for line in lines]

	for i,line in enumerate(lines):
		if line[0:3] == '> {':
			line_split = line.split("'")
			addr = line_split[3]
			tx_hash = line_split[7]
			contract_file_name = lines[i-1].split("deploy ")[-1]
			name = contract_file_name.split('.')[0]
			deployed_extracted[name] = {'addr':addr, 'tx_hash':tx_hash}

## let's send a nicely written digit 2, flatten from 28x28
RAW_IMG = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,13,25,100,122,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,33,151,208,252,252,252,146,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,40,152,244,252,253,224,211,252,232,40,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,15,152,239,252,252,252,216,31,37,252,252,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,96,252,252,252,252,217,29,0,37,252,252,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,181,252,252,220,167,30,0,0,77,252,252,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,26,128,58,22,0,0,0,0,100,252,252,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,157,252,252,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,110,121,122,121,202,252,194,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10,53,179,253,253,255,253,253,228,35,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,54,227,252,243,228,170,242,252,252,231,117,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,78,252,252,125,59,0,18,208,252,252,252,252,87,7,0,0,0,0,0,0,0,0,0,0,0,0,5,135,252,252,180,16,0,21,203,253,247,129,173,252,252,184,66,49,49,0,0,0,0,0,0,0,0,3,136,252,241,106,17,0,53,200,252,216,65,0,14,72,163,241,252,252,223,0,0,0,0,0,0,0,0,105,252,242,88,18,73,170,244,252,126,29,0,0,0,0,0,89,180,180,37,0,0,0,0,0,0,0,0,231,252,245,205,216,252,252,252,124,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,207,252,252,252,252,178,116,36,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,13,93,143,121,23,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
IMG_INPUT = [784] + RAW_IMG # send array length at the beginning for correct parsing by starknet
print( '> DNN deployed to StarkNet testnet:')
print( '  FC1 (784x32) => RELU => FC2 (32x10)')
print( '  parameter count: 25450')
print()
print(f'> {len(NAMES)} contracts deployed to StarkNet')
print(f'> Top-level contract: mnist.cairo, deployed at address {deployed_extracted["mnist"]["addr"]}')
print()
print('> Begin inference')
print(f'> Input image:')
for i in range(28):
    for j in range(28):
        print("%3d" % RAW_IMG[i*28+j], end=" ")
    print()
print()

V1_SOP_NAMES = [f'mnist_v1_sop{i}' for i in range(32)]
print(f'> Computing x => v1; contract: mnist_v1.cairo, deployed at address {deployed_extracted["mnist_v1"]["addr"]}')
t1 = timer()
v1 = Parallel(n_jobs=64)(delayed(_call_compute)(name) for name in V1_SOP_NAMES)
t2 = timer()
v1_int = [int(e) for e in v1]
print(f'> v1 = {v1_int}')
print(f'> Time spent: {t2-t1} sec')
print()

print(f'> Computing v1 => h1; contract: mnist_h1.cairo, deployed at address {deployed_extracted["mnist_h1"]["addr"]}')
v1_modP = [e % PRIME for e in v1_int]
t1 = timer()
h1 = _call('mnist_h1', deployed_extracted['mnist_h1']['addr'], 'compute', [32]+v1_modP)
t2 = timer()
h1 = h1.split(' ')[1:] # split by space, then remove leading array len returned by contract
h1_int = [int(e) for e in h1]
print(f'> h1 = {h1_int}')
print(f'> Time spent: {t2-t1} sec')
print()

print(f'> Computing h1 => z; contract: mnist_z.cairo, deployed at address {deployed_extracted["mnist_z"]["addr"]}')
h1_modP = [e % PRIME for e in h1_int]
Z_SOP_NAMES = [f'mnist_z_sop{i}' for i in range(10)]
IMG_INPUT = [32] + h1_modP
t1 = timer()
z = Parallel(n_jobs=10)(delayed(_call_compute)(name) for name in Z_SOP_NAMES)
t2 = timer()
z_int = [int(e) for e in z]
print(f'> z = {z_int}')
print(f'> Time spent: {t2-t1} sec')
print()
print(f'> Inference result: {np.argmax(z_int)}.')
print()
