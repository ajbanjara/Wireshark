# Compile wireshark to reproduce OSS-fuzz testcases

```
cmake -g -DCMAKE\_C\_COMPILER=clang-10 -DCMAKE\_CXX\_COMPILER=clang++-10
-DCMAKE\_BUILD\_TYPE=Debug -DENABLE\_ASAN=1 -DENABLE\_UBSAN=1 -DENABLE\_FUZZER=1 -GNinja ..
ninja all-fuzzers
./run/fuzzshark_ip <testcase>
```