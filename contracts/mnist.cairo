%lang starknet
%builtins pedersen range_check

from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.alloc import alloc

@storage_var
func stored_addresses (idx : felt) -> (addr : felt):
end

@external
func admin_store_addresses {
        syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr
    } (idx : felt, addr : felt) -> ():
    stored_addresses.write(idx, addr)
    return ()
end

################################################

@contract_interface
namespace IContractV1:
    func compute(x_len : felt, x : felt*) -> (v1_len : felt, v1 : felt*):
    end
end

@contract_interface
namespace IContractH1:
    func compute(v1_len : felt, v1 : felt*) -> (h1_len : felt, h1 : felt*):
    end
end

@contract_interface
namespace IContractZ:
    func compute(h1_len : felt, h1 : felt*) -> (z_len : felt, z : felt*):
    end
end

################################################

@view
func inference {
        syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr
    }(
        x_len : felt,
        x : felt*
    ) -> (
        z_len : felt,
        z : felt*
    ):
    ### x  : vector 1x784
    ### v1 : vector 1x32 = x * M1 + b1
    ### h1 : vector 1x32 = relu(v1)
    ### z  : vector 1x10 = h1 * M2 + b2

    alloc_locals

    let (addr_0) = stored_addresses.read(0)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (local v1_len,  local v1)  = IContractV1.compute (addr_0, x_len, x)

    let (addr_1) = stored_addresses.read(1)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (local h1_len, local h1) = IContractH1.compute(addr_1, v1_len, v1)

    let (addr_2) = stored_addresses.read(2)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (z_len, z)                 = IContractZ.compute  (addr_2, h1_len, h1)

    return (z_len, z)
end
