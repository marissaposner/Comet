# Comet

![image](https://github.com/marissaposner/Comet/assets/46746064/4ba44d96-29f3-4adf-8376-54a21c84caf4)

## Goal: 

Train a ML model on-chain to prove that the model you claim to have used to train some data is the actual model you used.

## Limitations: 

Due to the fact that Cairo 1.0 does not support loops, we have to train the model in one iteration (for a potential solution to this problem, see TO DO section number 1) 

This restricts us in the type of models we can work with, so we choose a linear regression for our PoC 

After we wrote our training logic in Cairo 1.0, we wanted to use the Cairo Playground to compile our training script. However, the Cairo Playground only supports Cairo 0 which Orion does not support (Orion supports Cairo 1.0) 

Since we could not use the playground, we wrote a local Cairo file for training. This file could then be passed to a Prover (we were considering the Lambda prover since it can be executed locally to generate proof for a given Cairo script). Additionally, the Lambda prover can also verify the proofs, thus allowing us to verify that our model training has been performed correctly.


In the future, the idea would be to include the train logic into a smart contract, to make training composable with other pieces of the Starknet ecosystem. We have deployed sample smart contracts to Starknet using Scarb, which would be expanded to include additional functions (train, verify).



## To Do within Scope: 

How to do iterative training with Cairo 

In order to make training possible for more advanced models using iterative steps you’d have to do the following. 

Write the training logic in Cairo 1
Write a wrapper for the model in Rust 
For each iteration, store the weights and biases of the model in a database 
Call the weights and biases via the Rust code to feed it into the Cairo script until training is finished 


Limitations with this: How do you prove that you have not tempered with the weights and biases that you stored in the database using rust? 



## To Do for Starknet Team: 

Support Cairo 1.0 in the Cairo Playground 


## To Do for Giza Team 

Support Orion Dependencies in the Cairo 1.0 Playground once it is ready 


## Future work outside the scope: 

The really cool problem we want to solve long-term is to not only prove that you have used a certain model for training, but that you can proof that you used a specific dataset for training a specific model. For this you need “contextual proofs”, since the two proofs (you proof you used the data and you proof that you used the specified model) need to be dependent of each other. 



## Use Case: 

There have been cases where models generate legal documents claiming to have been trained for this purpose. However, the legal documents the model provided were wrong, since they haven’t actually been trained on the data the providers claimed to have used.
