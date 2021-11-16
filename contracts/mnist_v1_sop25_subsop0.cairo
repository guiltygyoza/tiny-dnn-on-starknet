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

    let res = [x+0] * 4883000 + [x+1] * 3111937 + [x+2] * 3428053 + [x+3] * 4185359 + [x+4] * 983766 + [x+5] * 5018348 + [x+6] * 2743419 + [x+7] * 2787667 + [x+8] * 1381737 + [x+9] * -1959424 + [x+10] * -427768 + [x+11] * 2877091 + [x+12] * 457907 + [x+13] * 1748897 + [x+14] * 1311432 + [x+15] * -1547317 + [x+16] * -331801 + [x+17] * 3633090 + [x+18] * 1023117 + [x+19] * -1341334 + [x+20] * 3501761 + [x+21] * 1232668 + [x+22] * 3862966 + [x+23] * 4272290 + [x+24] * -1615669 + [x+25] * 5123388 + [x+26] * 441140 + [x+27] * 1787526 + [x+28] * 1485647 + [x+29] * 3058766 + [x+30] * 3105574 + [x+31] * 5085723 + [x+32] * -1896958 + [x+33] * 430031 + [x+34] * 3024731 + [x+35] * 5258676 + [x+36] * 40949 + [x+37] * 1341658 + [x+38] * 5856541 + [x+39] * 3361777 + [x+40] * 167608 + [x+41] * 236504 + [x+42] * 5233851 + [x+43] * 551654 + [x+44] * 900976 + [x+45] * -1062407 + [x+46] * -1508243 + [x+47] * 1079267 + [x+48] * 5305173 + [x+49] * -1113643 + [x+50] * 5157503 + [x+51] * 3993379 + [x+52] * 2123769 + [x+53] * -766817 + [x+54] * 144412 + [x+55] * 2972648 + [x+56] * 4059957 + [x+57] * -628003 + [x+58] * 4765301 + [x+59] * -1302415 + [x+60] * 3345839 + [x+61] * -722744 + [x+62] * 4757458 + [x+63] * 1233534 + [x+64] * 7528514 + [x+65] * 6654578 + [x+66] * 8405017 + [x+67] * 7109437 + [x+68] * 9852456 + [x+69] * 10215248 + [x+70] * 11952537 + [x+71] * 17112141 + [x+72] * 18842561 + [x+73] * 14154595 + [x+74] * 16061328 + [x+75] * 11179243 + [x+76] * 10727443 + [x+77] * 9460342 + [x+78] * 1038135 + [x+79] * 3347015 + [x+80] * 1694872 + [x+81] * 3014235 + [x+82] * 3228769 + [x+83] * 3542345 + [x+84] * -883919 + [x+85] * 3556428 + [x+86] * 2720857 + [x+87] * 1832173 + [x+88] * 2963333 + [x+89] * 1977635 + [x+90] * 1433098 + [x+91] * 4510340 + [x+92] * 7137329 + [x+93] * 10414282 + [x+94] * 2444932 + [x+95] * 3638501 + [x+96] * -1664845 + [x+97] * -2890759 + [x+98] * -164463
    return (res)
end