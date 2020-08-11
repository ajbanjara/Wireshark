# Compile wireshark to reproduce OSS-fuzz testcases

cmake -g -DCMAKE\_C\_COMPILER=clang-10 -DCMAKE\_CXX\_COMPILER=clang++-10 -DCMAKE\_BUILD\_TYPE=Debug -DENABLE\_ASAN=1 -DENABLE\_UBSAN=1 -DENABLE\_FUZZER=1 -GNinja ..

---

Imported from https://wiki.wireshark.org/dario/oss-fuzz on 2020-08-11 23:12:30 UTC
