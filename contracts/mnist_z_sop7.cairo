%lang starknet
%builtins pedersen range_check

from starkware.cairo.common.cairo_builtins import HashBuiltin

@view
func compute {
        syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr
    }(
        x_len : felt,
        x : felt*
    ) -> (
        res : felt
    ):

    let res = -63708871 + [x+0] * 1495072 + [x+1] * 6092692 + [x+2] * -27970349 + [x+3] * -64248359 + [x+4] * -88631063 + [x+5] * 6439471 + [x+6] * -70919847 + [x+7] * 9400668 + [x+8] * -17837543 + [x+9] * -13206245 + [x+10] * -52482312 + [x+11] * 21588084 + [x+12] * -23047624 + [x+13] * -16611503 + [x+14] * 9888248 + [x+15] * 26448139 + [x+16] * -65531516 + [x+17] * 6473436 + [x+18] * 17154252 + [x+19] * 2133300 + [x+20] * -24879702 + [x+21] * -73996680 + [x+22] * -57015538 + [x+23] * 7946862 + [x+24] * -80389547 + [x+25] * -46731469 + [x+26] * -67282724 + [x+27] * -59776848 + [x+28] * 3731876 + [x+29] * -52926605 + [x+30] * -42056211 + [x+31] * 3030008
    return (res)
end
