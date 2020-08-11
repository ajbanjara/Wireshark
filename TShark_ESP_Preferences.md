In order to enable ESP decoding for TShark, the \~/.wireshark/preferences file must be edited by hand. The key/value pairs in question are below:

    # This is done only if the Decoding is not SET or the packet does not
    # belong to a SA. Assumes a 12 byte auth
    # (HMAC-SHA1-96/HMAC-MD5-96/AES-XCBC-MAC-96) and attempts decode based
    # on the ethertype 13 bytes from packet end
    
    # TRUE or FALSE (case-insensitive).
    esp.enable_null_encryption_decode_heuristic: TRUE
    
    # Attempt to decode based on the SAD described hereafter.
    # TRUE or FALSE (case-insensitive).
    esp.enable_encryption_decode: FALSE
    
    # Attempt to Check ESP Authentication based on the SAD described hereafter.
    # TRUE or FALSE (case-insensitive).
    esp.enable_authentication_check: FALSE
    
    # SA identifier.  Must have the form "Protocol|Source
    # Address|Destination Adress|SPI". Example:
    # "IPv4|192.168.0.45|10.1.2.7|*" See the ESP Preferences page on the
    # Wireshark wiki (http://wiki.wireshark.org/ESP_Preferences) for more
    # details.
    
    # A string.
    esp.sa_1:
    
    # Encryption algorithm
    # One of: NULL, TripleDES-CBC [RFC2451], AES-CBC [RFC3602], AES-CTR
    # [RFC3686], DES-CBC [RFC2405], BLOWFISH-CBC [RFC2451], TWOFISH-CBC
    # (case-insensitive).
    esp.encryption_algorithm_1: NULL
    
    # Authentication algorithm
    # One of: NULL, HMAC-SHA1-96 [RFC2404], HMAC-SHA256, HMAC-MD5-96
    # [RFC2403], ANY 12-bytes of Authentication [No Checking]
    # (case-insensitive).
    esp.authentication_algorithm_1: NULL
    
    # Encryption key. May be ASCII or hexadecimal (if prepended with 0x).
    # See the ESP Preferences page on the Wireshark wiki
    # (http://wiki.wireshark.org/ESP_Preferences) for supported sizes.
    
    # A string.
    esp.encryption_key_1:
    
    # Authentication key. May be ASCII or hex (if prepended with 0x). See
    # the ESP Preferences page on the Wireshark wiki
    # (http://wiki.wireshark.org/ESP_Preferences) for supported sizes.
    
    # A string.
    esp.authentication_key_1:

---

Imported from https://wiki.wireshark.org/TShark_ESP_Preferences on 2020-08-11 23:26:57 UTC
