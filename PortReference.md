## Port Number Reference

[TCP](/TCP), [UDP](/UDP), and [SCTP](/SCTP) all use *port numbers* to identify the logical communications between hosts. The combination of a port and IP address identifies a TCP/UDP/SCTP *[Endpoint](/Endpoint)*, and the endpoint pairs on either end of a "connection" make up a TCP/UDP/SCTP *[Conversation](/Conversation)*.

As the underlying [IP](/IP) protocol can "only" transfer data between two IP hosts, it's often desired to transfer [TCP](/TCP)/[UDP](/UDP) data from more than one application between two IP hosts.

The concept of a TCP/UDP port is to provide several logical channels between the same IP hosts. When sending a packet, TCP/UDP multiplexes the data from separate applications over one IP "host to host transfer". While receiving, TCP/UDP demultiplexes the IP packets again, providing the received data to the applications interested in.

The addressing of this multiplexing/demultiplexing is done using the ports.

-----

Port numbers are unsigned 16-bit integers, ranging from 0 to 65535. The [IANA list of assigned port numbers](http://www.iana.org/assignments/port-numbers) has divided ports into three ranges:

0 through 1023: **Well Known** Ports

1024 through 49151: **Registered** Ports

49152 through 65535: **Dynamic** or **Private** Ports

Ports 1024 and above are also referred to as *ephemeral ports*.

Ports are officially registered with the [IANA](/IANA). Unofficial lists are maintained by many people, including the following:

[Kurt Seifried](http://www.seifried.org/security/ports/)

[s\_ita](http://www.bekkoame.ne.jp/~s_ita/port/port1-99.html)

[Network Sorcery](http://www.networksorcery.com/enp/protocol/ip/ports00000.htm)

[Neohapsis](http://www.neohapsis.com/neolabs/neo-ports/)

[About.com](http://compnetworking.about.com/library/ports/blports_glossary.htm)

[Emsi Software](http://www.emsisoft.com/en/kb/portlist/)

[MAC-NET](http://www.mac-net.com/default.asp/P/534080/S/4)

A local list is maintained below:

<div>

<table>

<tbody>

<tr>

<td>

[0 - 99](/PortReference/Ports0to99)

</div>

</td>

<td>

[100 - 199](/PortReference/Ports100to199)

</td>

<td>

[200 - 299](/PortReference/Ports200to299)

</td>

<td>

[300 - 399](/PortReference/Ports300to399)

</td>

<td>

[400 - 499](/PortReference/Ports400to499)

</td>

</tr>

<tr>

<td>

[500 - 599](/PortReference/Ports500to599)

</td>

<td>

[600 - 699](/PortReference/Ports600to699)

</td>

<td>

[700 - 799](/PortReference/Ports700to799)

</td>

<td>

[800 - 899](/PortReference/Ports800to899)

</td>

<td>

[900 - 999](/PortReference/Ports900to999)

</td>

</tr>

<tr>

<td>

[1000 - 1099](/PortReference/Ports1000to1099)

</td>

<td>

[1100 - 1199](/PortReference/Ports1100to1199)

</td>

<td>

[1200 - 1299](/PortReference/Ports1200to1299)

</td>

<td>

[1300 - 1399](/PortReference/Ports1300to1399)

</td>

<td>

[1400 - 1499](/PortReference/Ports1400to1499)

</td>

</tr>

<tr>

<td>

[1500 - 1599](/PortReference/Ports1500to1599)

</td>

<td>

[1600 - 1699](/PortReference/Ports1600to1699)

</td>

<td>

[1700 - 1799](/PortReference/Ports1700to1799)

</td>

<td>

[1800 - 1899](/PortReference/Ports1800to1899)

</td>

<td>

[1900 - 1999](/PortReference/Ports1900to1999)

</td>

</tr>

<tr>

<td>

[2000 - 2099](/PortReference/Ports2000to2099)

</td>

<td>

[2100 - 2199](/PortReference/Ports2100to2199)

</td>

<td>

[2200 - 2299](/PortReference/Ports2200to2299)

</td>

<td>

[2300 - 2399](/PortReference/Ports2300to2399)

</td>

<td>

[2400 - 2499](/PortReference/Ports2400to2499)

</td>

</tr>

<tr>

<td>

[2500 - 2599](/PortReference/Ports2500to2599)

</td>

<td>

[2600 - 2699](/PortReference/Ports2600to2699)

</td>

<td>

[2700 - 2799](/PortReference/Ports2700to2799)

</td>

<td>

[2800 - 2899](/PortReference/Ports2800to2899)

</td>

<td>

[2900 - 2999](/PortReference/Ports2900to2999)

</td>

</tr>

<tr>

<td>

[3000 - 3099](/PortReference/Ports3000to3099)

</td>

<td>

[3100 - 3199](/PortReference/Ports3100to3199)

</td>

<td>

[3200 - 3299](/PortReference/Ports3200to3299)

</td>

<td>

[3300 - 3399](/PortReference/Ports3300to3399)

</td>

<td>

[3400 - 3499](/PortReference/Ports3400to3499)

</td>

</tr>

<tr>

<td>

[3500 - 3599](/PortReference/Ports3500to3599)

</td>

<td>

[3600 - 3699](/PortReference/Ports3600to3699)

</td>

<td>

[3700 - 3799](/PortReference/Ports3700to3799)

</td>

<td>

[3800 - 3899](/PortReference/Ports3800to3899)

</td>

<td>

[3900 - 3999](/PortReference/Ports3900to3999)

</td>

</tr>

<tr>

<td>

[4000 - 4099](/PortReference/Ports4000to4099)

</td>

<td>

[4100 - 4199](/PortReference/Ports4100to4199)

</td>

<td>

[4200 - 4299](/PortReference/Ports4200to4299)

</td>

<td>

[4300 - 4399](/PortReference/Ports4300to4399)

</td>

<td>

[4400 - 4499](/PortReference/Ports4400to4499)

</td>

</tr>

<tr>

<td>

[4500 - 4599](/PortReference/Ports4500to4599)

</td>

<td>

[4600 - 4699](/PortReference/Ports4600to4699)

</td>

<td>

[4700 - 4799](/PortReference/Ports4700to4799)

</td>

<td>

[4800 - 4899](/PortReference/Ports4800to4899)

</td>

<td>

[4900 - 4999](/PortReference/Ports4900to4999)

</td>

</tr>

<tr>

<td>

[5000 - 5099](/PortReference/Ports5000to5099)

</td>

<td>

[5100 - 5199](/PortReference/Ports5100to5199)

</td>

<td>

[5200 - 5299](/PortReference/Ports5200to5299)

</td>

<td>

[5300 - 5399](/PortReference/Ports5300to5399)

</td>

<td>

[5400 - 5499](/PortReference/Ports5400to5499)

</td>

</tr>

<tr>

<td>

[5500 - 5599](/PortReference/Ports5500to5599)

</td>

<td>

[5600 - 5699](/PortReference/Ports5600to5699)

</td>

<td>

[5700 - 5799](/PortReference/Ports5700to5799)

</td>

<td>

[5800 - 5899](/PortReference/Ports5800to5899)

</td>

<td>

[5900 - 5999](/PortReference/Ports5900to5999)

</td>

</tr>

<tr>

<td>

[6000 - 6099](/PortReference/Ports6000to6099)

</td>

<td>

[6100 - 6199](/PortReference/Ports6100to6199)

</td>

<td>

[6200 - 6299](/PortReference/Ports6200to6299)

</td>

<td>

[6300 - 6399](/PortReference/Ports6300to6399)

</td>

<td>

[6400 - 6499](/PortReference/Ports6400to6499)

</td>

</tr>

<tr>

<td>

[6500 - 6599](/PortReference/Ports6500to6599)

</td>

<td>

[6600 - 6699](/PortReference/Ports6600to6699)

</td>

<td>

[6700 - 6799](/PortReference/Ports6700to6799)

</td>

<td>

[6800 - 6899](/PortReference/Ports6800to6899)

</td>

<td>

[6900 - 6999](/PortReference/Ports6900to6999)

</td>

</tr>

<tr>

<td>

[7000 - 7099](/PortReference/Ports7000to7099)

</td>

<td>

[7100 - 7199](/PortReference/Ports7100to7199)

</td>

<td>

[7200 - 7299](/PortReference/Ports7200to7299)

</td>

<td>

[7300 - 7399](/PortReference/Ports7300to7399)

</td>

<td>

[7400 - 7499](/PortReference/Ports7400to7499)

</td>

</tr>

<tr>

<td>

[7500 - 7599](/PortReference/Ports7500to7599)

</td>

<td>

[7600 - 7699](/PortReference/Ports7600to7699)

</td>

<td>

[7700 - 7799](/PortReference/Ports7700to7799)

</td>

<td>

[7800 - 7899](/PortReference/Ports7800to7899)

</td>

<td>

[7900 - 7999](/PortReference/Ports7900to7999)

</td>

</tr>

<tr>

<td>

[8000 - 8099](/PortReference/Ports8000to8099)

</td>

<td>

[8100 - 8199](/PortReference/Ports8100to8199)

</td>

<td>

[8200 - 8299](/PortReference/Ports8200to8299)

</td>

<td>

[8300 - 8399](/PortReference/Ports8300to8399)

</td>

<td>

[8400 - 8499](/PortReference/Ports8400to8499)

</td>

</tr>

<tr>

<td>

[8500 - 8599](/PortReference/Ports8500to8599)

</td>

<td>

[8600 - 8699](/PortReference/Ports8600to8699)

</td>

<td>

[8700 - 8799](/PortReference/Ports8700to8799)

</td>

<td>

[8800 - 8899](/PortReference/Ports8800to8899)

</td>

<td>

[8900 - 8999](/PortReference/Ports8900to8999)

</td>

</tr>

<tr>

<td>

[9000 - 9099](/PortReference/Ports9000to9099)

</td>

<td>

[9100 - 9199](/PortReference/Ports9100to9199)

</td>

<td>

[9200 - 9299](/PortReference/Ports9200to9299)

</td>

<td>

[9300 - 9399](/PortReference/Ports9300to9399)

</td>

<td>

[9400 - 9499](/PortReference/Ports9400to9499)

</td>

</tr>

<tr>

<td>

[9500 - 9599](/PortReference/Ports9500to9599)

</td>

<td>

[9600 - 9699](/PortReference/Ports9600to9699)

</td>

<td>

[9700 - 9799](/PortReference/Ports9700to9799)

</td>

<td>

[9800 - 9899](/PortReference/Ports9800to9899)

</td>

<td>

[9900 - 9999](/PortReference/Ports9900to9999)

</td>

</tr>

<tr>

<td>

[10000 - 10099](/PortReference/Ports10000to10099)

</td>

<td>

[10100 - 10199](/PortReference/Ports10100to10199)

</td>

<td>

[10200 - 10299](/PortReference/Ports10200to10299)

</td>

<td>

[10300 - 10399](/PortReference/Ports10300to10399)

</td>

<td>

[10400 - 10499](/PortReference/Ports10400to10499)

</td>

</tr>

<tr>

<td>

[10500 - 10599](/PortReference/Ports10500to10599)

</td>

<td>

[10600 - 10699](/PortReference/Ports10600to10699)

</td>

<td>

[10700 - 10799](/PortReference/Ports10700to10799)

</td>

<td>

[10800 - 10899](/PortReference/Ports10800to10899)

</td>

<td>

[10900 - 10999](/PortReference/Ports10900to10999)

</td>

</tr>

<tr>

<td>

[11000 - 11099](/PortReference/Ports11000to11099)

</td>

<td>

[11100 - 11199](/PortReference/Ports11100to11199)

</td>

<td>

[11200 - 11299](/PortReference/Ports11200to11299)

</td>

<td>

[11300 - 11399](/PortReference/Ports11300to11399)

</td>

<td>

[11400 - 11499](/PortReference/Ports11400to11499)

</td>

</tr>

<tr>

<td>

[11500 - 11599](/PortReference/Ports11500to11599)

</td>

<td>

[11600 - 11699](/PortReference/Ports11600to11699)

</td>

<td>

[11700 - 11799](/PortReference/Ports11700to11799)

</td>

<td>

[11800 - 11899](/PortReference/Ports11800to11899)

</td>

<td>

[11900 - 11999](/PortReference/Ports11900to11999)

</td>

</tr>

<tr>

<td>

[12000 - 12099](/PortReference/Ports12000to12099)

</td>

<td>

[12100 - 12199](/PortReference/Ports12100to12199)

</td>

<td>

[12200 - 12299](/PortReference/Ports12200to12299)

</td>

<td>

[12300 - 12399](/PortReference/Ports12300to12399)

</td>

<td>

[12400 - 12499](/PortReference/Ports12400to12499)

</td>

</tr>

<tr>

<td>

[12500 - 12599](/PortReference/Ports12500to12599)

</td>

<td>

[12600 - 12699](/PortReference/Ports12600to12699)

</td>

<td>

[12700 - 12799](/PortReference/Ports12700to12799)

</td>

<td>

[12800 - 12899](/PortReference/Ports12800to12899)

</td>

<td>

[12900 - 12999](/PortReference/Ports12900to12999)

</td>

</tr>

<tr>

<td>

[13000 - 13099](/PortReference/Ports13000to13099)

</td>

<td>

[13100 - 13199](/PortReference/Ports13100to13199)

</td>

<td>

[13200 - 13299](/PortReference/Ports13200to13299)

</td>

<td>

[13300 - 13399](/PortReference/Ports13300to13399)

</td>

<td>

[13400 - 13499](/PortReference/Ports13400to13499)

</td>

</tr>

<tr>

<td>

[13500 - 13599](/PortReference/Ports13500to13599)

</td>

<td>

[13600 - 13699](/PortReference/Ports13600to13699)

</td>

<td>

[13700 - 13799](/PortReference/Ports13700to13799)

</td>

<td>

[13800 - 13899](/PortReference/Ports13800to13899)

</td>

<td>

[13900 - 13999](/PortReference/Ports13900to13999)

</td>

</tr>

<tr>

<td>

[14000 - 14099](/PortReference/Ports14000to14099)

</td>

<td>

[14100 - 14199](/PortReference/Ports14100to14199)

</td>

<td>

[14200 - 14299](/PortReference/Ports14200to14299)

</td>

<td>

[14300 - 14399](/PortReference/Ports14300to14399)

</td>

<td>

[14400 - 14499](/PortReference/Ports14400to14499)

</td>

</tr>

<tr>

<td>

[14500 - 14599](/PortReference/Ports14500to14599)

</td>

<td>

[14600 - 14699](/PortReference/Ports14600to14699)

</td>

<td>

[14700 - 14799](/PortReference/Ports14700to14799)

</td>

<td>

[14800 - 14899](/PortReference/Ports14800to14899)

</td>

<td>

[14900 - 14999](/PortReference/Ports14900to14999)

</td>

</tr>

<tr>

<td>

[15000 - 15099](/PortReference/Ports15000to15099)

</td>

<td>

[15100 - 15199](/PortReference/Ports15100to15199)

</td>

<td>

[15200 - 15299](/PortReference/Ports15200to15299)

</td>

<td>

[15300 - 15399](/PortReference/Ports15300to15399)

</td>

<td>

[15400 - 15499](/PortReference/Ports15400to15499)

</td>

</tr>

<tr>

<td>

[15500 - 15599](/PortReference/Ports15500to15599)

</td>

<td>

[15600 - 15699](/PortReference/Ports15600to15699)

</td>

<td>

[15700 - 15799](/PortReference/Ports15700to15799)

</td>

<td>

[15800 - 15899](/PortReference/Ports15800to15899)

</td>

<td>

[15900 - 15999](/PortReference/Ports15900to15999)

</td>

</tr>

<tr>

<td>

[16000 - 16099](/PortReference/Ports16000to16099)

</td>

<td>

[16100 - 16199](/PortReference/Ports16100to16199)

</td>

<td>

[16200 - 16299](/PortReference/Ports16200to16299)

</td>

<td>

[16300 - 16399](/PortReference/Ports16300to16399)

</td>

<td>

[16400 - 16499](/PortReference/Ports16400to16499)

</td>

</tr>

<tr>

<td>

[16500 - 16599](/PortReference/Ports16500to16599)

</td>

<td>

[16600 - 16699](/PortReference/Ports16600to16699)

</td>

<td>

[16700 - 16799](/PortReference/Ports16700to16799)

</td>

<td>

[16800 - 16899](/PortReference/Ports16800to16899)

</td>

<td>

[16900 - 16999](/PortReference/Ports16900to16999)

</td>

</tr>

<tr>

<td>

[17000 - 17099](/PortReference/Ports17000to17099)

</td>

<td>

[17100 - 17199](/PortReference/Ports17100to17199)

</td>

<td>

[17200 - 17299](/PortReference/Ports17200to17299)

</td>

<td>

[17300 - 17399](/PortReference/Ports17300to17399)

</td>

<td>

[17400 - 17499](/PortReference/Ports17400to17499)

</td>

</tr>

<tr>

<td>

[17500 - 17599](/PortReference/Ports17500to17599)

</td>

<td>

[17600 - 17699](/PortReference/Ports17600to17699)

</td>

<td>

[17700 - 17799](/PortReference/Ports17700to17799)

</td>

<td>

[17800 - 17899](/PortReference/Ports17800to17899)

</td>

<td>

[17900 - 17999](/PortReference/Ports17900to17999)

</td>

</tr>

<tr>

<td>

[18000 - 18099](/PortReference/Ports18000to18099)

</td>

<td>

[18100 - 18199](/PortReference/Ports18100to18199)

</td>

<td>

[18200 - 18299](/PortReference/Ports18200to18299)

</td>

<td>

[18300 - 18399](/PortReference/Ports18300to18399)

</td>

<td>

[18400 - 18499](/PortReference/Ports18400to18499)

</td>

</tr>

<tr>

<td>

[18500 - 18599](/PortReference/Ports18500to18599)

</td>

<td>

[18600 - 18699](/PortReference/Ports18600to18699)

</td>

<td>

[18700 - 18799](/PortReference/Ports18700to18799)

</td>

<td>

[18800 - 18899](/PortReference/Ports18800to18899)

</td>

<td>

[18900 - 18999](/PortReference/Ports18900to18999)

</td>

</tr>

<tr>

<td>

[19000 - 19099](/PortReference/Ports19000to19099)

</td>

<td>

[19100 - 19199](/PortReference/Ports19100to19199)

</td>

<td>

[19200 - 19299](/PortReference/Ports19200to19299)

</td>

<td>

[19300 - 19399](/PortReference/Ports19300to19399)

</td>

<td>

[19400 - 19499](/PortReference/Ports19400to19499)

</td>

</tr>

<tr>

<td>

[19500 - 19599](/PortReference/Ports19500to19599)

</td>

<td>

[19600 - 19699](/PortReference/Ports19600to19699)

</td>

<td>

[19700 - 19799](/PortReference/Ports19700to19799)

</td>

<td>

[19800 - 19899](/PortReference/Ports19800to19899)

</td>

<td>

[19900 - 19999](/PortReference/Ports19900to19999)

</td>

</tr>

<tr>

<td>

[20000 - 20099](/PortReference/Ports20000to20099)

</td>

<td>

[20100 - 20199](/PortReference/Ports20100to20199)

</td>

<td>

[20200 - 20299](/PortReference/Ports20200to20299)

</td>

<td>

[20300 - 20399](/PortReference/Ports20300to20399)

</td>

<td>

[20400 - 20499](/PortReference/Ports20400to20499)

</td>

</tr>

<tr>

<td>

[20500 - 20599](/PortReference/Ports20500to20599)

</td>

<td>

[20600 - 20699](/PortReference/Ports20600to20699)

</td>

<td>

[20700 - 20799](/PortReference/Ports20700to20799)

</td>

<td>

[20800 - 20899](/PortReference/Ports20800to20899)

</td>

<td>

[20900 - 20999](/PortReference/Ports20900to20999)

</td>

</tr>

<tr>

<td>

[21000 - 21099](/PortReference/Ports21000to21099)

</td>

<td>

[21100 - 21199](/PortReference/Ports21100to21199)

</td>

<td>

[21200 - 21299](/PortReference/Ports21200to21299)

</td>

<td>

[21300 - 21399](/PortReference/Ports21300to21399)

</td>

<td>

[21400 - 21499](/PortReference/Ports21400to21499)

</td>

</tr>

<tr>

<td>

[21500 - 21599](/PortReference/Ports21500to21599)

</td>

<td>

[21600 - 21699](/PortReference/Ports21600to21699)

</td>

<td>

[21700 - 21799](/PortReference/Ports21700to21799)

</td>

<td>

[21800 - 21899](/PortReference/Ports21800to21899)

</td>

<td>

[21900 - 21999](/PortReference/Ports21900to21999)

</td>

</tr>

<tr>

<td>

[22000 - 22099](/PortReference/Ports22000to22099)

</td>

<td>

[22100 - 22199](/PortReference/Ports22100to22199)

</td>

<td>

[22200 - 22299](/PortReference/Ports22200to22299)

</td>

<td>

[22300 - 22399](/PortReference/Ports22300to22399)

</td>

<td>

[22400 - 22499](/PortReference/Ports22400to22499)

</td>

</tr>

<tr>

<td>

[22500 - 22599](/PortReference/Ports22500to22599)

</td>

<td>

[22600 - 22699](/PortReference/Ports22600to22699)

</td>

<td>

[22700 - 22799](/PortReference/Ports22700to22799)

</td>

<td>

[22800 - 22899](/PortReference/Ports22800to22899)

</td>

<td>

[22900 - 22999](/PortReference/Ports22900to22999)

</td>

</tr>

<tr>

<td>

[23000 - 23099](/PortReference/Ports23000to23099)

</td>

<td>

[23100 - 23199](/PortReference/Ports23100to23199)

</td>

<td>

[23200 - 23299](/PortReference/Ports23200to23299)

</td>

<td>

[23300 - 23399](/PortReference/Ports23300to23399)

</td>

<td>

[23400 - 23499](/PortReference/Ports23400to23499)

</td>

</tr>

<tr>

<td>

[23500 - 23599](/PortReference/Ports23500to23599)

</td>

<td>

[23600 - 23699](/PortReference/Ports23600to23699)

</td>

<td>

[23700 - 23799](/PortReference/Ports23700to23799)

</td>

<td>

[23800 - 23899](/PortReference/Ports23800to23899)

</td>

<td>

[23900 - 23999](/PortReference/Ports23900to23999)

</td>

</tr>

<tr>

<td>

[24000 - 24099](/PortReference/Ports24000to24099)

</td>

<td>

[24100 - 24199](/PortReference/Ports24100to24199)

</td>

<td>

[24200 - 24299](/PortReference/Ports24200to24299)

</td>

<td>

[24300 - 24399](/PortReference/Ports24300to24399)

</td>

<td>

[24400 - 24499](/PortReference/Ports24400to24499)

</td>

</tr>

<tr>

<td>

[24500 - 24599](/PortReference/Ports24500to24599)

</td>

<td>

[24600 - 24699](/PortReference/Ports24600to24699)

</td>

<td>

[24700 - 24799](/PortReference/Ports24700to24799)

</td>

<td>

[24800 - 24899](/PortReference/Ports24800to24899)

</td>

<td>

[24900 - 24999](/PortReference/Ports24900to24999)

</td>

</tr>

<tr>

<td>

[25000 - 25099](/PortReference/Ports25000to25099)

</td>

<td>

[25100 - 25199](/PortReference/Ports25100to25199)

</td>

<td>

[25200 - 25299](/PortReference/Ports25200to25299)

</td>

<td>

[25300 - 25399](/PortReference/Ports25300to25399)

</td>

<td>

[25400 - 25499](/PortReference/Ports25400to25499)

</td>

</tr>

<tr>

<td>

[25500 - 25599](/PortReference/Ports25500to25599)

</td>

<td>

[25600 - 25699](/PortReference/Ports25600to25699)

</td>

<td>

[25700 - 25799](/PortReference/Ports25700to25799)

</td>

<td>

[25800 - 25899](/PortReference/Ports25800to25899)

</td>

<td>

[25900 - 25999](/PortReference/Ports25900to25999)

</td>

</tr>

<tr>

<td>

[26000 - 26099](/PortReference/Ports26000to26099)

</td>

<td>

[26100 - 26199](/PortReference/Ports26100to26199)

</td>

<td>

[26200 - 26299](/PortReference/Ports26200to26299)

</td>

<td>

[26300 - 26399](/PortReference/Ports26300to26399)

</td>

<td>

[26400 - 26499](/PortReference/Ports26400to26499)

</td>

</tr>

<tr>

<td>

[26500 - 26599](/PortReference/Ports26500to26599)

</td>

<td>

[26600 - 26699](/PortReference/Ports26600to26699)

</td>

<td>

[26700 - 26799](/PortReference/Ports26700to26799)

</td>

<td>

[26800 - 26899](/PortReference/Ports26800to26899)

</td>

<td>

[26900 - 26999](/PortReference/Ports26900to26999)

</td>

</tr>

<tr>

<td>

[27000 - 27099](/PortReference/Ports27000to27099)

</td>

<td>

[27100 - 27199](/PortReference/Ports27100to27199)

</td>

<td>

[27200 - 27299](/PortReference/Ports27200to27299)

</td>

<td>

[27300 - 27399](/PortReference/Ports27300to27399)

</td>

<td>

[27400 - 27499](/PortReference/Ports27400to27499)

</td>

</tr>

<tr>

<td>

[27500 - 27599](/PortReference/Ports27500to27599)

</td>

<td>

[27600 - 27699](/PortReference/Ports27600to27699)

</td>

<td>

[27700 - 27799](/PortReference/Ports27700to27799)

</td>

<td>

[27800 - 27899](/PortReference/Ports27800to27899)

</td>

<td>

[27900 - 27999](/PortReference/Ports27900to27999)

</td>

</tr>

<tr>

<td>

[28000 - 28099](/PortReference/Ports28000to28099)

</td>

<td>

[28100 - 28199](/PortReference/Ports28100to28199)

</td>

<td>

[28200 - 28299](/PortReference/Ports28200to28299)

</td>

<td>

[28300 - 28399](/PortReference/Ports28300to28399)

</td>

<td>

[28400 - 28499](/PortReference/Ports28400to28499)

</td>

</tr>

<tr>

<td>

[28500 - 28599](/PortReference/Ports28500to28599)

</td>

<td>

[28600 - 28699](/PortReference/Ports28600to28699)

</td>

<td>

[28700 - 28799](/PortReference/Ports28700to28799)

</td>

<td>

[28800 - 28899](/PortReference/Ports28800to28899)

</td>

<td>

[28900 - 28999](/PortReference/Ports28900to28999)

</td>

</tr>

<tr>

<td>

[29000 - 29099](/PortReference/Ports29000to29099)

</td>

<td>

[29100 - 29199](/PortReference/Ports29100to29199)

</td>

<td>

[29200 - 29299](/PortReference/Ports29200to29299)

</td>

<td>

[29300 - 29399](/PortReference/Ports29300to29399)

</td>

<td>

[29400 - 29499](/PortReference/Ports29400to29499)

</td>

</tr>

<tr>

<td>

[29500 - 29599](/PortReference/Ports29500to29599)

</td>

<td>

[29600 - 29699](/PortReference/Ports29600to29699)

</td>

<td>

[29700 - 29799](/PortReference/Ports29700to29799)

</td>

<td>

[29800 - 29899](/PortReference/Ports29800to29899)

</td>

<td>

[29900 - 29999](/PortReference/Ports29900to29999)

</td>

</tr>

<tr>

<td>

[30000 - 30099](/PortReference/Ports30000to30099)

</td>

<td>

[30100 - 30199](/PortReference/Ports30100to30199)

</td>

<td>

[30200 - 30299](/PortReference/Ports30200to30299)

</td>

<td>

[30300 - 30399](/PortReference/Ports30300to30399)

</td>

<td>

[30400 - 30499](/PortReference/Ports30400to30499)

</td>

</tr>

<tr>

<td>

[30500 - 30599](/PortReference/Ports30500to30599)

</td>

<td>

[30600 - 30699](/PortReference/Ports30600to30699)

</td>

<td>

[30700 - 30799](/PortReference/Ports30700to30799)

</td>

<td>

[30800 - 30899](/PortReference/Ports30800to30899)

</td>

<td>

[30900 - 30999](/PortReference/Ports30900to30999)

</td>

</tr>

<tr>

<td>

[31000 - 31099](/PortReference/Ports31000to31099)

</td>

<td>

[31100 - 31199](/PortReference/Ports31100to31199)

</td>

<td>

[31200 - 31299](/PortReference/Ports31200to31299)

</td>

<td>

[31300 - 31399](/PortReference/Ports31300to31399)

</td>

<td>

[31400 - 31499](/PortReference/Ports31400to31499)

</td>

</tr>

<tr>

<td>

[31500 - 31599](/PortReference/Ports31500to31599)

</td>

<td>

[31600 - 31699](/PortReference/Ports31600to31699)

</td>

<td>

[31700 - 31799](/PortReference/Ports31700to31799)

</td>

<td>

[31800 - 31899](/PortReference/Ports31800to31899)

</td>

<td>

[31900 - 31999](/PortReference/Ports31900to31999)

</td>

</tr>

<tr>

<td>

[32000 - 32099](/PortReference/Ports32000to32099)

</td>

<td>

[32100 - 32199](/PortReference/Ports32100to32199)

</td>

<td>

[32200 - 32299](/PortReference/Ports32200to32299)

</td>

<td>

[32300 - 32399](/PortReference/Ports32300to32399)

</td>

<td>

[32400 - 32499](/PortReference/Ports32400to32499)

</td>

</tr>

<tr>

<td>

[32500 - 32599](/PortReference/Ports32500to32599)

</td>

<td>

[32600 - 32699](/PortReference/Ports32600to32699)

</td>

<td>

[32700 - 32799](/PortReference/Ports32700to32799)

</td>

<td>

[32800 - 32899](/PortReference/Ports32800to32899)

</td>

<td>

[32900 - 32999](/PortReference/Ports32900to32999)

</td>

</tr>

<tr>

<td>

[33000 - 33099](/PortReference/Ports33000to33099)

</td>

<td>

[33100 - 33199](/PortReference/Ports33100to33199)

</td>

<td>

[33200 - 33299](/PortReference/Ports33200to33299)

</td>

<td>

[33300 - 33399](/PortReference/Ports33300to33399)

</td>

<td>

[33400 - 33499](/PortReference/Ports33400to33499)

</td>

</tr>

<tr>

<td>

[33500 - 33599](/PortReference/Ports33500to33599)

</td>

<td>

[33600 - 33699](/PortReference/Ports33600to33699)

</td>

<td>

[33700 - 33799](/PortReference/Ports33700to33799)

</td>

<td>

[33800 - 33899](/PortReference/Ports33800to33899)

</td>

<td>

[33900 - 33999](/PortReference/Ports33900to33999)

</td>

</tr>

<tr>

<td>

[34000 - 34099](/PortReference/Ports34000to34099)

</td>

<td>

[34100 - 34199](/PortReference/Ports34100to34199)

</td>

<td>

[34200 - 34299](/PortReference/Ports34200to34299)

</td>

<td>

[34300 - 34399](/PortReference/Ports34300to34399)

</td>

<td>

[34400 - 34499](/PortReference/Ports34400to34499)

</td>

</tr>

<tr>

<td>

[34500 - 34599](/PortReference/Ports34500to34599)

</td>

<td>

[34600 - 34699](/PortReference/Ports34600to34699)

</td>

<td>

[34700 - 34799](/PortReference/Ports34700to34799)

</td>

<td>

[34800 - 34899](/PortReference/Ports34800to34899)

</td>

<td>

[34900 - 34999](/PortReference/Ports34900to34999)

</td>

</tr>

<tr>

<td>

[35000 - 35099](/PortReference/Ports35000to35099)

</td>

<td>

[35100 - 35199](/PortReference/Ports35100to35199)

</td>

<td>

[35200 - 35299](/PortReference/Ports35200to35299)

</td>

<td>

[35300 - 35399](/PortReference/Ports35300to35399)

</td>

<td>

[35400 - 35499](/PortReference/Ports35400to35499)

</td>

</tr>

<tr>

<td>

[35500 - 35599](/PortReference/Ports35500to35599)

</td>

<td>

[35600 - 35699](/PortReference/Ports35600to35699)

</td>

<td>

[35700 - 35799](/PortReference/Ports35700to35799)

</td>

<td>

[35800 - 35899](/PortReference/Ports35800to35899)

</td>

<td>

[35900 - 35999](/PortReference/Ports35900to35999)

</td>

</tr>

<tr>

<td>

[36000 - 36099](/PortReference/Ports36000to36099)

</td>

<td>

[36100 - 36199](/PortReference/Ports36100to36199)

</td>

<td>

[36200 - 36299](/PortReference/Ports36200to36299)

</td>

<td>

[36300 - 36399](/PortReference/Ports36300to36399)

</td>

<td>

[36400 - 36499](/PortReference/Ports36400to36499)

</td>

</tr>

<tr>

<td>

[36500 - 36599](/PortReference/Ports36500to36599)

</td>

<td>

[36600 - 36699](/PortReference/Ports36600to36699)

</td>

<td>

[36700 - 36799](/PortReference/Ports36700to36799)

</td>

<td>

[36800 - 36899](/PortReference/Ports36800to36899)

</td>

<td>

[36900 - 36999](/PortReference/Ports36900to36999)

</td>

</tr>

<tr>

<td>

[37000 - 37099](/PortReference/Ports37000to37099)

</td>

<td>

[37100 - 37199](/PortReference/Ports37100to37199)

</td>

<td>

[37200 - 37299](/PortReference/Ports37200to37299)

</td>

<td>

[37300 - 37399](/PortReference/Ports37300to37399)

</td>

<td>

[37400 - 37499](/PortReference/Ports37400to37499)

</td>

</tr>

<tr>

<td>

[37500 - 37599](/PortReference/Ports37500to37599)

</td>

<td>

[37600 - 37699](/PortReference/Ports37600to37699)

</td>

<td>

[37700 - 37799](/PortReference/Ports37700to37799)

</td>

<td>

[37800 - 37899](/PortReference/Ports37800to37899)

</td>

<td>

[37900 - 37999](/PortReference/Ports37900to37999)

</td>

</tr>

<tr>

<td>

[38000 - 38099](/PortReference/Ports38000to38099)

</td>

<td>

[38100 - 38199](/PortReference/Ports38100to38199)

</td>

<td>

[38200 - 38299](/PortReference/Ports38200to38299)

</td>

<td>

[38300 - 38399](/PortReference/Ports38300to38399)

</td>

<td>

[38400 - 38499](/PortReference/Ports38400to38499)

</td>

</tr>

<tr>

<td>

[38500 - 38599](/PortReference/Ports38500to38599)

</td>

<td>

[38600 - 38699](/PortReference/Ports38600to38699)

</td>

<td>

[38700 - 38799](/PortReference/Ports38700to38799)

</td>

<td>

[38800 - 38899](/PortReference/Ports38800to38899)

</td>

<td>

[38900 - 38999](/PortReference/Ports38900to38999)

</td>

</tr>

<tr>

<td>

[39000 - 39099](/PortReference/Ports39000to39099)

</td>

<td>

[39100 - 39199](/PortReference/Ports39100to39199)

</td>

<td>

[39200 - 39299](/PortReference/Ports39200to39299)

</td>

<td>

[39300 - 39399](/PortReference/Ports39300to39399)

</td>

<td>

[39400 - 39499](/PortReference/Ports39400to39499)

</td>

</tr>

<tr>

<td>

[39500 - 39599](/PortReference/Ports39500to39599)

</td>

<td>

[39600 - 39699](/PortReference/Ports39600to39699)

</td>

<td>

[39700 - 39799](/PortReference/Ports39700to39799)

</td>

<td>

[39800 - 39899](/PortReference/Ports39800to39899)

</td>

<td>

[39900 - 39999](/PortReference/Ports39900to39999)

</td>

</tr>

<tr>

<td>

[40000 - 40099](/PortReference/Ports40000to40099)

</td>

<td>

[40100 - 40199](/PortReference/Ports40100to40199)

</td>

<td>

[40200 - 40299](/PortReference/Ports40200to40299)

</td>

<td>

[40300 - 40399](/PortReference/Ports40300to40399)

</td>

<td>

[40400 - 40499](/PortReference/Ports40400to40499)

</td>

</tr>

<tr>

<td>

[40500 - 40599](/PortReference/Ports40500to40599)

</td>

<td>

[40600 - 40699](/PortReference/Ports40600to40699)

</td>

<td>

[40700 - 40799](/PortReference/Ports40700to40799)

</td>

<td>

[40800 - 40899](/PortReference/Ports40800to40899)

</td>

<td>

[40900 - 40999](/PortReference/Ports40900to40999)

</td>

</tr>

<tr>

<td>

[41000 - 41099](/PortReference/Ports41000to41099)

</td>

<td>

[41100 - 41199](/PortReference/Ports41100to41199)

</td>

<td>

[41200 - 41299](/PortReference/Ports41200to41299)

</td>

<td>

[41300 - 41399](/PortReference/Ports41300to41399)

</td>

<td>

[41400 - 41499](/PortReference/Ports41400to41499)

</td>

</tr>

<tr>

<td>

[41500 - 41599](/PortReference/Ports41500to41599)

</td>

<td>

[41600 - 41699](/PortReference/Ports41600to41699)

</td>

<td>

[41700 - 41799](/PortReference/Ports41700to41799)

</td>

<td>

[41800 - 41899](/PortReference/Ports41800to41899)

</td>

<td>

[41900 - 41999](/PortReference/Ports41900to41999)

</td>

</tr>

<tr>

<td>

[42000 - 42099](/PortReference/Ports42000to42099)

</td>

<td>

[42100 - 42199](/PortReference/Ports42100to42199)

</td>

<td>

[42200 - 42299](/PortReference/Ports42200to42299)

</td>

<td>

[42300 - 42399](/PortReference/Ports42300to42399)

</td>

<td>

[42400 - 42499](/PortReference/Ports42400to42499)

</td>

</tr>

<tr>

<td>

[42500 - 42599](/PortReference/Ports42500to42599)

</td>

<td>

[42600 - 42699](/PortReference/Ports42600to42699)

</td>

<td>

[42700 - 42799](/PortReference/Ports42700to42799)

</td>

<td>

[42800 - 42899](/PortReference/Ports42800to42899)

</td>

<td>

[42900 - 42999](/PortReference/Ports42900to42999)

</td>

</tr>

<tr>

<td>

[43000 - 43099](/PortReference/Ports43000to43099)

</td>

<td>

[43100 - 43199](/PortReference/Ports43100to43199)

</td>

<td>

[43200 - 43299](/PortReference/Ports43200to43299)

</td>

<td>

[43300 - 43399](/PortReference/Ports43300to43399)

</td>

<td>

[43400 - 43499](/PortReference/Ports43400to43499)

</td>

</tr>

<tr>

<td>

[43500 - 43599](/PortReference/Ports43500to43599)

</td>

<td>

[43600 - 43699](/PortReference/Ports43600to43699)

</td>

<td>

[43700 - 43799](/PortReference/Ports43700to43799)

</td>

<td>

[43800 - 43899](/PortReference/Ports43800to43899)

</td>

<td>

[43900 - 43999](/PortReference/Ports43900to43999)

</td>

</tr>

<tr>

<td>

[44000 - 44099](/PortReference/Ports44000to44099)

</td>

<td>

[44100 - 44199](/PortReference/Ports44100to44199)

</td>

<td>

[44200 - 44299](/PortReference/Ports44200to44299)

</td>

<td>

[44300 - 44399](/PortReference/Ports44300to44399)

</td>

<td>

[44400 - 44499](/PortReference/Ports44400to44499)

</td>

</tr>

<tr>

<td>

[44500 - 44599](/PortReference/Ports44500to44599)

</td>

<td>

[44600 - 44699](/PortReference/Ports44600to44699)

</td>

<td>

[44700 - 44799](/PortReference/Ports44700to44799)

</td>

<td>

[44800 - 44899](/PortReference/Ports44800to44899)

</td>

<td>

[44900 - 44999](/PortReference/Ports44900to44999)

</td>

</tr>

<tr>

<td>

[45000 - 45099](/PortReference/Ports45000to45099)

</td>

<td>

[45100 - 45199](/PortReference/Ports45100to45199)

</td>

<td>

[45200 - 45299](/PortReference/Ports45200to45299)

</td>

<td>

[45300 - 45399](/PortReference/Ports45300to45399)

</td>

<td>

[45400 - 45499](/PortReference/Ports45400to45499)

</td>

</tr>

<tr>

<td>

[45500 - 45599](/PortReference/Ports45500to45599)

</td>

<td>

[45600 - 45699](/PortReference/Ports45600to45699)

</td>

<td>

[45700 - 45799](/PortReference/Ports45700to45799)

</td>

<td>

[45800 - 45899](/PortReference/Ports45800to45899)

</td>

<td>

[45900 - 45999](/PortReference/Ports45900to45999)

</td>

</tr>

<tr>

<td>

[46000 - 46099](/PortReference/Ports46000to46099)

</td>

<td>

[46100 - 46199](/PortReference/Ports46100to46199)

</td>

<td>

[46200 - 46299](/PortReference/Ports46200to46299)

</td>

<td>

[46300 - 46399](/PortReference/Ports46300to46399)

</td>

<td>

[46400 - 46499](/PortReference/Ports46400to46499)

</td>

</tr>

<tr>

<td>

[46500 - 46599](/PortReference/Ports46500to46599)

</td>

<td>

[46600 - 46699](/PortReference/Ports46600to46699)

</td>

<td>

[46700 - 46799](/PortReference/Ports46700to46799)

</td>

<td>

[46800 - 46899](/PortReference/Ports46800to46899)

</td>

<td>

[46900 - 46999](/PortReference/Ports46900to46999)

</td>

</tr>

<tr>

<td>

[47000 - 47099](/PortReference/Ports47000to47099)

</td>

<td>

[47100 - 47199](/PortReference/Ports47100to47199)

</td>

<td>

[47200 - 47299](/PortReference/Ports47200to47299)

</td>

<td>

[47300 - 47399](/PortReference/Ports47300to47399)

</td>

<td>

[47400 - 47499](/PortReference/Ports47400to47499)

</td>

</tr>

<tr>

<td>

[47500 - 47599](/PortReference/Ports47500to47599)

</td>

<td>

[47600 - 47699](/PortReference/Ports47600to47699)

</td>

<td>

[47700 - 47799](/PortReference/Ports47700to47799)

</td>

<td>

[47800 - 47899](/PortReference/Ports47800to47899)

</td>

<td>

[47900 - 47999](/PortReference/Ports47900to47999)

</td>

</tr>

<tr>

<td>

[48000 - 48099](/PortReference/Ports48000to48099)

</td>

<td>

[48100 - 48199](/PortReference/Ports48100to48199)

</td>

<td>

[48200 - 48299](/PortReference/Ports48200to48299)

</td>

<td>

[48300 - 48399](/PortReference/Ports48300to48399)

</td>

<td>

[48400 - 48499](/PortReference/Ports48400to48499)

</td>

</tr>

<tr>

<td>

[48500 - 48599](/PortReference/Ports48500to48599)

</td>

<td>

[48600 - 48699](/PortReference/Ports48600to48699)

</td>

<td>

[48700 - 48799](/PortReference/Ports48700to48799)

</td>

<td>

[48800 - 48899](/PortReference/Ports48800to48899)

</td>

<td>

[48900 - 48999](/PortReference/Ports48900to48999)

</td>

</tr>

<tr>

<td>

[49000 - 49099](/PortReference/Ports49000to49099)

</td>

<td>

[49100 - 49199](/PortReference/Ports49100to49199)

</td>

<td>

[49200 - 49299](/PortReference/Ports49200to49299)

</td>

<td>

[49300 - 49399](/PortReference/Ports49300to49399)

</td>

<td>

[49400 - 49499](/PortReference/Ports49400to49499)

</td>

</tr>

<tr>

<td>

[49500 - 49599](/PortReference/Ports49500to49599)

</td>

<td>

[49600 - 49699](/PortReference/Ports49600to49699)

</td>

<td>

[49700 - 49799](/PortReference/Ports49700to49799)

</td>

<td>

[49800 - 49899](/PortReference/Ports49800to49899)

</td>

<td>

[49900 - 49999](/PortReference/Ports49900to49999)

</td>

</tr>

<tr>

<td>

[50000 - 50099](/PortReference/Ports50000to50099)

</td>

<td>

[50100 - 50199](/PortReference/Ports50100to50199)

</td>

<td>

[50200 - 50299](/PortReference/Ports50200to50299)

</td>

<td>

[50300 - 50399](/PortReference/Ports50300to50399)

</td>

<td>

[50400 - 50499](/PortReference/Ports50400to50499)

</td>

</tr>

<tr>

<td>

[50500 - 50599](/PortReference/Ports50500to50599)

</td>

<td>

[50600 - 50699](/PortReference/Ports50600to50699)

</td>

<td>

[50700 - 50799](/PortReference/Ports50700to50799)

</td>

<td>

[50800 - 50899](/PortReference/Ports50800to50899)

</td>

<td>

[50900 - 50999](/PortReference/Ports50900to50999)

</td>

</tr>

<tr>

<td>

[51000 - 51099](/PortReference/Ports51000to51099)

</td>

<td>

[51100 - 51199](/PortReference/Ports51100to51199)

</td>

<td>

[51200 - 51299](/PortReference/Ports51200to51299)

</td>

<td>

[51300 - 51399](/PortReference/Ports51300to51399)

</td>

<td>

[51400 - 51499](/PortReference/Ports51400to51499)

</td>

</tr>

<tr>

<td>

[51500 - 51599](/PortReference/Ports51500to51599)

</td>

<td>

[51600 - 51699](/PortReference/Ports51600to51699)

</td>

<td>

[51700 - 51799](/PortReference/Ports51700to51799)

</td>

<td>

[51800 - 51899](/PortReference/Ports51800to51899)

</td>

<td>

[51900 - 51999](/PortReference/Ports51900to51999)

</td>

</tr>

<tr>

<td>

[52000 - 52099](/PortReference/Ports52000to52099)

</td>

<td>

[52100 - 52199](/PortReference/Ports52100to52199)

</td>

<td>

[52200 - 52299](/PortReference/Ports52200to52299)

</td>

<td>

[52300 - 52399](/PortReference/Ports52300to52399)

</td>

<td>

[52400 - 52499](/PortReference/Ports52400to52499)

</td>

</tr>

<tr>

<td>

[52500 - 52599](/PortReference/Ports52500to52599)

</td>

<td>

[52600 - 52699](/PortReference/Ports52600to52699)

</td>

<td>

[52700 - 52799](/PortReference/Ports52700to52799)

</td>

<td>

[52800 - 52899](/PortReference/Ports52800to52899)

</td>

<td>

[52900 - 52999](/PortReference/Ports52900to52999)

</td>

</tr>

<tr>

<td>

[53000 - 53099](/PortReference/Ports53000to53099)

</td>

<td>

[53100 - 53199](/PortReference/Ports53100to53199)

</td>

<td>

[53200 - 53299](/PortReference/Ports53200to53299)

</td>

<td>

[53300 - 53399](/PortReference/Ports53300to53399)

</td>

<td>

[53400 - 53499](/PortReference/Ports53400to53499)

</td>

</tr>

<tr>

<td>

[53500 - 53599](/PortReference/Ports53500to53599)

</td>

<td>

[53600 - 53699](/PortReference/Ports53600to53699)

</td>

<td>

[53700 - 53799](/PortReference/Ports53700to53799)

</td>

<td>

[53800 - 53899](/PortReference/Ports53800to53899)

</td>

<td>

[53900 - 53999](/PortReference/Ports53900to53999)

</td>

</tr>

<tr>

<td>

[54000 - 54099](/PortReference/Ports54000to54099)

</td>

<td>

[54100 - 54199](/PortReference/Ports54100to54199)

</td>

<td>

[54200 - 54299](/PortReference/Ports54200to54299)

</td>

<td>

[54300 - 54399](/PortReference/Ports54300to54399)

</td>

<td>

[54400 - 54499](/PortReference/Ports54400to54499)

</td>

</tr>

<tr>

<td>

[54500 - 54599](/PortReference/Ports54500to54599)

</td>

<td>

[54600 - 54699](/PortReference/Ports54600to54699)

</td>

<td>

[54700 - 54799](/PortReference/Ports54700to54799)

</td>

<td>

[54800 - 54899](/PortReference/Ports54800to54899)

</td>

<td>

[54900 - 54999](/PortReference/Ports54900to54999)

</td>

</tr>

<tr>

<td>

[55000 - 55099](/PortReference/Ports55000to55099)

</td>

<td>

[55100 - 55199](/PortReference/Ports55100to55199)

</td>

<td>

[55200 - 55299](/PortReference/Ports55200to55299)

</td>

<td>

[55300 - 55399](/PortReference/Ports55300to55399)

</td>

<td>

[55400 - 55499](/PortReference/Ports55400to55499)

</td>

</tr>

<tr>

<td>

[55500 - 55599](/PortReference/Ports55500to55599)

</td>

<td>

[55600 - 55699](/PortReference/Ports55600to55699)

</td>

<td>

[55700 - 55799](/PortReference/Ports55700to55799)

</td>

<td>

[55800 - 55899](/PortReference/Ports55800to55899)

</td>

<td>

[55900 - 55999](/PortReference/Ports55900to55999)

</td>

</tr>

<tr>

<td>

[56000 - 56099](/PortReference/Ports56000to56099)

</td>

<td>

[56100 - 56199](/PortReference/Ports56100to56199)

</td>

<td>

[56200 - 56299](/PortReference/Ports56200to56299)

</td>

<td>

[56300 - 56399](/PortReference/Ports56300to56399)

</td>

<td>

[56400 - 56499](/PortReference/Ports56400to56499)

</td>

</tr>

<tr>

<td>

[56500 - 56599](/PortReference/Ports56500to56599)

</td>

<td>

[56600 - 56699](/PortReference/Ports56600to56699)

</td>

<td>

[56700 - 56799](/PortReference/Ports56700to56799)

</td>

<td>

[56800 - 56899](/PortReference/Ports56800to56899)

</td>

<td>

[56900 - 56999](/PortReference/Ports56900to56999)

</td>

</tr>

<tr>

<td>

[57000 - 57099](/PortReference/Ports57000to57099)

</td>

<td>

[57100 - 57199](/PortReference/Ports57100to57199)

</td>

<td>

[57200 - 57299](/PortReference/Ports57200to57299)

</td>

<td>

[57300 - 57399](/PortReference/Ports57300to57399)

</td>

<td>

[57400 - 57499](/PortReference/Ports57400to57499)

</td>

</tr>

<tr>

<td>

[57500 - 57599](/PortReference/Ports57500to57599)

</td>

<td>

[57600 - 57699](/PortReference/Ports57600to57699)

</td>

<td>

[57700 - 57799](/PortReference/Ports57700to57799)

</td>

<td>

[57800 - 57899](/PortReference/Ports57800to57899)

</td>

<td>

[57900 - 57999](/PortReference/Ports57900to57999)

</td>

</tr>

<tr>

<td>

[58000 - 58099](/PortReference/Ports58000to58099)

</td>

<td>

[58100 - 58199](/PortReference/Ports58100to58199)

</td>

<td>

[58200 - 58299](/PortReference/Ports58200to58299)

</td>

<td>

[58300 - 58399](/PortReference/Ports58300to58399)

</td>

<td>

[58400 - 58499](/PortReference/Ports58400to58499)

</td>

</tr>

<tr>

<td>

[58500 - 58599](/PortReference/Ports58500to58599)

</td>

<td>

[58600 - 58699](/PortReference/Ports58600to58699)

</td>

<td>

[58700 - 58799](/PortReference/Ports58700to58799)

</td>

<td>

[58800 - 58899](/PortReference/Ports58800to58899)

</td>

<td>

[58900 - 58999](/PortReference/Ports58900to58999)

</td>

</tr>

<tr>

<td>

[59000 - 59099](/PortReference/Ports59000to59099)

</td>

<td>

[59100 - 59199](/PortReference/Ports59100to59199)

</td>

<td>

[59200 - 59299](/PortReference/Ports59200to59299)

</td>

<td>

[59300 - 59399](/PortReference/Ports59300to59399)

</td>

<td>

[59400 - 59499](/PortReference/Ports59400to59499)

</td>

</tr>

<tr>

<td>

[59500 - 59599](/PortReference/Ports59500to59599)

</td>

<td>

[59600 - 59699](/PortReference/Ports59600to59699)

</td>

<td>

[59700 - 59799](/PortReference/Ports59700to59799)

</td>

<td>

[59800 - 59899](/PortReference/Ports59800to59899)

</td>

<td>

[59900 - 59999](/PortReference/Ports59900to59999)

</td>

</tr>

<tr>

<td>

[60000 - 60099](/PortReference/Ports60000to60099)

</td>

<td>

[60100 - 60199](/PortReference/Ports60100to60199)

</td>

<td>

[60200 - 60299](/PortReference/Ports60200to60299)

</td>

<td>

[60300 - 60399](/PortReference/Ports60300to60399)

</td>

<td>

[60400 - 60499](/PortReference/Ports60400to60499)

</td>

</tr>

<tr>

<td>

[60500 - 60599](/PortReference/Ports60500to60599)

</td>

<td>

[60600 - 60699](/PortReference/Ports60600to60699)

</td>

<td>

[60700 - 60799](/PortReference/Ports60700to60799)

</td>

<td>

[60800 - 60899](/PortReference/Ports60800to60899)

</td>

<td>

[60900 - 60999](/PortReference/Ports60900to60999)

</td>

</tr>

<tr>

<td>

[61000 - 61099](/PortReference/Ports61000to61099)

</td>

<td>

[61100 - 61199](/PortReference/Ports61100to61199)

</td>

<td>

[61200 - 61299](/PortReference/Ports61200to61299)

</td>

<td>

[61300 - 61399](/PortReference/Ports61300to61399)

</td>

<td>

[61400 - 61499](/PortReference/Ports61400to61499)

</td>

</tr>

<tr>

<td>

[61500 - 61599](/PortReference/Ports61500to61599)

</td>

<td>

[61600 - 61699](/PortReference/Ports61600to61699)

</td>

<td>

[61700 - 61799](/PortReference/Ports61700to61799)

</td>

<td>

[61800 - 61899](/PortReference/Ports61800to61899)

</td>

<td>

[61900 - 61999](/PortReference/Ports61900to61999)

</td>

</tr>

<tr>

<td>

[62000 - 62099](/PortReference/Ports62000to62099)

</td>

<td>

[62100 - 62199](/PortReference/Ports62100to62199)

</td>

<td>

[62200 - 62299](/PortReference/Ports62200to62299)

</td>

<td>

[62300 - 62399](/PortReference/Ports62300to62399)

</td>

<td>

[62400 - 62499](/PortReference/Ports62400to62499)

</td>

</tr>

<tr>

<td>

[62500 - 62599](/PortReference/Ports62500to62599)

</td>

<td>

[62600 - 62699](/PortReference/Ports62600to62699)

</td>

<td>

[62700 - 62799](/PortReference/Ports62700to62799)

</td>

<td>

[62800 - 62899](/PortReference/Ports62800to62899)

</td>

<td>

[62900 - 62999](/PortReference/Ports62900to62999)

</td>

</tr>

<tr>

<td>

[63000 - 63099](/PortReference/Ports63000to63099)

</td>

<td>

[63100 - 63199](/PortReference/Ports63100to63199)

</td>

<td>

[63200 - 63299](/PortReference/Ports63200to63299)

</td>

<td>

[63300 - 63399](/PortReference/Ports63300to63399)

</td>

<td>

[63400 - 63499](/PortReference/Ports63400to63499)

</td>

</tr>

<tr>

<td>

[63500 - 63599](/PortReference/Ports63500to63599)

</td>

<td>

[63600 - 63699](/PortReference/Ports63600to63699)

</td>

<td>

[63700 - 63799](/PortReference/Ports63700to63799)

</td>

<td>

[63800 - 63899](/PortReference/Ports63800to63899)

</td>

<td>

[63900 - 63999](/PortReference/Ports63900to63999)

</td>

</tr>

<tr>

<td>

[64000 - 64099](/PortReference/Ports64000to64099)

</td>

<td>

[64100 - 64199](/PortReference/Ports64100to64199)

</td>

<td>

[64200 - 64299](/PortReference/Ports64200to64299)

</td>

<td>

[64300 - 64399](/PortReference/Ports64300to64399)

</td>

<td>

[64400 - 64499](/PortReference/Ports64400to64499)

</td>

</tr>

<tr>

<td>

[64500 - 64599](/PortReference/Ports64500to64599)

</td>

<td>

[64600 - 64699](/PortReference/Ports64600to64699)

</td>

<td>

[64700 - 64799](/PortReference/Ports64700to64799)

</td>

<td>

[64800 - 64899](/PortReference/Ports64800to64899)

</td>

<td>

[64900 - 64999](/PortReference/Ports64900to64999)

</td>

</tr>

<tr>

<td>

[65000 - 65099](/PortReference/Ports65000to65099)

</td>

<td>

[65100 - 65199](/PortReference/Ports65100to65199)

</td>

<td>

[65200 - 65299](/PortReference/Ports65200to65299)

</td>

<td>

[65300 - 65399](/PortReference/Ports65300to65399)

</td>

<td>

[65400 - 65499](/PortReference/Ports65400to65499)

</td>

</tr>

<tr>

<td>

[65500 - 65599](/PortReference/Ports65500to65599)

</td>

<td colspan="4" style="text-align: center">

</td>

</tr>

</tbody>

</table>

</div>

## Discussion

---

Imported from https://wiki.wireshark.org/PortReference on 2020-08-11 23:18:00 UTC
