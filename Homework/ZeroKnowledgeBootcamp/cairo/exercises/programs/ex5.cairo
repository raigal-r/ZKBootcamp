// Implement a funcion that returns:
// - 1 when magnitudes of inputs are equal
// - 0 otherwise

from starkware.cairo.common.bitwise import bitwise_operations

func abs_eq(x: felt, y: felt) -> (bit: felt) {

    if (x == y){
        return (bit=1);
    } 
    if (x == -y) {
        return (bit=1);
    } else {
        return (bit=0);
    }
}
