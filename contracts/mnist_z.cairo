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
namespace IContractZSOP0:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractZSOP1:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractZSOP2:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractZSOP3:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractZSOP4:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractZSOP5:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractZSOP6:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractZSOP7:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractZSOP8:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractZSOP9:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

################################################

@view
func compute {
        syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr
    }(
        h1_len : felt,
        h1 : felt*
    ) -> (
        z_len : felt,
        z : felt*
    ):
    ### h1 : vector 1x32
    ### z  : vector 1x10
    alloc_locals

    let (local z) = alloc()

    let (addr_0) = stored_addresses.read(0)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (z_0) = IContractZSOP0.compute(addr_0, 32, h1)
    assert [z+0] = z_0

    let (addr_1) = stored_addresses.read(1)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (z_1) = IContractZSOP1.compute(addr_1, 32, h1)
    assert [z+1] = z_1

    let (addr_2) = stored_addresses.read(2)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (z_2) = IContractZSOP2.compute(addr_2, 32, h1)
    assert [z+2] = z_2

    let (addr_3) = stored_addresses.read(3)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (z_3) = IContractZSOP3.compute(addr_3, 32, h1)
    assert [z+3] = z_3

    let (addr_4) = stored_addresses.read(4)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (z_4) = IContractZSOP4.compute(addr_4, 32, h1)
    assert [z+4] = z_4

    let (addr_5) = stored_addresses.read(5)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (z_5) = IContractZSOP5.compute(addr_5, 32, h1)
    assert [z+5] = z_5

    let (addr_6) = stored_addresses.read(6)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (z_6) = IContractZSOP6.compute(addr_6, 32, h1)
    assert [z+6] = z_6

    let (addr_7) = stored_addresses.read(7)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (z_7) = IContractZSOP7.compute(addr_7, 32, h1)
    assert [z+7] = z_7

    let (addr_8) = stored_addresses.read(8)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (z_8) = IContractZSOP8.compute(addr_8, 32, h1)
    assert [z+8] = z_8

    let (addr_9) = stored_addresses.read(9)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (z_9) = IContractZSOP9.compute(addr_9, 32, h1)
    assert [z+9] = z_9

    let z_len = 10
    return (z_len, z)
end
