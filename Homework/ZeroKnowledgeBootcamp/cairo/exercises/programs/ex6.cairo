from starkware.cairo.common.bitwise import bitwise_and, bitwise_xor
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin
from starkware.cairo.common.math import is_quad_residue, signed_div_rem, unsigned_div_rem
from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.bool import FALSE, TRUE

// Implement a function that sums even numbers from the provided array
func sum_even{bitwise_ptr: BitwiseBuiltin*, range_check_ptr}(arr_len: felt, arr: felt*, run: felt, idx: felt) -> (sum: felt) {
    
    alloc_locals;
    
    local summation = 0;
    local i = 0;
    let (sum) = calculate_sum_even(arr_len, arr, summa=0);
    %{ print(f"my value sum: {ids.sum}") %}
    return (sum,);
}

func calculate_sum_even{range_check_ptr}(arr_len: felt, arr: felt*, summa: felt) -> (sum: felt) {
    alloc_locals;
    
    local summation = summa;

    %{ print(f"my value return summation: {ids.summa}") %}
    %{ print(f"my leng: {ids.arr_len}") %}

    if (arr_len == 0) {
        %{ print(f"he entradi a arr_len==0: {ids.summa}") %}
        return (summa,);
    } 
    if (arr_len != 0) {
        %{ print(f"he entradi a else: {ids.summa}") %}
        local i = arr_len-1;

        let x: felt = arr[i];
        %{ print(f"my value: {ids.x}") %}

        let (q, r) =  unsigned_div_rem(x, 2);
        
        %{ print(f"my remainder: {ids.r}") %}

        if (r == 0) {
            
            let summation = summation + x;
            %{ print(f"my summation: {ids.summation}") %}
            let (sum) = calculate_sum_even(i, arr, summation);
            return(sum,);

        } else {
         
            let (sum) = calculate_sum_even(i, arr, summation);
            return(sum,);
        }
    }
    return(0,);
    

}




