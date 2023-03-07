from starkware.cairo.common.uint256 import Uint256, uint256_add

// Modify both functions so that they increment
// supplied value and return it
func add_one(y: felt) -> (val: felt) {

    alloc_locals;
    local num1 = 1;
    local y_local = y + num1;
   
    return (y_local,);
}


func add_one_U256{range_check_ptr}(y: Uint256) -> (val: Uint256) {
    alloc_locals;
    local num1 : Uint256 = Uint256(low=1,high=0);
    local num2 : Uint256 = Uint256(low=y.low, high=y.high);
    local y_low = num1.low + y.low;
    local y_high = num1.high + y.high;
    return(Uint256(y_low, y_high),);

}
