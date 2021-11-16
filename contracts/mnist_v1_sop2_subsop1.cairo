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

    let res = [x+0] * 2886623 + [x+1] * 1284067 + [x+2] * -4264032 + [x+3] * -7997384 + [x+4] * -11432564 + [x+5] * -7681033 + [x+6] * -2869618 + [x+7] * -2585299 + [x+8] * 3617857 + [x+9] * 4595046 + [x+10] * 765936 + [x+11] * 1653520 + [x+12] * 1056826 + [x+13] * 2249395 + [x+14] * 3530463 + [x+15] * 5549833 + [x+16] * 883976 + [x+17] * 8427460 + [x+18] * 6502391 + [x+19] * 2941498 + [x+20] * 7304081 + [x+21] * 3013391 + [x+22] * -59490 + [x+23] * 3359256 + [x+24] * 5927067 + [x+25] * 6281229 + [x+26] * 2540699 + [x+27] * 5579157 + [x+28] * 6552373 + [x+29] * 6874200 + [x+30] * 11236714 + [x+31] * 9735245 + [x+32] * -210981 + [x+33] * -4950012 + [x+34] * -11292494 + [x+35] * -14000146 + [x+36] * -2913990 + [x+37] * 1781283 + [x+38] * 5268109 + [x+39] * 1757565 + [x+40] * 1940692 + [x+41] * 3820182 + [x+42] * 2679024 + [x+43] * 3738274 + [x+44] * 12512414 + [x+45] * 18470972 + [x+46] * 10766059 + [x+47] * 8188639 + [x+48] * 5800800 + [x+49] * 4554700 + [x+50] * 2446296 + [x+51] * 8876166 + [x+52] * 5023670 + [x+53] * 4205226 + [x+54] * 1539305 + [x+55] * 2160575 + [x+56] * -424060 + [x+57] * -5526864 + [x+58] * -4629141 + [x+59] * 2224451 + [x+60] * 961911 + [x+61] * -10697177 + [x+62] * -21803571 + [x+63] * -17812329 + [x+64] * -7735288 + [x+65] * -1880679 + [x+66] * 3443267 + [x+67] * 1239762 + [x+68] * 2675956 + [x+69] * -1407531 + [x+70] * 3237004 + [x+71] * 553536 + [x+72] * 6848315 + [x+73] * 7961797 + [x+74] * 6190823 + [x+75] * 3461489 + [x+76] * 885117 + [x+77] * -3245465 + [x+78] * -7145848 + [x+79] * 4047819 + [x+80] * 1102845 + [x+81] * 4496269 + [x+82] * -684986 + [x+83] * -6740901 + [x+84] * 3636215 + [x+85] * 228787 + [x+86] * 1559564 + [x+87] * -4032555 + [x+88] * -1830958 + [x+89] * -13634771 + [x+90] * -26091998 + [x+91] * -19670875 + [x+92] * -7863329 + [x+93] * -3897422 + [x+94] * -920710 + [x+95] * 4815130 + [x+96] * 246108 + [x+97] * -262714 + [x+98] * -2499102
    return (res)
end