# Paltalk

From [Wikipedia](http://en.wikipedia.org/wiki/Paltalk):

Paltalk is an internet chat service for text, voice and video chatting. The Paltalk Messenger program is in a free, banner-supported format. It has an ad-free version that requires users to subscribe. Paltalk is only available to users of Microsoft Windows. The program now identifies itself as [PaltalkScene](/PaltalkScene), a change that was made in September 2007.

## History

Paltalk protocols and official Paltalk applications have been proprietary since their introduction. It seems there exists no open source project which implements it, even partially.

## Protocol dependencies

  - [TCP](/TCP): Typically, Paltalk uses [TCP](/TCP) as its transport protocol for text messaging service. The well known TCP port for Paltalk text messaging traffic is 5001.

## Example traffic

XXX - Add example decoded traffic for Paltalk protocol here (as plain text or Wireshark screenshot).

## Wireshark

Wireshark includes a preliminary Paltalk dissector since version 1.2.0.

## Preference Settings

(XXX add links to preference settings affecting how Paltalk is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

  - [SampleCaptures/paltalk-secured.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/paltalk-secured.pcap.gz)

## Display Filter

Show only the Paltalk based traffic:

``` 
 paltalk 
```

## Capture Filter

You cannot directly filter Paltalk protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

The Wireshark dissector mentioned above automatically filters Paltalk traffic using source and destination IP address.

## External links

  - <http://www.paltalk.com/> Paltalk official site

  - <http://en.wikipedia.org/wiki/Paltalk> Wikipedia page on Paltalk

  - <http://paltalk.wikidot.com/> An unofficial effort to document Paltalk protocols

  - <http://www.locohacker.net/instant-messenger/> There are some discussion about the protocol in locohacker.net forums

## Discussion

---

Imported from https://wiki.wireshark.org/Paltalk on 2020-08-11 23:17:48 UTC
