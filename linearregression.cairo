use orion::operators::tensor::core::Tensor;
use orion::numbers::signed_integer::{integer_trait::IntegerTrait, i32::i32};
use orion::operators::tensor::core::TensorTrait;
use orion::numbers::fixed_point::core::FixedType;
use orion::operators::nn::implementations::impl_nn_i32::NN_i32;



fn fc3(x: Tensor<i32>, y: Tensor<i32>) -> Tensor<FixedType>{
    let sum_x = TensorTrait::sum(@x);
    let sum_y = TensorTrait::sum(@y);
    let sum_xy = TensorTrait::x.matmul(@y);
    let sum_xx = TensorTrait::x.matmul(@x);
    let sum_yy = TensorTrait::y.matmul(@y);


    let number_of_records = x.shape;
    let A = (sum_y*sum_xx - sum_x*sum_xy) / (number_of_records *sum_xx - sum_x*sum_x);

    let B =  (number_of_records*sum_xy - sum_x*sum_y) / (number_of_records*sum_xx - sum_x*sum_x);










}


