use array::{ArrayTrait, SpanTrait};
use debug::PrintTrait;

use orion::operators::tensor::core::{Tensor, ExtraParams};
use orion::numbers::signed_integer::{integer_trait::IntegerTrait, i32::i32};
use orion::operators::tensor::core::TensorTrait;
use orion::numbers::fixed_point::core::FixedType;
use orion::operators::nn::implementations::impl_nn_i32::NN_i32;
use orion::operators::tensor::implementations::impl_tensor_i32::{Tensor_i32, i32TensorMul, i32TensorDiv, i32TensorSub};


fn fc3(x: Tensor<i32>, y: Tensor<i32>) -> (Tensor<i32>, Tensor<i32>) {
    let sum_x = x.reduce_sum( 0, keepdims:true);
    let sum_y = x.reduce_sum( 0, keepdims:true);
    let sum_xy = x.matmul(@y);
    let sum_xx = x.matmul(@x);
    let sum_yy = y.matmul(@y);

    let mut shape = ArrayTrait::new();
    shape.append(1);
    let mut data = ArrayTrait::new();
    data.append(IntegerTrait::new(x.data.len(), false));
    let mut extra = Option::<ExtraParams>::None(());
    let tensor_len = TensorTrait::new(shape.span(), data.span(), extra);

    let A = (sum_y*sum_xx - sum_x*sum_xy) / (tensor_len *sum_xx - sum_x*sum_x);

    let B =  (tensor_len*sum_xy - sum_x*sum_y) / (tensor_len*sum_xx - sum_x*sum_x);

    return (A,B);

}


#[test]
#[available_gas(2000000000000)]
fn test() {

let mut x = ArrayTrait::new();
x.append(IntegerTrait::new(6, false));
x.append(IntegerTrait::new(8, false));
x.append(IntegerTrait::new(10, false));
x.append(IntegerTrait::new(14, false));
x.append(IntegerTrait::new(18, false));

let mut shape = ArrayTrait::new();
shape.append(5);
let mut extra = Option::<ExtraParams>::None(());
let tensor_x = TensorTrait::new(shape.span(), x.span(), extra);


let mut y = ArrayTrait::new();
y.append(IntegerTrait::new(7, false));
y.append(IntegerTrait::new(9, false));
y.append(IntegerTrait::new(13, false));
y.append(IntegerTrait::new(17, false));
y.append(IntegerTrait::new(18, false));

let mut shape = ArrayTrait::new();
shape.append(5);
let mut extra = Option::<ExtraParams>::None(());
let tensor_y = TensorTrait::new(shape.span(), y.span(), extra);

let (res_a, res_b)  = fc3(tensor_x, tensor_y);


assert( *res_a.data.at(0).mag == 10, 'success_a');
assert( *res_a.data.at(0).sign == true, 'success_a');
assert( *res_b.data.at(0).mag == 1, 'success_b');
assert( *res_b.data.at(0).sign == false, 'success_b');


(*res_a.data.at(0).mag).print();


(*res_b.data.at(0).mag).print();



}