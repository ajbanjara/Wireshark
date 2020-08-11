# MATE's configuration tutorial

If you are new to MATE, you should first read the [Getting Started](/Mate/GettingStarted) page.

We'll show a MATE configuration that first creates Gops for every DNS and HTTP request, then it ties the Gops together in a Gop based on the host. Finally we'll separate into different Gogs request coming from different users.

With this MATE configuration loaded we can:

  - use **mate.http\_use.Duration \> 5.5** to filter frames based on the time it takes to load a complete page from the DNS request to resolve its name until the last image gets loaded.

  - use **mate.http\_use.client == "10.10.10.20" && mate.http\_use.host == "www.example.com"** to isolate DNS and HTTP packets related to a visit of a certain user.

  - use **mate.http\_req.Duration \> 1.5** to filter all the packets of HTTP requests that take more than 1.5 seconds to complete.

The complete config file is here: [web.mate](uploads/__moin_import__/attachments/Mate/Tutorial/web.mate)

Note: for this example I used *dns.qry.name* which is defined since Wireshark version 0.10.9. Supposing you have a mate plugin already installed you can test it with the current Wireshark version.

## A Gop for DNS requests

First we'll tell MATE how to create a Gop for each DNS request/response.

MATE needs to know what makes a DNS PDU. We describe it this using a `Pdu` declaration:

    Pdu dns_pdu Proto dns Transport ip {
      Extract addr From ip.addr;
      Extract dns_id From dns.id;
      Extract dns_resp From dns.flags.response;
    };

Using `Proto dns` we tell MATE to create Pdus every time it finds **dns**. Using `Transport ip` we inform MATE that some of the fields we are interested are in the **ip** part of the frame. Finally, we tell MATE to import *ip.addr* as `addr`, *dns.id* as `dns_id` and *dns.flags.response* as `dns_resp`.

Once we've told MATE how to extract `dns_pdu`s we'll tell it how to match requests and responses and group them into a Gop. For this we'll use a `Gop` declaration to define the Gop, and then, `Start` and `Stop` statements to tell it when the Gop starts and ends.

    Gop dns_req On dns_pdu Match (addr,addr,dns_id) {
      Start (dns_resp=0);
      Stop (dns_resp=1);
    };

Using the `Gop` declaration we tell MATE that the `Name` of the Gop is *dns\_req*, that *dns\_pdu*s can become members of the Gop, and what is the key used to match the Pdus to the Gop.

The key for this Gop is "*addr, addr, dns\_id*". That means that in order to belong to the same Gop, *dns\_pdu*s have to have both addresses and the *request id* identical. We then instruct MATE that a *dns\_req* starts whenever a *dns\_pdu* matches "*dns\_resp=0*" and that it stops when another dns\_pdu matches "*dns\_resp=1*".

At this point, if we open a capture file using this configuration, we are able to use a display filter **mate.dns\_req.Time \> 1** to see only the packets of DNS requests that take more than one second to complete.

We can use a display filter **mate.dns\_req && \! mate.dns\_req.Time** to find requests for which no response was given. **mate.xxx.Time** is set only for Gops that have being stopped.

## A Gop for HTTP requests

This other example creates a Gop for every HTTP request.

    Pdu http_pdu Proto http Transport tcp/ip {
      Extract addr From ip.addr;
      Extract port From tcp.port;
      Extract http_rq From http.request.method;
      Extract http_rs From http.response;
      DiscardPduData true;
    };
    
    Gop http_req On http_pdu Match (addr, addr, port, port) {
      Start (http_rq);
      Stop (http_rs);
    };

So, if we open a capture using this configuration

  - filtering with **mate.http\_req.Time \> 1** will give all the requests where the response header takes more than one second to come

  - filtering with **mate.http\_req.Duration \> 1.5** will show those request that take more than 1.5 seconds to complete.

You have to know that **mate.xxx.Time** gives the time in seconds between the pdu matching the [GopStart](/GopStart) and the Pdu matching the [GopStop](/GopStop) (yes, you can create timers using this\!). On the other hand, **mate.xxx.Duration** gives you the time passed between the [GopStart](/GopStart) and the last pdu assigned to that Gop regardless whether it is a stop or not. After the [GopStop](/GopStop), Pdus matching the Gop's Key will still be assigned to the same Gop as far as they don't match the [GopStart](/GopStart), in which case a new Gop with the same key will be created.

## Getting DNS and HTTP together into a Gog

We'll tie together to a single Gog all the http packets belonging to requests and responses to a certain host and the dns request and response used to resolve its domain name using the Pdu and Gop definitions of the previous examples

To be able to group DNS and HTTP requests together, we need to import into the Pdus and Gops some part of information that both those protocols share. Once the Pdus and Gops have been defined, we can use `Extract` (for Pdus) and `Extract` (for Gops) statements to tell MATE what other protocol fields are to be added to Pdus' and Gops' AVPLs. We add the following statements to the appropriate declarations:

    Extract host From http.host; // to Pdu http_pdu as the last Extract in the list
    Extra (host); // to Gop http_req after the Stop
    
    Extract host From dns.qry.name; // to Pdu dns_pdu as the last Extract in the list
    Extra (host); // to Gop dns_req after the Stop

