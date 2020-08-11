# nettl

A packet capturing tool similar to TShark and [TcpDump](/TcpDump) for the HP-UX version of Unix. Wireshark can read capture files created by `nettl`.

## Example commands

The `-tn all` (short for `-traceon all`) starts the capture of network packets, `-e all` for all interfaces, `-f test` save packets in a file named `test.TRC000` where 000 is a sequence number. The `-tf` parameter (short for `-traceoff`) stops the capture:

``` 
 nettl -tn all -e all -f test
 # wait a while
 nettl -tf -e all
```

## External links

  - [nettl](http://docs.hp.com/en/B2355-90681/nettl.1M.html) man page

  - nettl [examples](http://www.compute-aid.com/nettl.html)

---

Imported from https://wiki.wireshark.org/nettl on 2020-08-11 23:17:16 UTC
