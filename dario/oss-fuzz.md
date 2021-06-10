# Compile wireshark to reproduce OSS-fuzz testcases

```
cmake -g -DCMAKE_C_COMPILER=clang-10 -DCMAKE_CXX_COMPILER=clang++-10
-DCMAKE_BUILD_TYPE=Debug -DENABLE_ASAN=1 -DENABLE_UBSAN=1 -DENABLE_FUZZER=1 -GNinja ..
ninja all-fuzzers
./run/fuzzshark_ip <testcase>
```