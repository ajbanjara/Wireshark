# Network Lock Manager Protocol (NLM)

The purpose of the NLM protocol is to provide something similar to POSIX advisory file locking semantics to [NFS](/NFS) version 2 and 3. This protocol is closely tied with the [NFS](/NFS) protocol itself since it shares the file handle data structure with [NFS](/NFS), with the [NSM](/NSM) protocol which the lock manager uses to recover from peer restarts, and, on some platforms the [KLM](/KLM) protocol which is used to communicate between the NFS client code in the kernel and the user space lock manager.

The lock manager is typically implemented completely inside user space in a lock manager daemon; that daemon will receive messages from the NFS client when a lock is requested, and will send NLM requests to the NLM server on the NFS server machine, and will receive NLM requests from NFS clients of the machine on which it's running and will make local locking calls on behalf of those clients.. You need to run this lock manager daemon on BOTH the client and the server for lock management to work. The NFS client code in the kernel will use a different protocol to talk to the lock manager daemon; for example, it might use Sun's [KLM](/KLM) protocol across the loopback interface, or it might use a different protocol across a local named pipe as is the case on some BSDs.

## History

The NLM protocol came after the original release of [NFS](/NFS) when byte-range locking support was added in SunOS, as locking more obviously requires a stateful protocol. The purpose of the protocol is to implement POSIX-style file locking for [NFS](/NFS) services.

There has been 4 different versions of the [NLM](/NLM) protocol, versions 1 to 3 are all virtually identical with the exception of extra functions being added to version 2 and 3 to accomodate non-UNIX (read PC-NFS for DOS and Windows) clients. These versions are all for version 2 of [NFS](/NFS).

When version 3 of [NFS](/NFS) was released, the file handle structure for the [NFS](/NFS) protocol changed its wire format. Since the NLM protocol shares this structure with the [NFS](/NFS) protocol this required a new version of NLM to be specified. Version 4 of NLM is used together with [NFS](/NFS) version 3.

With version 4 of [NFS](/NFS) the NLM protocol has been eliminated and the locking functions are there implemented in the [NFS](/NFS) protocol itself.

Due to poor documentation of the protocol and inherent race problems in the protocol there has historically been very very problematic to implement this protocol in a robust and reliably way. Problems with this protocol often result in

  - files becoming locked forever (client forgot to unlock a file)
  - client hangs
  - file corruption (two processes simultaneously holding an exclusive lock to a file)

These situations above often result from such normal and simple simple things such as retransmissions or packet reordering on the network.  
Many applications therefore implement their own application style file locking instead of relying on the file locking fcntl calls using simple files, often refered to .LOCK files.

## Protocol dependencies

  - [ONC-RPC](/ONC-RPC): The NLM protocols is implemented on top of [ONC-RPC](/ONC-RPC) as program number 100021. NLM is usually implemented on top of [UDP](/UDP) but clients using [TCP](/TCP) do exist.

  - [Portmap](/Portmap): A client usually needs the [Portmap](/Portmap) service in order to discover which port the NSM service is available on.

  - [NSM](/NSM): Lock manager peers rely on the [NSM](/NSM) protocol to notify each other of service restarts/reboots so that locks can be resynchronized after a reboot.

  - [KLM](/KLM): On some platforms, the interface over the loopback interface where the NFS client code in the kernel talks to the user space lock manager.

## Functions