Here we've told MATE to import *http.host* into `http_pdu` and *dns.qry.name* into `dns_pdu` as `host`. We also have to tell MATE to copy the `host` attribute from the Pdus to the Gops, we do this using `Extra`.

Once we've got all the data we need in Pdus and Gops, we tell MATE what makes different Gops belong to a certain Gog.

    Gog http_use {
      Member http_req (host);
      Member dns_req (host);
      Expiration 0.75;
    };

Using the `Gog` declaration we tell MATE to define a Gog type `Name`d *http\_use* whose expiration is 0.75 seconds after all the Gops that belong to it had been stopped. After that time, an eventual new Gop with the same key match will create a new Gog instead of been added to the previous Gog.

Using the `Member` statements we tell MATE that **http\_req**s with the same **host** belong to the same Gog, same thing for **dns\_req**s.

So far we have instructed mate to group every packet related to sessions towards a certain host. At this point if we open a capture file and:

  - a display filter **mate.http\_use.Duration \> 5** will show only those requests that have taken more than 5 seconds to complete starting from the DNS request and ending with the last packet of the http responses.

  - a display filter **mate.http\_use.host == "www.w3c.org"** will show all the packets (both DNS and HTTP) related to the requests directed to www.w3c.org

## Separating requests from multiple users

"Houston: we've had a problem here."

This configuration works fine if used for captures taken at the client's side but deeper in the network we'd got a real mess. Requests from many users get mixed together into `http_use`s. Gogs are created and stopped almost randomly (depending on the timing in which Gops start and stop). How do we get requests from individual users separated from each other?

MATE has a tool that can be used to resolve this kind of grouping issues. This tool are the `Transform`s. Once defined, they can be applied against Pdus, Gops and Gogs and they might replace or insert more attributes based on what's there. We'll use them to create an attribute named client, using which we'll separate different requests.

For DNS we need the *ip.src* of the request moved into the Gop only from the DNS request.

So we first tell MATE to import *ip.src* as **client**:

    Extract client From ip.src;

Next, we tell MATE to replace ( **dns\_resp=1, client** ) with just **dns\_resp=1** in the Pdu. That way, we'll keep the attribute **client** only in the DNS request Pdus (i.e. packets coming from the client).To do so, we have to add a `Transform `declaration (in this case, with just one clause) before the Pdu declaration which uses it:

    Transform rm_client_from_dns_resp {
      Match (dns_resp=1, client) Replace (dns_resp=1);
    };

Next, we invoke the transform by adding the following line after the `Extract` list of the dns\_pdu `Pdu`:

``` 
  Transform rm_client_from_dns_resp;
```

HTTP is a little trickier. We have to remove the attribute carrying *ip.src* from both the response and the "continuations" of the response, but as there is nothing to filter on for the continuations, we have to add a fake attribute first. And then we have to remove **client** when the fake attribute appears. This is possible due to the fact that the `Match` clauses in the `Transform` are executed one by one until one of them succeeds. First, we declare another two `Transform`s:

    Transform rm_client_from_http_resp1 {
      Match (http_rq); //first match wins so the request won't get the not_rq attribute inserted
      Match Every (addr) Insert (not_rq); //this line won't be evaluated if the first one matched so not_rq won't be inserted to requests
    };
    
    Transform rm_client_from_http_resp2 {
      Match (not_rq, client) Replace (); //replace "client and not_rq" with nothing (will happen only in the response and eventual parts of it)
    };

Next, we add another `Extract` statement to the `http_pdu` declaration, and apply both `Transform`s declared above in a proper order:

``` 
  Extract client From ip.src;
  Transform rm_client_from_http_resp1, rm_client_from_http_resp2;
```

In MATE, all the `Transform`s listed for an item will be evaluated, while inside a single `Transform`, the evaluation will stop at the first successful `Match` clause. That's why we first just match *http\_rq* to get out of the first sequence before adding the *not\_rq* attribute. Then we apply the second `Transform` which removes both *not\_rq* and *client* if both are there. Yes, `Transform`s are cumbersome, but they are very useful. The plan is to improve them, any [Ideas](/Mate/Discussion)?

Once we got all what we need in the Pdus, we have to tell MATE to copy the attribute *client* from the Pdus to the respective Gops, by adding client to `Extra` lists of both Gop declarations:

    Extra (host, client);

On top of that, we need to modify the old declarations of Gop key to new ones that include both *client* and *host*. So we change the Gog `Member` declarations the following way:

``` 
  Member http_req (host, client);
  Member dns_req (host, client);
```

Now we got it, every "usage" gets it's own Gog.

---

Imported from https://wiki.wireshark.org/Mate/Tutorial on 2020-08-11 23:16:37 UTC
