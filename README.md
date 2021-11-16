# tiny-dnn-on-starknet

### Goal
Showing it is possible to run neural network inference on StarkNet.

### How to run the demo?
Change directory to `contracts/deployment` and run `python deploy_and_run.py`

### Overall approach
1. Train the model, and split the model into Cairo contracts
2. Deploy the contracts to StarkNet testnet, and perform address linkage - storing addresses of children contracts in their parent contracts
3. Call the top-level contract to perform inference.

### Contract architecture
- Model: `x` => FC1 (`W1`:784x32) => `v1` => RELU => `h1` => FC2 (`W2`:32x10) => `z`
- Divide `x*W1` into 32 sum-of-products (sop), and divide each sop into 8 sub-sop, where first 7 sub-sops have 100 terms each and the 8th has 84 terms; don't forget the biases; each sub-sop is converted to a contract where the parameters are constants. Aggregator contracts are created for sop's and `v1`. 
- Create one contract for relu operation.
- Divide `h1*W2` into 10 sop's, each converted to a contract where the parameters are constants. Aggregator contract is created for `z`. 
- Create one top-level contract with exposed `inference()` function for external call.

### How does the demo script interact with the contracts?
- If calling top-level `inference()` directly, we get http time-out. Additionally, Cairo CPU is single-threaded, meaning we do not get inter-layer parallelism.
- Instead, the demo script calls each sop in a parallel job. This trades off compute-latency with network-latency.
- The part in the demo script that handles contract deployment and address linkage is commented out.

### Next step
1. conv layer
2. recurrent networks
3. backprop -- would enable on-chain learning and open a new world; have to deal with memory problem with activations
