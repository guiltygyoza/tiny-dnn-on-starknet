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

    let res = -18474921 + [x+0] * -10193488 + [x+1] * -43642637 + [x+2] * 13475437 + [x+3] * -32012036 + [x+4] * -37106144 + [x+5] * 7742156 + [x+6] * -37217560 + [x+7] * -16563737 + [x+8] * -331898 + [x+9] * -27062159 + [x+10] * -42743331 + [x+11] * -48300328 + [x+12] * -24060702 + [x+13] * 4661953 + [x+14] * 13753093 + [x+15] * -42947068 + [x+16] * -40436524 + [x+17] * -10283598 + [x+18] * -54855769 + [x+19] * 3454768 + [x+20] * 24142086 + [x+21] * 4493349 + [x+22] * -79356902 + [x+23] * -46683162 + [x+24] * 12817890 + [x+25] * -39831143 + [x+26] * -32093915 + [x+27] * -20634178 + [x+28] * -8907625 + [x+29] * 1539367 + [x+30] * -58164829 + [x+31] * 2069568
    return (res)
end