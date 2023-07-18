Feedback to lambda works

-> Some indentation problem stopped me from generating proofs

```
warning: unused manifest key: bench.0.metal
warning: unused manifest key: bench.1.metal
warning: unused manifest key: bench.2.metal
    Finished dev [unoptimized + debuginfo] target(s) in 0.09s
     Running `target/debug/lambdaworks-stark prove main.cairo main.cairo.json`
Running program on CairoVM and generating trace ...
expected value at line 1 column 1
Error generating prover args
```

-> In the documentation, I see `starknet-compile` but that's not an option when running 
```
cargo run --bin lambdaworks-stark -- ./main.cairo ./main.cairo.json
```