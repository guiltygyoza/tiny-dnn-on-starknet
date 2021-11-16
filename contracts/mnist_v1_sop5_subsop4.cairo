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

    let res = [x+0] * -26366379 + [x+1] * -7308991 + [x+2] * -5958515 + [x+3] * 7917373 + [x+4] * 5242691 + [x+5] * 3010553 + [x+6] * 2080916 + [x+7] * 3173137 + [x+8] * -1347004 + [x+9] * 2194461 + [x+10] * -3309275 + [x+11] * -2138204 + [x+12] * -3520510 + [x+13] * -2836661 + [x+14] * -18808412 + [x+15] * -15581001 + [x+16] * -7115778 + [x+17] * 2417028 + [x+18] * 2187467 + [x+19] * -1554145 + [x+20] * 3591655 + [x+21] * -390883 + [x+22] * -1355129 + [x+23] * 859646 + [x+24] * -16787120 + [x+25] * -23585215 + [x+26] * -25043088 + [x+27] * -16363884 + [x+28] * -6566231 + [x+29] * 8504695 + [x+30] * 3216738 + [x+31] * 402378 + [x+32] * 5406346 + [x+33] * 11370570 + [x+34] * 12148581 + [x+35] * 2631089 + [x+36] * -521943 + [x+37] * 2307935 + [x+38] * -6263935 + [x+39] * -3712532 + [x+40] * -8154066 + [x+41] * -6583065 + [x+42] * -10141973 + [x+43] * -11609338 + [x+44] * 3353550 + [x+45] * 8448133 + [x+46] * 4938831 + [x+47] * -1276548 + [x+48] * 3529635 + [x+49] * 602175 + [x+50] * 1934092 + [x+51] * -284670 + [x+52] * -1936347 + [x+53] * 7018 + [x+54] * 2693489 + [x+55] * 5785610 + [x+56] * 8174564 + [x+57] * 10472274 + [x+58] * 8891236 + [x+59] * 3297011 + [x+60] * 5230341 + [x+61] * 12085118 + [x+62] * 13429670 + [x+63] * 3740837 + [x+64] * 3963887 + [x+65] * 1399952 + [x+66] * -4998193 + [x+67] * -2702756 + [x+68] * -8551051 + [x+69] * 1656668 + [x+70] * 3056428 + [x+71] * 381789 + [x+72] * 17146103 + [x+73] * 20438969 + [x+74] * 6368866 + [x+75] * -729312 + [x+76] * -2809666 + [x+77] * 3194982 + [x+78] * 4340488 + [x+79] * 7437763 + [x+80] * 6519538 + [x+81] * 7837755 + [x+82] * 8721933 + [x+83] * 7023663 + [x+84] * 8790841 + [x+85] * 1786072 + [x+86] * -2028090 + [x+87] * 3764144 + [x+88] * 2019481 + [x+89] * 9918210 + [x+90] * 5835025 + [x+91] * 4081800 + [x+92] * 8053232 + [x+93] * 2964170 + [x+94] * -1044045 + [x+95] * 2064609 + [x+96] * -2617382 + [x+97] * 1704641 + [x+98] * 1783278
    return (res)
end