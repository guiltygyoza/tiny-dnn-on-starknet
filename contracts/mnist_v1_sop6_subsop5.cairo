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

    let res = [x+0] * 6323528 + [x+1] * 3181517 + [x+2] * -4590269 + [x+3] * 2536918 + [x+4] * 1713570 + [x+5] * 2013862 + [x+6] * 2682934 + [x+7] * -12637916 + [x+8] * -10569167 + [x+9] * -4564049 + [x+10] * -5384266 + [x+11] * 1001651 + [x+12] * 12487464 + [x+13] * 14629347 + [x+14] * 23438996 + [x+15] * 26221051 + [x+16] * -523823 + [x+17] * -24467991 + [x+18] * -15338808 + [x+19] * 2315422 + [x+20] * -5210007 + [x+21] * 835631 + [x+22] * -5416387 + [x+23] * -4785251 + [x+24] * -3600482 + [x+25] * -3211487 + [x+26] * 2688118 + [x+27] * -305327 + [x+28] * 1346461 + [x+29] * 1027794 + [x+30] * -5036882 + [x+31] * -1768133 + [x+32] * -2011706 + [x+33] * 3636071 + [x+34] * 1263903 + [x+35] * -14615869 + [x+36] * -12780293 + [x+37] * -7255534 + [x+38] * -3127794 + [x+39] * 10425595 + [x+40] * 16710194 + [x+41] * 9977436 + [x+42] * 28052404 + [x+43] * 20183596 + [x+44] * -6724789 + [x+45] * -16894613 + [x+46] * -5890302 + [x+47] * 9870493 + [x+48] * 4831771 + [x+49] * -1832522 + [x+50] * -2443822 + [x+51] * -5001142 + [x+52] * -6556186 + [x+53] * -3205815 + [x+54] * 560720 + [x+55] * -586711 + [x+56] * -1206332 + [x+57] * -290591 + [x+58] * 64906 + [x+59] * -13128 + [x+60] * 1355557 + [x+61] * -1109805 + [x+62] * -2000274 + [x+63] * -8359152 + [x+64] * -12622816 + [x+65] * -6640581 + [x+66] * -3174807 + [x+67] * -205236 + [x+68] * -1292769 + [x+69] * 7023547 + [x+70] * 20074512 + [x+71] * 16082732 + [x+72] * 5556683 + [x+73] * -13479582 + [x+74] * 828502 + [x+75] * 15545713 + [x+76] * 4272418 + [x+77] * -5536408 + [x+78] * -4411549 + [x+79] * -3818472 + [x+80] * -3686283 + [x+81] * -3525722 + [x+82] * -2103693 + [x+83] * -5987066 + [x+84] * -3409042 + [x+85] * 3637737 + [x+86] * 1626227 + [x+87] * 1528734 + [x+88] * 2163055 + [x+89] * 162015 + [x+90] * -124494 + [x+91] * -2128923 + [x+92] * -9525606 + [x+93] * 1070777 + [x+94] * 1355661 + [x+95] * 10279541 + [x+96] * -6338692 + [x+97] * -2599370 + [x+98] * 12292956
    return (res)
end