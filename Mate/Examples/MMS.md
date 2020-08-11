## MATE MMS Example

This is a complex configuration example for MATE. This config tells mate how to relate the various parts of a MMS (Mobile Multimedia Message) delivery and retrieval and its degree of success.

First we'll explain how MMS delivery is performed, which protocols it uses and which messages are passed between the various elements. Then we'll explain how MATE can track the various parts of this communication, how this parts are grouped toghether and, finally, how to keep track of the state of the various transactions involved.

The complete example configuration is here: [mms.mate](uploads/__moin_import__/attachments/Mate/Examples/MMS/mms.mate)

### How an MMS gets delivered

MMSs use MMSE over HTTP and/or WSP over IP (GPRS) as a transport mechanism.

The first part of sending an MMS is done internally to the phone, the parts of the message are encoded into an MMSE message.

Once the message is encoded it will be sent to the MMSC (MMS Center) using an HTTP POST whose body is the encoded MMS message. If everything worked the MMSC will respond to your phone with a send-confirm message as the body of the HTTP response.

At that time (supposing the recipient's phone is present in the network at the time) the MMSC will start to send notify-indications (using WSP PUSH) to the recipient's phone.

When the recipient's phone receives the notification it will ask the user whether he/she wants to retrieve the message at that time, if he/she doesn't want to, the phone will send an a deferred message back to the MMSC and try to retrieve it later.

If instead the user wants to retrieve the message immediately (or the phone is configured to do so) the phone will request (HTTP GET) the url given in the notify-indication to fetch the message. The response to that request should contain a retrieve-conf message with the MMS parts in it.

Once the retrieve-conf has being received the phone will notify the MMSC that the message was recieved using a notify-response message as the body of an HTTP POST request, at this point the MMSC should respond with just the HTTP OK message.

The notify-response causes the MMSC to send a delivery-report (via WSP PUSH) to the originator's phone if it was instructed to do so.

![mms\_ucs.png](uploads/__moin_import__/attachments/Mate/Examples/MMS/mms_ucs.png "mms_ucs.png")

### Which ways an MMS can go wrong

![mms\_flow.png](uploads/__moin_import__/attachments/Mate/Examples/MMS/mms_flow.png "mms_flow.png")

### Extracting and identifying the MMS Pdus

### Handling HTTP sessions

### Handling of WSP sessions

### Keeping track of the state of the MMS delivery

---

Imported from https://wiki.wireshark.org/Mate/Examples/MMS on 2020-08-11 23:16:32 UTC
