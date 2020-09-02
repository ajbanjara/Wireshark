Table of contents:

[[_TOC_]]

# WireGuard (WG)

WireGuard is a VPN protocol.

## History

WireGuard was initially started by Jason A. Donenfield in 2015 as a Linux kernel module. As of January 2020, it has been accepted for Linux v5.6. Support for other platforms (macOS, Android, iOS, BSD, and Windows) is provided by a cross-platform wireguard-go implementation.

## Protocol dependencies

  - [UDP](/UDP): WireGuard uses [UDP](/UDP) as its transport protocol. There is no standard port and typically WireGuard is detected through heuristics.

## Wireshark

WireGuard dissection and decryption support was added in Wireshark 3.0 ([Bug 15011](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=15011)).

As of Wireshark 3.2, decryption secrets can be embedded in a pcapng file ([Bug 15571](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=15571)).

## Preference Settings

  - WireGuard static keys (wg.keys): A table of long-term static keys to enable WireGuard peer identification or partial decryption

  - Dissect transport data (wg.dissect\_packet): Whether the IP dissector should dissect decrypted transport data.

  - Key log filename (wg.keylog\_file): The path to the file which contains a list of secrets (see [Key Log Format](/WireGuard#key-log-format))

## Example capture file

The test suite contains two capture samples:

  - <https://gitlab.com/wireshark/wireshark/-/blob/master/test/captures/wireguard-psk.pcap>

  - <https://gitlab.com/wireshark/wireshark/-/blob/master/test/captures/wireguard-ping-tcp.pcap>

Screenshot (with decryption keys configured): <https://twitter.com/Lekensteyn/status/1027938328203669505>

## Display Filter

A complete list of WireGuard display filter fields can be found in the [display filter reference](https://www.wireshark.org/docs/dfref/w/wg.html).

The protocol name is `wg`.

## Capture Filter

To filter WireGuard traffic while capturing, you can use:

`udp[8:4] >= 0x1000000 and udp[8:4] <= 0x4000000`

This filter works like the WireGuard heuristics, it test the first byte for a valid message type (1, 2, 3, or 4), and checks that the next three reserved bytes are zero.

Alternatively if you know the UDP port number, you can filter it like this:

`udp port 51820`

## Key Log Format

Decryption can be enabled by supplying a key log file. This text file must follow the following format:

Every line consists of the key type, equals sign ('='), and the base64-encoded 32-byte key with optional spaces before and in between. The key type is one of `LOCAL_STATIC_PRIVATE_KEY`, `REMOTE_STATIC_PUBLIC_KEY`, `LOCAL_EPHEMERAL_PRIVATE_KEY`, or `PRESHARED_KEY`. This matches the output of [extract-handshakes.sh](https://git.zx2c4.com/WireGuard/tree/contrib/examples/extract-handshakes/README)

A `PRESHARED_KEY` line is linked to a session matched by a previous `LOCAL_EPHEMERAL_PRIVATE_KEY` line.

Warning: `LOCAL_STATIC_PRIVATE_KEY` and potentially `PRESHARED_KEY` are long-term secrets, users SHOULD only store non-production keys, or ensure proper protection of the pcapng file.

## Live capture with decryption support

Wireshark can decrypt WireGuard traffic when appropriate keys are configured.

On Linux, one can use kprobes to tap into the WireGuard kernel module and extract keys for new sessions from memory.

Assuming that your WireGuard traffic goes over the **wlan0** interface using port 51820:

    sudo /path/to/extract-handshakes.sh > wg.keys &
    tshark -i wlan0 -owg.keylog_file:wg.keys -f 'udp port 51820'

Note that the [extract-handshake.sh](https://git.zx2c4.com/wireguard-tools/tree/contrib/extract-handshakes/extract-handshakes.sh) requires a special offsets file which is specific to a kernel configuration.

Step-by-step instructions for these are not yet available for the version merged in Linux v5.6. What you basically have to do is to build offset-finder.c with the headers from [drivers/net/wireguard/](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/wireguard) and kernel headers and config matching your current kernel.

## External links

  - <https://www.wireguard.com/> - Official website

---

Imported from https://wiki.wireshark.org/WireGuard on 2020-08-11 23:27:32 UTC
