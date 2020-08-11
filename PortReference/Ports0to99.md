## Ports 0 through 99

<div>

<table>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>Port</strong></p></td>
<td><p><strong>Protocol</strong></p></td>
<td><p><strong>Name</strong></p></td>
<td><p><strong>Description</strong></p></td>
</tr>
<tr class="even">
<td><p><span id="A0" class="anchor"></span> 0</p></td>
<td><p>None</p></td>
<td><p>None</p></td>
<td><p>Port 0 is marked "reserved" by IANA. On most (all?) operating systems, trying to bind to port 0 will actually bind to a random ephemeral port. Port 0 should not be seen in normal traffic.</p></td>
</tr>
<tr class="odd">
<td><p><span id="A1" class="anchor"></span> 1</p></td>
<td><p>TCP</p></td>
<td><p>tcpmux</p></td>
<td><p>TCP Port Service Multiplexer (<a href="http://www.ietf.org/rfc/rfc1078.txt" class="http">RFC 1078</a>).</p></td>
</tr>
<tr class="even">
<td><p><span id="A2" class="anchor"></span> 2</p></td>
<td><p>TCP, UDP</p></td>
<td><p>compressnet</p></td>
<td><p>Management Utility</p></td>
</tr>
<tr class="odd">
<td><p><span id="A3" class="anchor"></span> 3</p></td>
<td><p>TCP, UDP</p></td>
<td><p>compressnet</p></td>
<td><p>Compression Process</p></td>
</tr>
<tr class="even">
<td><p><span id="A4" class="anchor"></span> 4</p></td>
<td></td>
<td><p>Unassigned</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p><span id="A5" class="anchor"></span> 5</p></td>
<td><p>TCP, UDP</p></td>
<td><p>rje</p></td>
<td><p>Remote Job Entry</p></td>
</tr>
<tr class="even">
<td><p><span id="A6" class="anchor"></span> 6</p></td>
<td></td>
<td><p>Unassigned</p></td>
<td><p>Unassigned</p></td>
</tr>
<tr class="odd">
<td><p><span id="A7" class="anchor"></span> 7</p></td>
<td><p>TCP, UDP</p></td>
<td><p>echo</p></td>
<td><p><a href="/EchoProtocol" class="nonexistent">EchoProtocol</a> (<a href="http://www.ietf.org/rfc/rfc862.txt" class="http">RFC 862</a>)</p></td>
</tr>
<tr class="even">
<td><p><span id="A8" class="anchor"></span> 8</p></td>
<td></td>
<td><p>Unassigned</p></td>
<td><p>Unassigned</p></td>
</tr>
<tr class="odd">
<td><p><span id="A9" class="anchor"></span> 9</p></td>
<td><p>TCP, UDP</p></td>
<td><p>discard, sink, null</p></td>
<td><p><a href="/DiscardProtocol">DiscardProtocol</a> (<a href="http://www.ietf.org/rfc/rfc863.txt" class="http">RFC 863</a>)</p></td>
</tr>
<tr class="even">
<td><p><span id="A10" class="anchor"></span> 10</p></td>
<td></td>
<td><p>Unassigned</p></td>
<td><p>Unassigned</p></td>
</tr>
<tr class="odd">
<td><p><span id="A11" class="anchor"></span> 11</p></td>
<td><p>TCP, UDP</p></td>
<td><p>systat, users</p></td>
<td><p><a href="/ActiveUsersProtocol" class="nonexistent">ActiveUsersProtocol</a> (<a href="http://www.ietf.org/rfc/rfc866.txt" class="http">RFC 866</a>)</p></td>
</tr>
<tr class="even">
<td><p><span id="A12" class="anchor"></span> 12</p></td>
<td></td>
<td><p>Unassigned</p></td>
<td><p>Unassigned</p></td>
</tr>
<tr class="odd">
<td><p><span id="A13" class="anchor"></span> 13</p></td>
<td><p>TCP, UDP</p></td>
<td><p>daytime</p></td>
<td><p><a href="/DaytimeProtocol" class="nonexistent">DaytimeProtocol</a> (<a href="http://www.ietf.org/rfc/rfc867.txt" class="http">RFC 867</a>) <em>(This is <strong>not</strong> the same thing as <a href="/NetworkTimeProtocol">NetworkTimeProtocol</a>)</em></p></td>
</tr>
<tr class="even">
<td><p><span id="A14" class="anchor"></span> 14</p></td>
<td></td>
<td><p>Unassigned</p></td>
<td><p>Unassigned</p></td>
</tr>
<tr class="odd">
<td><p><span id="A15" class="anchor"></span> 15</p></td>
<td></td>
<td><p>Unassigned</p></td>
<td><p>Was netstat</p></td>
</tr>
<tr class="even">
<td><p><span id="A16" class="anchor"></span> 16</p></td>
<td></td>
<td><p>Unassigned</p></td>
<td><p>Unassigned</p></td>
</tr>
<tr class="odd">
<td><p><span id="A17" class="anchor"></span> 17</p></td>
<td><p>TCP, UDP</p></td>
<td><p>qotd, quote</p></td>
<td><p><a href="/QuoteOfTheDayProtocol">QuoteOfTheDayProtocol</a> (<a href="http://www.ietf.org/rfc/rfc865.txt" class="http">RFC 865</a>)</p></td>
</tr>
<tr class="even">
<td><p><span id="A18" class="anchor"></span> 18</p></td>
<td><p>TCP, UDP</p></td>
<td><p>msp</p></td>
<td><p><a href="/MessageSendProtocol" class="nonexistent">MessageSendProtocol</a> (<a href="http://www.ietf.org/rfc/rfc1159.txt" class="http">RFC 1159</a>, <a href="http://www.ietf.org/rfc/rfc1312.txt" class="http">RFC 1312</a>)</p></td>
</tr>
<tr class="odd">
<td><p><span id="A19" class="anchor"></span> 19</p></td>
<td><p>TCP, UDP</p></td>
<td><p>chargen, ttytst, source</p></td>
<td><p><a href="/CharacterGeneratorProtocol" class="nonexistent">CharacterGeneratorProtocol</a> (<a href="http://www.ietf.org/rfc/rfc864.txt" class="http">RFC 864</a>)</p></td>
</tr>
<tr class="even">
<td><p><span id="A20" class="anchor"></span> 20</p></td>
<td><p>TCP</p></td>
<td><p>ftp-data</p></td>
<td><p>Default <a href="/FTP">FTP</a> data port</p></td>
</tr>
<tr class="odd">
<td><p><span id="A21" class="anchor"></span> 21</p></td>
<td><p>TCP</p></td>
<td><p>ftp</p></td>
<td><p><a href="/FileTransferProtocol">FileTransferProtocol</a> (<a href="http://www.ietf.org/rfc/rfc959.txt" class="http">RFC 959</a>)</p></td>
</tr>
<tr class="even">
<td><p><span id="A22" class="anchor"></span> 22</p></td>
<td><p>TCP</p></td>
<td><p>ssh</p></td>
<td><p><a href="/SecureShell" class="nonexistent">SecureShell</a> (<a href="http://www.ietf.org/ids.by.wg/secsh.html" class="http">draft</a>)</p></td>
</tr>
<tr class="odd">
<td><p><span id="A23" class="anchor"></span> 23</p></td>
<td><p>TCP</p></td>
<td><p>telnet</p></td>
<td><p><a href="/Telnet">Telnet</a> (<a href="http://www.ietf.org/rfc/rfc854.txt" class="http">RFC 854</a>)</p></td>
</tr>
<tr class="even">
<td><p><span id="A24" class="anchor"></span> 24</p></td>
<td><p>TCP, UDP</p></td>
<td><p>Reserved</p></td>
<td><p>Any private mail system</p></td>
</tr>
<tr class="odd">
<td><p><span id="A25" class="anchor"></span> 25</p></td>
<td><p>TCP</p></td>
<td><p>smtp</p></td>
<td><p><a href="/SimpleMailTransferProtocol">SimpleMailTransferProtocol</a> (<a href="http://www.ietf.org/rfc/rfc2821.txt" class="http">RFC 2821</a>)</p></td>
</tr>
<tr class="even">
<td><p><span id="A26" class="anchor"></span> 26</p></td>
<td></td>
<td><p>Unassigned</p></td>
<td><p>Unassigned</p></td>
</tr>
<tr class="odd">
<td><p><span id="A27" class="anchor"></span> 27</p></td>
<td><p>TCP, UDP</p></td>
<td><p>nsw-fe</p></td>
<td><p>NSW User System FE</p></td>
</tr>
<tr class="even">
<td><p><span id="A28" class="anchor"></span> 28</p></td>
<td></td>
<td><p>Unassigned</p></td>
<td><p>Unassigned</p></td>
</tr>
<tr class="odd">
<td><p><span id="A29" class="anchor"></span> 29</p></td>
<td><p>TCP, UDP</p></td>
<td><p>msg-icp</p></td>
<td><p>MSG ICP</p></td>
</tr>
<tr class="even">
<td><p><span id="A30" class="anchor"></span> 30</p></td>
<td></td>
<td><p>Unassigned</p></td>
<td><p>Unassigned</p></td>
</tr>
<tr class="odd">
<td><p><span id="A31" class="anchor"></span> 31</p></td>
<td><p>TCP, UDP</p></td>
<td><p>msg-auth</p></td>
<td><p>MSG Authentication</p></td>
</tr>
<tr class="even">
<td><p><span id="A32" class="anchor"></span> 32</p></td>
<td></td>
<td><p>Unassigned</p></td>
<td><p>Unassigned</p></td>
</tr>
<tr class="odd">
<td><p><span id="A33" class="anchor"></span> 33</p></td>
<td><p>TCP, UDP</p></td>
<td><p>dsp</p></td>
<td><p>Display Support Protocol</p></td>
</tr>
<tr class="even">
<td><p><span id="A34" class="anchor"></span> 34</p></td>
<td></td>
<td><p>Unassigned</p></td>
<td><p>Unassigned</p></td>
</tr>
<tr class="odd">
<td><p><span id="A35" class="anchor"></span> 35</p></td>
<td><p>TCP, UDP</p></td>
<td><p>Reserved</p></td>
<td><p>Any private printer server</p></td>
</tr>
<tr class="even">
<td><p><span id="A36" class="anchor"></span> 36</p></td>
<td></td>
<td><p>Unassigned</p></td>
<td><p>Unassigned</p></td>
</tr>
<tr class="odd">
<td><p><span id="A37" class="anchor"></span> 37</p></td>
<td><p>TCP, UDP</p></td>
<td><p>time, timeserver</p></td>
<td><p><a href="/TimeProtocol" class="nonexistent">TimeProtocol</a> (<a href="http://www.ietf.org/rfc/rfc868.txt" class="http">RFC 868</a>) <em>(This is <strong>not</strong> the same thing as <a href="/NetworkTimeProtocol">NetworkTimeProtocol</a>)</em></p></td>
</tr>
<tr class="even">
<td><p><span id="A38" class="anchor"></span> 38</p></td>
<td><p>TCP, UDP</p></td>
<td><p>rap</p></td>
<td><p><a href="/RouteAccessProtocol" class="nonexistent">RouteAccessProtocol</a> (<a href="http://www.ietf.org/rfc/rfc1476.txt" class="http">RFC 1476</a>)</p></td>
</tr>
<tr class="odd">
<td><p><span id="A39" class="anchor"></span> 39</p></td>
<td><p>UDP</p></td>
<td><p>rlp</p></td>
<td><p><a href="/ResourceLocationProtocol" class="nonexistent">ResourceLocationProtocol</a> (<a href="http://www.ietf.org/rfc/rfc887.txt" class="http">RFC 887</a>)</p></td>
</tr>
<tr class="even">
<td><p><span id="A40" class="anchor"></span> 40</p></td>
<td></td>
<td><p>Unassigned</p></td>
<td><p>Unassigned</p></td>
</tr>
<tr class="odd">
<td><p><span id="A41" class="anchor"></span> 41</p></td>
<td><p>TCP, UDP</p></td>
<td><p>grapics</p></td>
<td><p>Graphics</p></td>
</tr>
<tr class="even">
<td><p><span id="A42" class="anchor"></span> 42</p></td>
<td><p>UDP</p></td>
<td><p>nameserver</p></td>
<td><p>Internet Name Server (<a href="http://www.isi.edu/in-notes/ien/ien116.txt" class="http">IEN 116</a>)</p></td>
</tr>
<tr class="odd">
<td><p><span id="A43" class="anchor"></span> 43</p></td>
<td><p>TCP</p></td>
<td><p>whois, nicname</p></td>
<td><p><a href="/WhoisProtocol" class="nonexistent">WhoisProtocol</a> (<a href="http://www.ietf.org/rfc/rfc954.txt" class="http">RFC 954</a>)</p></td>
</tr>
<tr class="even">
<td><p><span id="A44" class="anchor"></span> 44</p></td>
<td><p>TCP, UDP</p></td>
<td><p>mpm-flags</p></td>
<td><p>MPM FLAGS Protocol</p></td>
</tr>
<tr class="odd">
<td><p><span id="A45" class="anchor"></span> 45</p></td>
<td><p>TCP, UDP</p></td>
<td><p>mpm</p></td>
<td><p>Message Processing Module [recv]</p></td>
</tr>
<tr class="even">
<td><p><span id="A46" class="anchor"></span> 46</p></td>
<td><p>TCP, UDP</p></td>
<td><p>mpm-snd</p></td>
<td><p>MPM [default send]</p></td>
</tr>
<tr class="odd">
<td><p><span id="A47" class="anchor"></span> 47</p></td>
<td><p>TCP, UDP</p></td>
<td><p>ni-ftp</p></td>
<td><p>NI FTP</p></td>
</tr>
<tr class="even">
<td><p><span id="A48" class="anchor"></span> 48</p></td>
<td><p>TCP, UDP</p></td>
<td><p>auditd</p></td>
<td><p>Digital Audit Daemon</p></td>
</tr>
<tr class="odd">
<td><p><span id="A49" class="anchor"></span> 49</p></td>
<td><p>TCP, UDP</p></td>
<td><p>tacacs</p></td>
<td><p><a href="/TacacsProtocol" class="nonexistent">TacacsProtocol</a> (<a href="http://www.ietf.org/rfc/rfc1492.txt" class="http">RFC 1492</a>)</p></td>
</tr>
<tr class="even">
<td><p><span id="A50" class="anchor"></span> 50</p></td>
<td><p>TCP, UDP</p></td>
<td><p>re-mail-ck</p></td>
<td><p>Remote Mail Checking Protocol (<a href="http://www.ietf.org/rfc/rfc1492.txt" class="http">RFC 1339</a>)</p></td>
</tr>
<tr class="odd">
<td><p><span id="A51" class="anchor"></span> 51</p></td>
<td><p>TCP, UDP</p></td>
<td><p>la-maint</p></td>
<td><p>IMP Logical Address Maintenance</p></td>
</tr>
<tr class="even">
<td><p><span id="A52" class="anchor"></span> 52</p></td>
<td><p>TCP, UDP</p></td>
<td><p>xns-time</p></td>
<td><p>XNS Time Protocol</p></td>
</tr>
<tr class="odd">
<td><p><span id="A53" class="anchor"></span> 53</p></td>
<td><p>TCP, UDP</p></td>
<td><p>domain, nameserver</p></td>
<td><p><a href="/DomainNameSystem">DomainNameSystem</a> (<a href="http://www.dns.net/dnsrd/rfc/" class="http">many RFCs</a>)</p></td>
</tr>
<tr class="even">
<td><p><span id="A54" class="anchor"></span> 54</p></td>
<td><p>TCP, UDP</p></td>
<td><p>xns-ch</p></td>
<td><p>XNS Clearinghouse</p></td>
</tr>
<tr class="odd">
<td><p><span id="A55" class="anchor"></span> 55</p></td>
<td><p>TCP, UDP</p></td>
<td><p>isi-gl</p></td>
<td><p>ISI Graphics Language</p></td>
</tr>
<tr class="even">
<td><p><span id="A56" class="anchor"></span> 56</p></td>
<td><p>TCP, UDP</p></td>
<td><p>xns-auth</p></td>
<td><p>XNS Authentication</p></td>
</tr>
<tr class="odd">
<td><p><span id="A57" class="anchor"></span> 57</p></td>
<td><p>TCP, UDP</p></td>
<td><p>Reserved</p></td>
<td><p>Any private terminal access</p></td>
</tr>
<tr class="even">
<td><p><span id="A58" class="anchor"></span> 58</p></td>
<td><p>TCP, UDP</p></td>
<td><p>xns-mail</p></td>
<td><p>XNS Mail</p></td>
</tr>
<tr class="odd">
<td><p><span id="A59" class="anchor"></span> 59</p></td>
<td><p>TCP, UDP</p></td>
<td><p>Reserved</p></td>
<td><p>Any private file service</p></td>
</tr>
<tr class="even">
<td><p><span id="A60" class="anchor"></span> 60</p></td>
<td></td>
<td><p>Unassigned</p></td>
<td><p>Unassigned</p></td>
</tr>
<tr class="odd">
<td><p><span id="A61" class="anchor"></span> 61</p></td>
<td><p>TCP, UDP</p></td>
<td><p>ni-mail</p></td>
<td><p>NI MAIL</p></td>
</tr>
<tr class="even">
<td><p><span id="A62" class="anchor"></span> 62</p></td>
<td><p>TCP, UDP</p></td>
<td><p>acas</p></td>
<td><p>ACA Services <a href="http://h18000.www1.hp.com/info/SP4708/SP4708PF.PDF" class="http">http://h18000.www1.hp.com/info/SP4708/SP4708PF.PDF</a></p></td>
</tr>
<tr class="odd">
<td><p><span id="A63" class="anchor"></span> 63</p></td>
<td><p>TCP, UDP</p></td>
<td><p>whois++</p></td>
<td><p>WHOIS++ (<a href="http://www.ietf.org/rfc/rfc1835.txt" class="http">RFC 1835</a>)</p></td>
</tr>
<tr class="even">
<td><p><span id="A64" class="anchor"></span> 64</p></td>
<td><p>TCP, UDP</p></td>
<td><p>covia</p></td>
<td><p>Communications Integrator</p></td>
</tr>
<tr class="odd">
<td><p><span id="A65" class="anchor"></span> 65</p></td>
<td><p>TCP, UDP</p></td>
<td><p>tacacs-ds</p></td>
<td><p>TACACS Database Service</p></td>
</tr>
<tr class="even">
<td><p><span id="A66" class="anchor"></span> 66</p></td>
<td><p>TCP, UDP</p></td>
<td><p>sql*net</p></td>
<td><p>Oracle SQL*Net</p></td>
</tr>
<tr class="odd">
<td><p><span id="A67" class="anchor"></span> 67</p></td>
<td><p>TCP, UDP</p></td>
<td><p>bootps</p></td>
<td><p><a href="/BootstrapProtocol">BootstrapProtocol</a> Server (often used by <a href="/DHCP">DHCP</a>)</p></td>
</tr>
<tr class="even">
<td><p><span id="A68" class="anchor"></span> 68</p></td>
<td><p>TCP, UDP</p></td>
<td><p>bootpc</p></td>
<td><p><a href="/BootstrapProtocol">BootstrapProtocol</a> Client (often used by <a href="/DHCP">DHCP</a>)</p></td>
</tr>
<tr class="odd">
<td><p><span id="A69" class="anchor"></span> 69</p></td>
<td><p>TCP, UDP</p></td>
<td><p>tftp</p></td>
<td><p><a href="/TrivialFileTransferProtocol">TrivialFileTransferProtocol</a> (<a href="http://www.ietf.org/rfc/rfc1350.txt" class="http">RFC 1350</a>)</p></td>
</tr>
<tr class="even">
<td><p><span id="A70" class="anchor"></span> 70</p></td>
<td><p>TCP, UDP</p></td>
<td><p>gopher</p></td>
<td><p><a href="/GopherProtocol" class="nonexistent">GopherProtocol</a> (<a href="http://www.ietf.org/rfc/rfc1436.txt" class="http">RFC 1436</a>)</p></td>
</tr>
<tr class="odd">
<td><p><span id="A71" class="anchor"></span> 71</p></td>
<td><p>TCP, UDP</p></td>
<td><p>netrjs-1</p></td>
<td><p>Remote Job Service</p></td>
</tr>
<tr class="even">
<td><p><span id="A72" class="anchor"></span> 72</p></td>
<td><p>TCP, UDP</p></td>
<td><p>netrjs-2</p></td>
<td><p>Remote Job Service</p></td>
</tr>
<tr class="odd">
<td><p><span id="A73" class="anchor"></span> 73</p></td>
<td><p>TCP, UDP</p></td>
<td><p>netrjs-3</p></td>
<td><p>Remote Job Service</p></td>
</tr>
<tr class="even">
<td><p><span id="A74" class="anchor"></span> 74</p></td>
<td><p>TCP, UDP</p></td>
<td><p>netrjs-4</p></td>
<td><p>Remote Job Service</p></td>
</tr>
<tr class="odd">
<td><p><span id="A75" class="anchor"></span> 75</p></td>
<td><p>TCP, UDP</p></td>
<td><p>Reserved</p></td>
<td><p>Any private dial out service</p></td>
</tr>
<tr class="even">
<td><p><span id="A76" class="anchor"></span> 76</p></td>
<td><p>TCP, UDP</p></td>
<td><p>deos</p></td>
<td><p>Distributed External Object Store</p></td>
</tr>
<tr class="odd">
<td><p><span id="A77" class="anchor"></span> 77</p></td>
<td><p>TCP, UDP</p></td>
<td><p>Reserved</p></td>
<td><p>Any private RJE service</p></td>
</tr>
<tr class="even">
<td><p><span id="A78" class="anchor"></span> 78</p></td>
<td><p>TCP, UDP</p></td>
<td><p>vettcp</p></td>
<td><p>vettcp</p></td>
</tr>
<tr class="odd">
<td><p><span id="A79" class="anchor"></span> 79</p></td>
<td><p>TCP, UDP</p></td>
<td><p>finger</p></td>
<td><p><a href="/FingerProtocol" class="nonexistent">FingerProtocol</a> (<a href="http://www.ietf.org/rfc/rfc1288.txt" class="http">RFC 1288</a>)</p></td>
</tr>
<tr class="even">
<td><p><span id="A80" class="anchor"></span> 80</p></td>
<td><p>TCP, UDP</p></td>
<td><p>www, http</p></td>
<td><p><a href="/Hyper_Text_Transfer_Protocol">Hyper_Text_Transfer_Protocol</a></p></td>
</tr>
<tr class="odd">
<td><p><span id="A81" class="anchor"></span> 81</p></td>
<td><p>TCP, UDP</p></td>
<td><p>hosts2-ns</p></td>
<td><p>HOSTS2 Name Server<br />
More commonly used as an alternate HTTP port</p></td>
</tr>
<tr class="even">
<td><p><span id="A82" class="anchor"></span> 82</p></td>
<td><p>TCP, UDP</p></td>
<td><p>xfer</p></td>
<td><p>XFER Utility</p></td>
</tr>
<tr class="odd">
<td><p><span id="A83" class="anchor"></span> 83</p></td>
<td><p>TCP, UDP</p></td>
<td><p>mit-ml-dev</p></td>
<td><p>MIT ML Device</p></td>
</tr>
<tr class="even">
<td><p><span id="A84" class="anchor"></span> 84</p></td>
<td><p>TCP, UDP</p></td>
<td><p>ctf</p></td>
<td><p>Common Trace Facility</p></td>
</tr>
<tr class="odd">
<td><p><span id="A85" class="anchor"></span> 85</p></td>
<td><p>TCP, UDP</p></td>
<td><p>mit-ml-dev</p></td>
<td><p>MIT ML Device</p></td>
</tr>
<tr class="even">
<td><p><span id="A86" class="anchor"></span> 86</p></td>
<td><p>TCP, UDP</p></td>
<td><p>mfcobol</p></td>
<td><p>Micro Focus Cobol</p></td>
</tr>
<tr class="odd">
<td><p><span id="A87" class="anchor"></span> 87</p></td>
<td><p>TCP, UDP</p></td>
<td><p>Reserved</p></td>
<td><p>Any private terminal link</p></td>
</tr>
<tr class="even">
<td><p><span id="A88" class="anchor"></span> 88</p></td>
<td><p>TCP, UDP</p></td>
<td><p>kerberos, kerberos5, krb5</p></td>
<td><p><a href="/KerberosProtocol" class="nonexistent">KerberosProtocol</a> (<a href="http://www.ietf.org/rfc/rfc1510.txt" class="http">RFC 1510</a> plus many <a href="http://www.ietf.org/html.charters/krb-wg-charter.html" class="http">drafts</a>)</p></td>
</tr>
<tr class="odd">
<td><p><span id="A89" class="anchor"></span> 89</p></td>
<td><p>TCP, UDP</p></td>
<td><p>su-mit-tg</p></td>
<td><p>SU/MIT Telnet Gateway</p></td>
</tr>
<tr class="even">
<td><p><span id="A90" class="anchor"></span> 90</p></td>
<td><p>TCP, UDP</p></td>
<td><p>dnsix</p></td>
<td><p>DNSIX Security Attribute Token Map<br />
More commonly used by PointCast</p></td>
</tr>
<tr class="odd">
<td><p><span id="A91" class="anchor"></span> 91</p></td>
<td><p>TCP, UDP</p></td>
<td><p>mit-dov</p></td>
<td><p>MIT Dover Spooler</p></td>
</tr>
<tr class="even">
<td><p><span id="A92" class="anchor"></span> 92</p></td>
<td><p>TCP, UDP</p></td>
<td><p>npp</p></td>
<td><p>Network Printing Protocol (<a href="http://www.ietf.org/rfc/rfc1486.txt" class="http">RFC 1486</a>?)</p></td>
</tr>
<tr class="odd">
<td><p><span id="A93" class="anchor"></span> 93</p></td>
<td><p>TCP, UDP</p></td>
<td><p>dcp</p></td>
<td><p>Device Control Protocol</p></td>
</tr>
<tr class="even">
<td><p><span id="A94" class="anchor"></span> 94</p></td>
<td><p>TCP, UDP</p></td>
<td><p>objcall</p></td>
<td><p>Tivoli Object Dispatcher</p></td>
</tr>
<tr class="odd">
<td><p><span id="A95" class="anchor"></span> 95</p></td>
<td><p>TCP, UDP</p></td>
<td><p>supdup</p></td>
<td><p>SUPDUP</p></td>
</tr>
<tr class="even">
<td><p><span id="A96" class="anchor"></span> 96</p></td>
<td><p>TCP, UDP</p></td>
<td><p>dixie</p></td>
<td><p>DIXIE Protocol Specification</p></td>
</tr>
<tr class="odd">
<td><p><span id="A97" class="anchor"></span> 97</p></td>
<td><p>TCP, UDP</p></td>
<td><p>swift-rvf</p></td>
<td><p>Swift Remote Virtural File Protocol</p></td>
</tr>
<tr class="even">
<td><p><span id="A98" class="anchor"></span> 98</p></td>
<td><p>TCP, UDP</p></td>
<td><p>tacnews</p></td>
<td><p>TAC News</p></td>
</tr>
<tr class="odd">
<td><p><span id="A99" class="anchor"></span> 99</p></td>
<td><p>TCP, UDP</p></td>
<td><p>metagram</p></td>
<td><p>Metagram Relay</p></td>
</tr>
</tbody>
</table>

</div>

---

Imported from https://wiki.wireshark.org/PortReference/Ports0to99 on 2020-08-11 23:18:02 UTC
