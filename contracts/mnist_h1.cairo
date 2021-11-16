%lang starknet
%builtins pedersen range_check

from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.math_cmp import is_le
from starkware.cairo.common.alloc import alloc

func _relu {
        range_check_ptr
    }(x : felt) -> (y : felt):

    let (bool_pos) = is_le (0, x)
    let y = bool_pos * x

    return (y)
end

################################################

@view
func compute {
        syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr
    }(
        v1_len : felt,
        v1 : felt*
    ) -> (
        h1_len : felt,
        h1 : felt*
    ):
    alloc_locals

    let (local h1) = alloc()

    let (h) = _relu([v1+0])
    assert [h1+0] = h

    let (h) = _relu([v1+1])
    assert [h1+1] = h

    let (h) = _relu([v1+2])
    assert [h1+2] = h

    let (h) = _relu([v1+3])
    assert [h1+3] = h

    let (h) = _relu([v1+4])
    assert [h1+4] = h

    let (h) = _relu([v1+5])
    assert [h1+5] = h

    let (h) = _relu([v1+6])
    assert [h1+6] = h

    let (h) = _relu([v1+7])
    assert [h1+7] = h

    let (h) = _relu([v1+8])
    assert [h1+8] = h

    let (h) = _relu([v1+9])
    assert [h1+9] = h

    let (h) = _relu([v1+10])
    assert [h1+10] = h

    let (h) = _relu([v1+11])
    assert [h1+11] = h

    let (h) = _relu([v1+12])
    assert [h1+12] = h

    let (h) = _relu([v1+13])
    assert [h1+13] = h

    let (h) = _relu([v1+14])
    assert [h1+14] = h

    let (h) = _relu([v1+15])
    assert [h1+15] = h

    let (h) = _relu([v1+16])
    assert [h1+16] = h

    let (h) = _relu([v1+17])
    assert [h1+17] = h

    let (h) = _relu([v1+18])
    assert [h1+18] = h

    let (h) = _relu([v1+19])
    assert [h1+19] = h

    let (h) = _relu([v1+20])
    assert [h1+20] = h

    let (h) = _relu([v1+21])
    assert [h1+21] = h

    let (h) = _relu([v1+22])
    assert [h1+22] = h

    let (h) = _relu([v1+23])
    assert [h1+23] = h

    let (h) = _relu([v1+24])
    assert [h1+24] = h

    let (h) = _relu([v1+25])
    assert [h1+25] = h

    let (h) = _relu([v1+26])
    assert [h1+26] = h

    let (h) = _relu([v1+27])
    assert [h1+27] = h

    let (h) = _relu([v1+28])
    assert [h1+28] = h

    let (h) = _relu([v1+29])
    assert [h1+29] = h

    let (h) = _relu([v1+30])
    assert [h1+30] = h

    let (h) = _relu([v1+31])
    assert [h1+31] = h

    let h1_len = v1_len
    return (h1_len, h1)
end

