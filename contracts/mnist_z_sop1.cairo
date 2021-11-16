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

    let res = -32906207 + [x+0] * -79750967 + [x+1] * -73327142 + [x+2] * 7389348 + [x+3] * 7822357 + [x+4] * -56667470 + [x+5] * -20646210 + [x+6] * -62205058 + [x+7] * -20084258 + [x+8] * 11243810 + [x+9] * -2396815 + [x+10] * 10177914 + [x+11] * 23267485 + [x+12] * 404667 + [x+13] * 3677071 + [x+14] * 9536660 + [x+15] * -60195440 + [x+16] * 4399808 + [x+17] * -87918442 + [x+18] * 17193999 + [x+19] * -46232298 + [x+20] * 26305717 + [x+21] * -75099289 + [x+22] * -100247359 + [x+23] * -70922571 + [x+24] * -24881382 + [x+25] * -1509057 + [x+26] * -77863746 + [x+27] * -56829756 + [x+28] * 5948989 + [x+29] * -60212522 + [x+30] * -93880409 + [x+31] * -75268590
    return (res)
end
