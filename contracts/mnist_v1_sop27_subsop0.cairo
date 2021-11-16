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

    let res = [x+0] * 3837135 + [x+1] * 3027869 + [x+2] * -2083655 + [x+3] * 1484331 + [x+4] * 71189 + [x+5] * -30631 + [x+6] * 1665944 + [x+7] * 1953191 + [x+8] * -1903600 + [x+9] * 168374 + [x+10] * 571418 + [x+11] * 1927527 + [x+12] * 2628122 + [x+13] * -936704 + [x+14] * 1322543 + [x+15] * 3019581 + [x+16] * 3811627 + [x+17] * -221354 + [x+18] * -1251963 + [x+19] * -1824830 + [x+20] * -470609 + [x+21] * -2213169 + [x+22] * 2342032 + [x+23] * -59039 + [x+24] * -1585345 + [x+25] * 337552 + [x+26] * 4591555 + [x+27] * 1668026 + [x+28] * -1549561 + [x+29] * -1554712 + [x+30] * 2291174 + [x+31] * 594554 + [x+32] * -749886 + [x+33] * 3495525 + [x+34] * 5567111 + [x+35] * 1943099 + [x+36] * 3803795 + [x+37] * 1559734 + [x+38] * 3347161 + [x+39] * 3970230 + [x+40] * 7535646 + [x+41] * 9528525 + [x+42] * 1855497 + [x+43] * 2814224 + [x+44] * 7411338 + [x+45] * 5125656 + [x+46] * 4838536 + [x+47] * -1034658 + [x+48] * 3374306 + [x+49] * -133431 + [x+50] * 2989953 + [x+51] * 2558700 + [x+52] * -2011871 + [x+53] * 3229118 + [x+54] * 2814418 + [x+55] * -952246 + [x+56] * 2310453 + [x+57] * -1124013 + [x+58] * 1616087 + [x+59] * 3196134 + [x+60] * -1818448 + [x+61] * 4167264 + [x+62] * 1781020 + [x+63] * 3373624 + [x+64] * 8910784 + [x+65] * 9747345 + [x+66] * 10535009 + [x+67] * 19379214 + [x+68] * 21123521 + [x+69] * 20105844 + [x+70] * 12765617 + [x+71] * 14830857 + [x+72] * 13020260 + [x+73] * 14510510 + [x+74] * 14127601 + [x+75] * 8623207 + [x+76] * 3102544 + [x+77] * 1551038 + [x+78] * 3162757 + [x+79] * 2049187 + [x+80] * -41048 + [x+81] * -734656 + [x+82] * -283358 + [x+83] * 2953950 + [x+84] * 603284 + [x+85] * 1717740 + [x+86] * 2571993 + [x+87] * -1361235 + [x+88] * -1091894 + [x+89] * 4414008 + [x+90] * 832504 + [x+91] * 5538114 + [x+92] * 10780140 + [x+93] * 11883187 + [x+94] * 13892999 + [x+95] * 15467847 + [x+96] * 16671667 + [x+97] * 16129598 + [x+98] * 7544045
    return (res)
end