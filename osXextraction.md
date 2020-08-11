**osXextraction**

Note this is a script for people comfortable using Unix and is offered free as is.

If you are creating large captures with wireshark or tshark and are using an older slower machine it can be time consuming to get at the data you want. This script (set up to use Bash in `/bin/bash`, and set up to assume that TShark is installed in `/sw/bin/tshark`, as would be the case if it were installed as a result of installing the Wireshark Fink package on macOS) will process 3 protocols (or more if you want to modify it) and append the chosen file name with the relevant protocol. It would be easy to modify this for things such as a specific IP address etc..

The only macOS-specific aspect in the script is that it assumes that Wireshark was installed by Fink, so it looks for TShark in `/sw/bin`; if you haven't installed it with Fink, or if you're not using macOS, so that it's not in `/sw/bin`, you can change the script appropriately - or you can just say `tshark` rather than `/sw/bin/tshark`, and have it find TShark in your path if the directory containing it is in your path.

It doesn't depend on any features of Bash not implemented by other Bourne-compatible shells, so you can probably replace `/bin/bash` with `/bin/sh`, to make it work with Un\*xes that don't have Bash.

    echo Enter Path_to_File:
    read Path_to_File
    
    echo 
    echo Name and path to Output_File
    read Output_File
    
    /sw/bin/tshark -r "$Path_to_File" -V -R  dns -w "$Output_File dns"
    echo
    echo dns extracted
    echo
    
    /sw/bin/tshark -r "$Path_to_File" -V -R  ssh -w "$Output_File ssh" 
    echo
    echo ssh extracted
    echo
    
    /sw/bin/tshark -r "$Path_to_File" -V -R  arp -w "$Output_File arp"
    echo arp extracted
    echo
    echo "data Extracted Script Done >>>>>>>>>>>>>..................."

---

Imported from https://wiki.wireshark.org/osXextraction on 2020-08-11 23:17:44 UTC
