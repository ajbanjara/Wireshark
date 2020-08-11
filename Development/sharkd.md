## Background

I am interested in sharkd but I couldn't find any doc for it, so I created this page.

## Introduction

sharkd is a daemon (service) that offers Wireshark functionality through a TCP service. In Windows, you start it like this:

``` 
  sharkd tcp:127.0.0.1:4446
```

This starts the service accessible via localhost port 4446.

Commands and responses are in JSON format, for example:

``` 
  { "req": "status" }
```

Gets the current status of sharkd. A typical response is:

``` 
  {"frames":10903,"duration":94.610105000,"filename":"bad_syn.pcapng","filesize":5472888}
```

## Testing with Putty

Suitable putty settings are:

  - Host Name (or IP address): localhost
  - Port: 4446
  - Connection Type: Raw

When you successfully connect, the daemon writes a stdout message:

``` 
  Hello in child.
```

If you send invalid JSON on the connection, sharkd writes the stdout message:

``` 
  invalid JSON -> closing
```

and closes the putty session.

## Commands

These are the supported commands:

To follow

As far as I can tell, sharkd doesn't support the use of new line in the JSON and so all commands must be on a single line.

---

Imported from https://wiki.wireshark.org/Development/sharkd on 2020-08-11 23:13:05 UTC
