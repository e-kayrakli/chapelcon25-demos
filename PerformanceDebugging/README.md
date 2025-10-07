

## Experiments We Will Do for Performance Debugging

### Prep
1. Build Chapel in quickstart setting

### Experiment 1a -- Impact of `--fast` on Performance

1. Compile:
   `chpl 00-fast-flag/fastDemo1.chpl`
2. Run the following and record the reported `total` time.
   `time ./fastDemo1 --n=100_000_000`
3. Now use the `--fast` flag and compile again:
   `chpl 00-fast-flag/fastDemo1.chpl --fast`
4. Run the following and record the reported `total` time.
   `time ./fastDemo1 --n=100_000_000`

### Experiment 1b -- Impact of `--fast` on Debuggability

1. Compile with fast:
   `chpl 00-fast-flag/fastDemo2.chpl`
2. Observe the behavior. Likely outcomes:
    - Segmentation Fault
    - coredump
    - Silent failure (program might exit gracefully, but you just read junk from
                      memory)
3. Compile without fast:
   `chpl 00-fast-flag/fastDemo2.chpl --fast`
4. Observe the output. Much nicer and helpful error message.

### Experiment 2 -- Impact of Environment

### Prep
1. Build Chapel in standard setting


### 
1. Compile with fast:
   `chpl 01-env/envDemo.chpl --fast`
2. Run the following and record the reported `total` time.
   `time ./envDemo1 --n=100_000_000`

### Experiment 3 -- Understanding Bottlenecks


### Further Reading
- Take a look at StencilDist -- it can reduce the communication even further and
  improve performance & scalability.
