# Development/CSVExport

## Information

  - <http://en.wikipedia.org/wiki/Comma-separated_values>

  - <http://www.creativyst.com/Doc/Articles/CSV/CSV01.htm> (very detailed information about the format)

  - <http://tools.ietf.org/html/rfc4180> (RFC about CSV)

## CSV export

We have several places in the WS code to export to CSV format now, and my feeling is that there are more than one implementation of the CSV export itself. Identify all places and make sure the implementation shares the same code.

  - File/Export/Filetype: "1","0.000000","213.254.239.60","192.168.1.10","HTTP","Continuation or non-HTTP traffic"

  - \!PacketListMenu/Copy/Summary(CSV): 3,0.009384,192.168.1.10,82.165.89.192,TCP,1902 \> 80 \[SYN\] Seq=0 Len=0 MSS=1460

  - \[add more here\]

## "Imported by" applications

Identify the applications to import "our CSV format" and the format they expect/accept:

  - Excel <http://en.wikipedia.org/wiki/CSV_application_support> indicates that it's using the current locale setting for the delimiter - e.g. ';'

  - openoffice calc: asks you what separator you want. As standard it sets TAB

  - Perl/Java/Awk etc: these can easily handle a format where the separator character never appears within the data; quoted parameters start to get tricky, as the quote character themselves may appear in the data.

  - \[add more here\]

## Wireshark CSV output filter

Some steps that might work to import into most "CSV aware" applications:

  - Win32: convert characters from internally used UTF8 to current locale e.g. using g\_locale\_from\_utf8 (do we need to do this on UNIX too?)
  - replace (encode) any " with ""
  - delimit each element with double qoutes "". This should prevent problems with ',' and 'CR'/'NL' (yes it is valid to have a CR or NL in a field), we are already doing this at most - but not all - csv export places

Well, obviously it would be a good idea to have all CSV export functions share the same code, so if we find another problem we could change it at a single code place - and don't forget it elsewhere like we currently do.

---

Imported from https://wiki.wireshark.org/Development/CSVExport on 2020-08-11 23:12:43 UTC
