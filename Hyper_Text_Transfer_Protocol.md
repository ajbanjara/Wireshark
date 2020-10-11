# Hyper Text Transfer Protocol (HTTP)

The Hyper Text Transport Protocol is a text-based request-response client-server protocol. A HTTP client (e.g. a web browser such as [Mozilla](http://www.mozilla.org/)) performs a HTTP request to a HTTP server (e.g. the [Apache HTTP server](http://httpd.apache.org/)), which in return will issue a HTTP response. The HTTP protocol header is text-based, where headers are written in text lines.

HTTP/1.1 allows for client-server connections to be pipelined, whereby multiple requests can be sent (often in the same packet), without waiting for a response from the server. The only restriction is the server MUST return the responses in the same order as they were received. This enables greater efficiency, especially on revalidation.

An encrypted variant named HTTPS is also available. This is often used where privacy of data is necessary, e.g. when using online banking. The HTTPS protocol is in fact two protocols running on top of each other. The first protocol is a security protocol like [SSL](/SSL), [TLS](/TLS) or [PCT](/PCT). The second protocol, which runs on top of this security protocol, is HTTP. The URLs starting with <https://> really are only a shorthand notation for the end user. The web browser will read the URI scheme (<https://>), initiate the security protocol to the server, and once this secure connection is established, issue a HTTP request over it with the URI specified in the request.

## History

The Hyper Text Transfer Protocol (HTTP) was initiated at the CERN in Geneve (Switzerland), where it emerged (together with the HTML presentation language) from the need to exchange scientific information on a computer network in a simple manner. The first public HTTP implementation only allowed for plain text information, and almost instantaneously became a replacement of the GOPHER service. One of the first text-based browsers was [LYNX](http://lynx.browser.org/) which still exists today; a graphical HTTP client appeared very quickly with the name NCSA Mosaic. Mosaic was a popular browser back in 1994. Soon the need for a more rich multimedia experience was born, and the markup language provided support for a growing multitude of media types.

Support for multiple media types was already part of the informal HTTP/1.0 standard published as [RFC1945](http://www.ietf.org/rfc/rfc1945.txt) back in 1996. As the community using HTTP grew at an incredibly fast pace, and thanks to usage experience gathered by the community and processed by experts, the need for a more formal definition of the HTTP protocol emerged. Hence HTTP/1.1 was published, first as [RFC2068](http://www.ietf.org/rfc/rfc2068.txt) in January 1997, soon superseded by [RFC2616](http://www.ietf.org/rfc/rfc2616.txt) published in June 1999.

## Protocol dependencies

  - [MIME\_multipart](/MIME_multipart): HTTP uses [MIME\_multipart](/MIME_multipart) to encode its messages.

  - [TCP](/TCP): Typically, HTTP uses [TCP](/TCP) as its transport protocol. The well known TCP port for HTTP traffic is 80. A HTTP proxy often uses a different port; typical values are 81, 3128, 8000 and 8080. However, HTTP can use other transport protocols as well.

## Example traffic

**Request by an end-user's browser**

This user wants to access the web site "www.freebsd.org", so they type in <http://www.freebsd.org> into their browser and hit enter. After the usual DNS resolution to find the IP address for www.freebsd.org, a connection is initiated via TCP to the web server (SYN; SYN,ACK; ACK). The very next thing to be sent to the web server by the browser/client is the following plain text request:

    GET / HTTP/1.1
    Host: www.freebsd.org
    User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.7.7) Gecko/20050414 Firefox/1.0.3
    Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
    Accept-Language: en-us,en;q=0.5
    Accept-Encoding: gzip,deflate
    Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7
    Keep-Alive: 300
    Connection: keep-alive
    If-Modified-Since: Mon, 09 May 2005 21:01:30 GMT
    If-None-Match: "26f731-8287-427fcfaa"

The server knows the browser/client is done with its traffic when it receives a blank line with a carriage return + line feed (\\r\\n).

**Response from the server**

The response is also in plain text:

    HTTP/1.1 200 OK
    Date: Fri, 13 May 2005 05:51:12 GMT
    Server: Apache/1.3.x LaHonda (Unix)
    Last-Modified: Fri, 13 May 2005 05:25:02 GMT
    ETag: "26f725-8286-42843a2e"
    Accept-Ranges: bytes
    Content-Length: 33414
    Keep-Alive: timeout=15, max=100
    Connection: Keep-Alive
    Content-Type: text/html

The browser/client now knows that text/html is coming, and here it is:

    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html>
    <!-- Rest of the HTML Page Here -->
    </html>

The browser/client knows the server is done sending its html (or data for non-html) when it receives a blank line with a carriage return + line feed (\\r\\n).

## Wireshark

Wireshark's HTTP dissector is fully functional (XXX - is that really true?). (XXX - add some words about MIME body data encoding/enchunking here). In addition, you can get basic statistics about HTTP requests/responses using Wireshark's menu item: *Statistics/HTTP*.

## Preference Settings

There are some [HTTP\_Preferences](/HTTP_Preferences).

## Example capture file

[SampleCaptures/http.cap](uploads/27707187aeb30df68e70c8fb9d614981/http.cap) A simple HTTP request and response.

[SampleCaptures/http\_gzip.cap](uploads/__moin_import__/attachments/SampleCaptures/http_gzip.cap). A simple HTTP request and a one packet gzip Content-Encoded response. Try this capture if you are having problems decompressing Content-Encoded packets, as this works with the default preferences.

## Display Filter

A complete list of HTTP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/h/http.html)

Show only the http based traffic:

``` 
 http 
```

Show only the famous "404: page not found" responses:

``` 
 http.response.code == 404 
```

Show only file data received over HTTP (the content of the responses):

``` 
 http.content_type 
```

## Capture Filter

You cannot directly filter HTTP protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

Capture HTTP traffic over the default port (80):

``` 
 tcp port 80 
```

Capture HTTP traffic over the default SSL port (443):

    tcp port 443 

## External links

  - [RFC1945](http://www.ietf.org/rfc/rfc1945.txt) Hypertext Transfer Protocol -- HTTP/1.0

  - [RFC2068](http://www.ietf.org/rfc/rfc2068.txt) Hypertext Transfer Protocol -- HTTP/1.1 (obsoleted by RFC2616)

  - [RFC2616](http://www.ietf.org/rfc/rfc2616.txt) Hypertext Transfer Protocol -- HTTP/1.1

  - [HTTP Specifications and Drafts](http://www.w3.org/Protocols/Specs.html) page at the [W3C](/W3C)

  - [RFC2660](http://www.ietf.org/rfc/rfc2660.txt) The Secure [HyperText](/HyperText) Transfer Protocol (S-HTTP)

## Discussion

---

Imported from https://wiki.wireshark.org/Hyper_Text_Transfer_Protocol on 2020-08-11 23:14:53 UTC
