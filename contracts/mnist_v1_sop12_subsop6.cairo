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

    let res = [x+0] * -5892935 + [x+1] * -6358975 + [x+2] * -3636703 + [x+3] * 589912 + [x+4] * -9819807 + [x+5] * -5870917 + [x+6] * -5989731 + [x+7] * -7191654 + [x+8] * -1912714 + [x+9] * -1799023 + [x+10] * 9468922 + [x+11] * -1657808 + [x+12] * 1024118 + [x+13] * 2471174 + [x+14] * 1013084 + [x+15] * 1292139 + [x+16] * 5706776 + [x+17] * 4955604 + [x+18] * 5016906 + [x+19] * -5401138 + [x+20] * -6199135 + [x+21] * 1008398 + [x+22] * -19605 + [x+23] * -426405 + [x+24] * -335025 + [x+25] * -3746134 + [x+26] * -2677646 + [x+27] * -169906 + [x+28] * -2925395 + [x+29] * -5800921 + [x+30] * -4846530 + [x+31] * -5773268 + [x+32] * -8168245 + [x+33] * 6251232 + [x+34] * -3150888 + [x+35] * -11335694 + [x+36] * -9602040 + [x+37] * -4060387 + [x+38] * -5188655 + [x+39] * 833910 + [x+40] * -2543110 + [x+41] * 5581794 + [x+42] * 1090517 + [x+43] * 4681130 + [x+44] * 6210745 + [x+45] * 5333045 + [x+46] * 1720365 + [x+47] * -364477 + [x+48] * -4328761 + [x+49] * -2627371 + [x+50] * -13634753 + [x+51] * -7831221 + [x+52] * -626593 + [x+53] * -559765 + [x+54] * -634518 + [x+55] * 6942326 + [x+56] * 5374241 + [x+57] * 5320107 + [x+58] * 8160263 + [x+59] * 2443367 + [x+60] * 9904599 + [x+61] * 6721239 + [x+62] * -676654 + [x+63] * -3407813 + [x+64] * -1207792 + [x+65] * -6143527 + [x+66] * -5645779 + [x+67] * 2651271 + [x+68] * 2583802 + [x+69] * 2293091 + [x+70] * 5226501 + [x+71] * 4660118 + [x+72] * 4885806 + [x+73] * 3040110 + [x+74] * 5441956 + [x+75] * 3803 + [x+76] * -6660414 + [x+77] * -10477429 + [x+78] * -13561391 + [x+79] * -10951997 + [x+80] * -3333241 + [x+81] * 911348 + [x+82] * -4949631 + [x+83] * -2525330 + [x+84] * -1654164 + [x+85] * 454846 + [x+86] * -1518337 + [x+87] * 1404367 + [x+88] * 2682394 + [x+89] * 3309733 + [x+90] * 8521457 + [x+91] * 12819796 + [x+92] * 7372777 + [x+93] * 6535187 + [x+94] * 7134738 + [x+95] * 3904670 + [x+96] * 2633677 + [x+97] * 1942513 + [x+98] * 4594800
    return (res)
end