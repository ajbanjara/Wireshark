# Maximum Transmission Unit

The MTU is the maximum payload length for a particular transmission media. For example, the MTU for Ethernet is typically 1500 bytes. (The maximum packet length for Ethernet is typically 1518 bytes, but that includes 14 bytes of Ethernet header and 4 bytes of CRC, leaving 1500 bytes of payload.) If a host wishes to send packet larger than the MTU for a network, the packet must be broken up into chunks no larger than the MTU.

The smallest MTU between two hosts is known as the **path MTU**.

*\[ Need some text on PMTU discovery, MTU-vs-MRU \]*

## Common MTU Values

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>Value</strong></p></td>
<td><p><strong>Link Type</strong></p></td>
</tr>
<tr class="even">
<td><p>65535</p></td>
<td><p>PPP max, Hyperchannel</p></td>
</tr>
<tr class="odd">
<td><p>17914</p></td>
<td><p>16 Mbps Token Ring</p></td>
</tr>
<tr class="even">
<td><p>4464</p></td>
<td><p>4 Mbps Token Ring</p></td>
</tr>
<tr class="odd">
<td><p>1500</p></td>
<td><p>Ethernet, PPP default</p></td>
</tr>
<tr class="even">
<td><p>1492</p></td>
<td><p>IEEE 802.3/802.2</p></td>
</tr>
<tr class="odd">
<td><p>1480</p></td>
<td><p>PPPoE</p></td>
</tr>
<tr class="even">
<td><p>1460</p></td>
<td><p>L2TP</p></td>
</tr>
<tr class="odd">
<td><p>1454</p></td>
<td><p>Optimal PPPoE-over-DSL MTU (see <a href="http://www.mynetwatchman.com/kb/adsl/pppoemtu.htm" class="http">http://www.mynetwatchman.com/kb/adsl/pppoemtu.htm</a> for details)</p></td>
</tr>
<tr class="even">
<td><p>1372</p></td>
<td><p>PPTP (PPP/GRE/IP) default, Windows XP</p></td>
</tr>
<tr class="odd">
<td><p>576</p></td>
<td><p>X.25, default for many SLIP implementations</p></td>
</tr>
</tbody>
</table>

</div>

## Setting MTU Values

### UNIX/Linux

To set MTU values, use the **ifconfig** command on many OSes.

``` 
 ifconfig <interface> mtu <value>
```

The **ifconfig** command might also report the MTU along with other information about the interface.

``` 
 ifconfig <interface>
```

### Windows

Getting your MTU value can be done using trial and error using the **ping** command.

    C:\>ping 10.1.1.1 -f -l 1373
    Pinging 10.1.1.1 with 1373 bytes of data:
    Packet needs to be fragmented but DF set.
    Packet needs to be fragmented but DF set.
    Packet needs to be fragmented but DF set.
    Packet needs to be fragmented but DF set.
    Ping statistics for 10.1.1.1:
        Packets: Sent = 4, Received = 0, Lost = 4 (100% loss),
    C:\>ping 10.1.1.1 -f -l 1372
    Pinging 10.1.1.1 with 1372 bytes of data:
    Reply from 10.1.1.1: bytes=1372 time=53ms TTL=254
    Reply from 10.1.1.1: bytes=1372 time=56ms TTL=254
    Reply from 10.1.1.1: bytes=1372 time=56ms TTL=254
    Reply from 10.1.1.1: bytes=1372 time=54ms TTL=254
    Ping statistics for 10.1.1.1:
        Packets: Sent = 4, Received = 4, Lost = 0 (0% loss),
    Approximate round trip times in milli-seconds:
        Minimum = 53ms, Maximum = 56ms, Average = 54ms

Setting your MTU value can be done using the registry. See KB article [158474](http://support.microsoft.com/default.aspx?scid=kb;en-us;158474) for more details.

See also [RFC 1191](http://www.ietf.org/rfc/rfc1191.txt) for a table of common MTUs.

---

Imported from https://wiki.wireshark.org/MTU on 2020-08-11 23:17:01 UTC
