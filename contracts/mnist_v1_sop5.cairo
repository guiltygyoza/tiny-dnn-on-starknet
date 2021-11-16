%lang starknet
%builtins pedersen range_check

from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.math import signed_div_rem

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
namespace IContractV1SOP5SUB0:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP5SUB1:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP5SUB2:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP5SUB3:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP5SUB4:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP5SUB5:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP5SUB6:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP5SUB7:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

################################################

@view
func compute {
        syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr
    }(
        x_len : felt,
        x : felt*
    ) -> (
        res : felt
    ):
    alloc_locals

    let (addr_0) = stored_addresses.read(0)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (local sub0) = IContractV1SOP5SUB0.compute(addr_0, 100, x+100*0)

    let (addr_1) = stored_addresses.read(1)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (local sub1) = IContractV1SOP5SUB1.compute(addr_1, 100, x+100*1)

    let (addr_2) = stored_addresses.read(2)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (local sub2) = IContractV1SOP5SUB2.compute(addr_2, 100, x+100*2)

    let (addr_3) = stored_addresses.read(3)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (local sub3) = IContractV1SOP5SUB3.compute(addr_3, 100, x+100*3)

    let (addr_4) = stored_addresses.read(4)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (local sub4) = IContractV1SOP5SUB4.compute(addr_4, 100, x+100*4)

    let (addr_5) = stored_addresses.read(5)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (local sub5) = IContractV1SOP5SUB5.compute(addr_5, 100, x+100*5)

    let (addr_6) = stored_addresses.read(6)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (local sub6) = IContractV1SOP5SUB6.compute(addr_6, 100, x+100*6)

    let (addr_7) = stored_addresses.read(7)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (local sub7) = IContractV1SOP5SUB7.compute(addr_7, 84, x+100*7)

    let res_ = sub0 + sub1 + sub2 + sub3 + sub4 + sub5 + sub6 + sub7
    let (res, _) = signed_div_rem(res_, 100000000, 2 ** 64)
    return (res)
end

