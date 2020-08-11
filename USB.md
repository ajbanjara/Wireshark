# Sniffing from USB ports

The current cvs version of libpcap (9 October 2006) supports sniffing from USB ports, at least for the Linux platform with the 2.6.9 and later kernels with the usbmon infrastructure. See [CaptureSetup/USB](/CaptureSetup/USB) for information on this.

In a preliminary version of the libpcap support for USB sniffing, USB buses were listed as "interfaces" with a data link type of DLT\_USB (186). In the current implementation the data link type is DLT\_USB\_LINUX (189). For each captured 'packet' (URB, using the USB terminology) the kernel (and thus libpcap) provides two 'events':

  - a 'submit', issued when the USB data transfer begins
  - a 'completion' or an 'error', issed after the data transfer completion.

Each event contains a header, described by the following structure:

    typedef struct _usb_header {
       u_int64_t id;
       u_int8_t event_type;
       u_int8_t transfer_type;
       u_int8_t endpoint_number;
       u_int8_t device_address;
       u_int16_t bus_id;
       char setup_flag;
       char data_flag;
       int64_t ts_sec;
       int32_t ts_usec;
       int32_t status;
       u_int32_t urb_len;
       u_int32_t data_len;
       pcap_usb_setup setup;
    } pcap_usb_header;

The 'id' field is used to link a 'submit' event with its coupled 'completion' or 'error' event.

The 'event\_type' can be one of 'S', 'C' or 'E', to specify respectively, a 'submit', a 'completion' or an 'error' event.

The 'transfer\_type' specifies if this transfer is isochronous (0), interrupt (1), control (2) or bulk (3).

The 'endpoint\_number' also specifies the transfer direction: if the bit 0x80 is set, the direction is input (from the device to the host), otherwise it is output (from the host to the device).

If the 'setup\_flag' is 0, than the setup data is valid. If the 'data\_flag' is 0, then this header is followed by the data with the associated URB. In an error event, the 'status' field specifies the error code.

The header, except for the 'setup' field, is in host byte order.

The setup structure follows the USB specification for the setup header and thus is in little endian byte order. The USB data is present only in one of two events associated with an URB. If the transfer direction is from the host to the device, the data is present in the 'submit' event, otherwise the data is present in the 'completion' event. The amount of data effectively present into the event can be less than the amount of data effectively exchanged.

For Linux kernel versions less than 2.6.21-rc1 the USB data is provided by means of a 'text' API, which limits the storage for captured data to 32 bytes. This kind of API requires debugfs to be mounted in /sys/kernel/debug in order to be functional. Recently a new 'binary' API as been added to the Linux kernel, removing any restriction on the amount of capturable data for each URB. This new API is available in the Linux kernel starting from version 2.6.21-rc1.

Some raw USB sample captures for the 'old' data link type are available on the [SampleCaptures](/SampleCaptures) wiki page.

---

Imported from https://wiki.wireshark.org/USB on 2020-08-11 23:27:06 UTC
