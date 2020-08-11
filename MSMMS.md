# Microsoft Media Server (MSMMS)

Normally known just as MMS, the name MSMMS was chosen to avoid clashing with the abbreviation used for the Multimedia Messaging Service.

It is a transport used by Microsoft Media Player (other transports carried over [HTTP](/HTTP) and [RTSP](/RTSP) are also in use) and compatible media players.

## Protocol dependencies

  - [TCP](/TCP) carries the control traffic. The well known [TCP](/TCP) port for MSMMS traffic is 1755. Data can either be multiplexed over the same [TCP](/TCP) connection, or alternatively, a separate [UDP](/UDP) stream can be negotiated.

## Wireshark

The MSMMS dissector shows most of the known command parameters, and the pre-header for data frames.

## Preference Settings

There are currently no preference settings for this protocol.

However, in order to see re-assembled frames, it is recommended that you enable 'Reassemble fragmented IP datagrams' for IP and 'Allow subdissector to reassemble TCP streams' for TCP.

## Display Filter

A complete list of MSMMS display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/m/msmms.html)

Show only the MSMMS based traffic:

``` 
 msmms 
```

## Capture Filter

You cannot directly filter MSMMS protocols while capturing. You can filter on the server port number.

Capture only the MSMMS traffic over the default port (1755):

``` 
 tcp port 1755 
```

## External links

  - Information found at [this website](http://sdp.ppona.com/) was used to write the dissector.

## Discussion

---

Imported from https://wiki.wireshark.org/MSMMS on 2020-08-11 23:16:57 UTC
