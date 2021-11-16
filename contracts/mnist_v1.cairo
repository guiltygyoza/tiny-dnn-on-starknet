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
namespace IContractV1SOP0:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP1:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP2:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP3:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP4:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP5:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP6:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP7:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP8:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP9:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP10:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP11:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP12:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP13:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP14:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP15:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP16:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP17:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP18:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP19:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP20:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP21:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP22:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP23:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP24:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP25:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP26:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP27:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP28:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP29:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP30:
    func compute(x_len : felt, x : felt*) -> (res : felt):
    end
end

@contract_interface
namespace IContractV1SOP31:
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
        v1_len : felt,
        v1 : felt*
    ):
    ### x  : vector 1x784
    ### v1 : vector 1x32
    alloc_locals

    let (local v1) = alloc()

    let (addr_0) = stored_addresses.read(0)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (v1_0) = IContractV1SOP0.compute(addr_0, 784, x)
    assert [v1+0] = v1_0

    let (addr_1) = stored_addresses.read(1)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (v1_1) = IContractV1SOP1.compute(addr_1, 784, x)
    assert [v1+1] = v1_1

    let (addr_2) = stored_addresses.read(2)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (v1_2) = IContractV1SOP2.compute(addr_2, 784, x)
    assert [v1+2] = v1_2

    let (addr_3) = stored_addresses.read(3)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (v1_3) = IContractV1SOP3.compute(addr_3, 784, x)
    assert [v1+3] = v1_3

    let (addr_4) = stored_addresses.read(4)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (v1_4) = IContractV1SOP4.compute(addr_4, 784, x)
    assert [v1+4] = v1_4

    let (addr_5) = stored_addresses.read(5)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (v1_5) = IContractV1SOP5.compute(addr_5, 784, x)
    assert [v1+5] = v1_5

    let (addr_6) = stored_addresses.read(6)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (v1_6) = IContractV1SOP6.compute(addr_6, 784, x)
    assert [v1+6] = v1_6

    let (addr_7) = stored_addresses.read(7)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (v1_7) = IContractV1SOP7.compute(addr_7, 784, x)
    assert [v1+7] = v1_7

    let (addr_8) = stored_addresses.read(8)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (v1_8) = IContractV1SOP8.compute(addr_8, 784, x)
    assert [v1+8] = v1_8

    let (addr_9) = stored_addresses.read(9)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (v1_9) = IContractV1SOP9.compute(addr_9, 784, x)
    assert [v1+9] = v1_9

    let (addr_10) = stored_addresses.read(10)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (v1_10) = IContractV1SOP10.compute(addr_10, 784, x)
    assert [v1+10] = v1_10

    let (addr_11) = stored_addresses.read(11)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (v1_11) = IContractV1SOP11.compute(addr_11, 784, x)
    assert [v1+11] = v1_11

    let (addr_12) = stored_addresses.read(12)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (v1_12) = IContractV1SOP12.compute(addr_12, 784, x)
    assert [v1+12] = v1_12

    let (addr_13) = stored_addresses.read(13)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (v1_13) = IContractV1SOP13.compute(addr_13, 784, x)
    assert [v1+13] = v1_13

    let (addr_14) = stored_addresses.read(14)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (v1_14) = IContractV1SOP14.compute(addr_14, 784, x)
    assert [v1+14] = v1_14

    let (addr_15) = stored_addresses.read(15)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (v1_15) = IContractV1SOP15.compute(addr_15, 784, x)
    assert [v1+15] = v1_15

    let (addr_16) = stored_addresses.read(16)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (v1_16) = IContractV1SOP16.compute(addr_16, 784, x)
    assert [v1+16] = v1_16

    let (addr_17) = stored_addresses.read(17)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (v1_17) = IContractV1SOP17.compute(addr_17, 784, x)
    assert [v1+17] = v1_17

    let (addr_18) = stored_addresses.read(18)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (v1_18) = IContractV1SOP18.compute(addr_18, 784, x)
    assert [v1+18] = v1_18

    let (addr_19) = stored_addresses.read(19)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (v1_19) = IContractV1SOP19.compute(addr_19, 784, x)
    assert [v1+19] = v1_19

    let (addr_20) = stored_addresses.read(20)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (v1_20) = IContractV1SOP20.compute(addr_20, 784, x)
    assert [v1+20] = v1_20

    let (addr_21) = stored_addresses.read(21)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (v1_21) = IContractV1SOP21.compute(addr_21, 784, x)
    assert [v1+21] = v1_21

    let (addr_22) = stored_addresses.read(22)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (v1_22) = IContractV1SOP22.compute(addr_22, 784, x)
    assert [v1+22] = v1_22

    let (addr_23) = stored_addresses.read(23)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (v1_23) = IContractV1SOP23.compute(addr_23, 784, x)
    assert [v1+23] = v1_23

    let (addr_24) = stored_addresses.read(24)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (v1_24) = IContractV1SOP24.compute(addr_24, 784, x)
    assert [v1+24] = v1_24

    let (addr_25) = stored_addresses.read(25)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (v1_25) = IContractV1SOP25.compute(addr_25, 784, x)
    assert [v1+25] = v1_25

    let (addr_26) = stored_addresses.read(26)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (v1_26) = IContractV1SOP26.compute(addr_26, 784, x)
    assert [v1+26] = v1_26

    let (addr_27) = stored_addresses.read(27)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (v1_27) = IContractV1SOP27.compute(addr_27, 784, x)
    assert [v1+27] = v1_27

    let (addr_28) = stored_addresses.read(28)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (v1_28) = IContractV1SOP28.compute(addr_28, 784, x)
    assert [v1+28] = v1_28

    let (addr_29) = stored_addresses.read(29)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (v1_29) = IContractV1SOP29.compute(addr_29, 784, x)
    assert [v1+29] = v1_29

    let (addr_30) = stored_addresses.read(30)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (v1_30) = IContractV1SOP30.compute(addr_30, 784, x)
    assert [v1+30] = v1_30

    let (addr_31) = stored_addresses.read(31)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    let (v1_31) = IContractV1SOP31.compute(addr_31, 784, x)
    assert [v1+31] = v1_31

    let v1_len = 32
    return (v1_len, v1)
end
