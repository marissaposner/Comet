
use orion::operators::nn::implementations::impl_nn_i32::NN_i32;
use orion::operators::tensor::implementations::impl_tensor_u32::Tensor_u32;

#[starknet::interface]
trait ISimpleStorage<TContractState> {
    fn set(ref self: TContractState, x: u128);
    fn get(self: @TContractState) -> u128;
}

#[starknet::contract]
mod SimpleStorage {
    use starknet::get_caller_address;
    use starknet::ContractAddress;

    #[storage]
    struct Storage {
        stored_data: u128
    }

    #[external(v0)]
    impl SimpleStorage of super::ISimpleStorage<ContractState> {

        fn set(ref self: ContractState, x: u128) {
            self.stored_data.write(x);
            // ToDo - Add model training here
            // ToDo - Generate proof for training
            // ToDo - Average weights
            // ToDo - Store weights in contract
        }
        fn get(self: @ContractState) -> u128 {
            self.stored_data.read()
            // get weights
            // ToDo - Build tensor structure
        }
    }
}