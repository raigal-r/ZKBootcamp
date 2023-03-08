%lang starknet
from starkware.cairo.common.bitwise import bitwise_and, bitwise_xor
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin
from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.math import unsigned_div_rem

// Using binary operations return:
// - 1 when pattern of bits is 01010101 from LSB up to MSB 1, but accounts for trailing zeros
// - 0 otherwise

// 000000101010101 PASS
// 010101010101011 FAIL

func pattern{bitwise_ptr: BitwiseBuiltin*, range_check_ptr}(
    n: felt, idx: felt, exp: felt, broken_chain: felt
) -> (true: felt) {
    // Count the number of trailing zeros in n.
    _, num_trailing_zeros = unsigned_div_rem(n, 2)
    // Shift n right by the number of trailing zeros.
    n = bitwise_and(n >> num_trailing_zeros, 2**(idx + 1) - 1)
    // Check if n matches the specified pattern.
    expected = (2**exp - 1) // 3  # Bit pattern: 01010101...
    is_match = bitwise_xor(n, expected) == 0
    // Return 1 if n matches the pattern, 0 otherwise.
    return (is_match,)
}
