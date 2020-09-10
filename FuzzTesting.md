# Introduction

Fuzz-testing is the process of creating random or semi-random capture files, feeding them into Wireshark or TShark, and looking for crashes or other error conditions. The vast majority of Wireshark's code handles data that has been read directly from a live network or capture file; fuzz-testing helps make sure that it handles this data safely. In particular, the packets created during fuzz-testing are not necessarily well-formed, and Wireshark must be able to deal with these improper packets without crashing or doing anything else illegal.

# Get involved\!

We need as many people fuzz-testing as possible. Everyone has their own valuable set of capture files and preferences which may expose bugs not found in the default configuration. If possible, please use a Git version of Wireshark for fuzz testing (the Git source can be checked out from [here](https://www.wireshark.org/develop.html), or pre-built versions of recent revisions can be downloaded from [here](https://www.wireshark.org/download/automated/)). Make sure to [report](/ReportingBugs) any bug(s) you find, and please attach the fuzzed capture file to the bug report so that the bug can be easily reproduced by others.

# How To Fuzz-Test

Wireshark's source comes with a script (./tools/fuzz-test.sh) which is usually all you need. Simply run it from the root of the source tree and pass it the names of any capture files you want to fuzz-test:

    ./tools/fuzz-test.sh myCapture1.pcap myCapture2.pcap ...

You can, of course, use shell wildcards (e.g. \*.pcap) when specifying your capture files.

This script makes temporary copies of each file and introduces errors in them, then runs each of these edited captures through Tshark with many extra assertions and safety checks enabled. If an error is detected the script will produce as much information as it can and exit. It will leave behind the problematic edited capture file in the current directory, named something like fuzz-2013-01-01-1234.pcap. **Please attach this capture when filing a bug report.**

### Fuzz-Testing on Cygwin (Windows)

Open a Cygwin shell, and move to the directory containing your compiled Wireshark binaries (if you wanted to test an installed version of Wireshark you would use the installation location, usually "/cygdrive/c/Program Files/Wireshark"). Now run fuzz-test.sh from that directory, using the **Cygwin**-style path to your test files:

    /c/Development/Wireshark/wireshark-gtk2$ bash -o igncr ../tools/fuzz-test.sh ~/Desktop/file1.cap ...

  - Don't worry about the warning about ulimit.

  - If you run into problems, try to manually create the 'tmp' folder in the wireshark-gtk2 directory.

  - Be careful if editing the script not to save it with extra Windows line-feed characters, as the script will break. The *dos2unix* command will fix the file if you hit this problem.

# Reproducing Fuzz-Test Failures

Most bugs can be easily reproduced in both Wireshark and TShark by simply loading the fuzzed capture file, however some bugs are harder to reproduce. Perhaps they depend on some subtle behavioural difference between Wireshark and Tshark, or perhaps they only appear when one of the special debugging flags is set.

There is an additional script in the source tree (./tools/test-captures.sh) which exactly emulates the fuzz-testing environment. It sets the same debug flags, it passes Tshark the same arguments, etc. If you're having trouble reproducing an issue, try passing the fuzzed capture to this script:

    ./tools/test-captures.sh fuzz-2013-01-01-1234.pcap

Once you can reproduce the problem, take a look at some [Tips and Tricks](/Development/Tips) for debugging the problem.

It's also worth noting that there are some bugs that will only appear on certain platforms or architectures. If you still can't reproduce the problem, check if your platform is different from the original.

# Other Tools

In addition to the standard fuzz-test.sh script, Wireshark comes with two other tools for fuzz-testing:

  - [randpkt](https://www.wireshark.org/docs/man-pages/randpkt.html) -- creates capture files with completely random data payloads

  - [editcap](http://www.wireshark.org/docs/man-pages/editcap.html) -- introduces errors into normal capture files

The fuzz-test.sh script just uses editcap with some simple arguments and a bit of additional logic. Both programs are worth exploring for more powerful or focused fuzz-testing.

---

Imported from https://wiki.wireshark.org/FuzzTesting on 2020-08-11 23:14:14 UTC