Forgetting about the special functions added for PC-NFS and other non-UNIX clients, this protocol only implements 6 functions : Null, Test, Lock, Unlock, Cancel and Granted.

  - Null : this functions is the standard "ping" function that all [ONC-RPC](/ONC-RPC) services use, it is merely used to "ping" the service to see that it is alive and well.

  - Test : This function was intended to be used to "test" if a lock request would succeed or not. This is not useful in reality since the lock state on the server can and often will change between when the test call completed and before the response will reach the client. No client implementations ever use this function.

  - Lock : this function is used to request a lock to be taken out on the server. In case of a request for an exclusive lock request lock contention can occur (someone else already has a lock for the file) and the lock can not be granted to the client. Instead of just reporting a failure to aquire the lock and having the clients to continously poll for the lock, the server will here respond with a BLOCKED response, telling the client that the lock can not be granted right now but that the server will perform a Granted callback back to the client when the lock is available and has been assigned to the client. Note that the Granted messages can become lost on the network which is why the clients will still retransmit the original request if it hasnt been granted a blocked lock once every 10 or 20 seconds or so. Since locks are usually very short lived, many servers will when it encounters a request that would block, postpone execution of the locking request for some miliseconds on the opportunistic assumption that the lock might have become available sometime later and thus the entire blocked and granted handshake will be short-circuited.

  - Unlock : This function will release a lock that is held (or blocked) back to the server.

  - Cancel : this function is identical to Unlock and many implementations have Cancel just be a simple stub function that just calls the Unlock function anyway. For people analyzing network traces these functions do actually differ and provide additional information : Unlock are usually used when the application is explicitly releasing a lock by the fcntl() call. Cancel is usually issued by the lock manager after the application has terminated without cleaning up the locks after itself. I.e. Cancel means the application holding the lock has terminated and it is the VFS layer in the kernel that is cleaning up the allocated resources.

  - Granted : This function is used by the server when a blocked lock has become available and is used to make a call back to the client to tell it that it has required the lock.

## Idempotence

In order to be idempotent, an implementation MUST respond with the same response to all duplicated requests, i.e. implement execute-at-most-once semantics. In presence of retransmissions this does affect this protocol slightly and not all implementations have got this right. This does mean that the response codes for the functions change their meaning slightly, the easiest way to see this is as having the response codes describing the resulting state on the server after the call has completed and not whether a state transition actually occured. This can be seen if one sends Unlock requests for locks that does not exist : the server will still respond with Unlock successful since the lock does not exist after the call completed, that the lock didnt exist even before the call was initiated is irrelevant.

Some client implementations are not idempotent which causes problems for servers. In particular some non-Solaris legacy unix implementations are not idempotent in the Granted call and return different response codes depending on whether the state transition occured or not. Servers work around this by always ignoring completely the response code to Granted calls and treating any and all responses as success.

## Synchronous vs Asynchronous NLM

There are two styles of NLM which both provide the same functions; Synchronous and Asynchronous. While almost all implementations use the synchronous version, some older legacy unixen such as HP-UX do use the Asynchronous version. The main difference is that Synchronous NLM is a normal [ONC-RPC](/ONC-RPC) request/response protocol while the asynchronous version is a message/message protocol.

In the asynchronous version of NLM there will not be any [ONC-RPC](/ONC-RPC) layer responses, instead the NLM responses are sent back as [ONC-RPC](/ONC-RPC) request messages. This means that the [ONC-RPC](/ONC-RPC) transaction id (XID) can not be used to match "request" with "responses", nor can the XID be used to detect potential retransmissions. Instead, the cookie field in the beginning of every NLM PDU is used to match requests and responses. This cookie field is also present in the synchronous version of NLM but has no semantic meaning there. Wireshark has a preference setting which can allow Wireshark to match requests with responses based on the cookie, this preference is off by default.

## Wireshark

The NLM dissector is fully functional. The [Service Response Time](/Service-Response-Time) statistics feature in both Wireshark and TShark can calculate response time statistics for this protocol.

By enabling the appropriate preference for NLM Wireshark can even match MSG and RES packets for asynchronous NLM and measure response time for that type of NLM.

## Preference Settings

  - [NLM Preferences](/NLM-Preferences)

  - [NFS\_Preferences](/NFS_Preferences) (NLM shares the filehandle structure with [NFS](/NFS) so the NFS preferences affect NLM as well)

## Example capture file

XXX here we need someone donating a sample capture file containing the NLM protocol

## Display Filter

A complete list of NLM display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/n/nlm.html)

Show only the NLM protocol:

``` 
 nlm 
```

## Capture Filter

You cannot directly filter on the NLM protocol while capturing. Since NLM does not use a standard port you can not capture on a specific port either.

## External links

  - [The Open Group's NFS standard which describes part of the NLM protocol](http://www.opengroup.org/pubs/catalog/c702.htm)  

Keep in mind, there is no standard for the NLM protocol, the only thing that exists for this protocol is an interface specification describing the packet format. This is one reason why there have historically been so many problems with this protocol.

## Tools

  - rpcinfo can be used to "ping" the NLM service on a server.

## Discussion

---

Imported from https://wiki.wireshark.org/Network_Lock_Manager on 2020-08-11 23:17:23 UTC
