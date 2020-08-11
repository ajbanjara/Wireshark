# Roofnet (roofnet)

XXX - add a brief Rooofnet description here

## History

XXX - add a brief description of Roofnet history

## Protocol dependencies

  - [Ethernet](/Ethernet): Typically, Roofnet uses [Ethernet](/Ethernet) as its transport protocol.

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The Roofnet dissector is partially functional.

## Preference Settings

The Roofnet dissector currently has no preferences to set.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

  - [SampleCaptures/roofnet.pcap](uploads/__moin_import__/attachments/SampleCaptures/roofnet.pcap "Upload new attachment \"roofnet.pcap\"")

## Display Filter

Show only the Roofnet based traffic:

``` 
 roofnet 
```

## Capture Filter

Capture only the roofnet traffic:

``` 
 ether proto 0x0641 
```

or

``` 
 ether proto 0x0643 
```

or

``` 
 ether proto 0x0644 
```

or

``` 
 ether proto 0x0645 
```

## External links

  - [Roofnet](http://pdos.csail.mit.edu/roofnet/doku.php) MIT Roofnet.

## Discussion

---

Imported from https://wiki.wireshark.org/Roofnet on 2020-08-11 23:24:02 UTC
