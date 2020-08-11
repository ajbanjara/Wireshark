## Preferences

For a complete description of Wireshark's preferences, see the [User's Guide](https://www.wireshark.org/docs/wsug_html/#ChCustPreferencesSection). Some protocol preferences are described below.

  - Protocols
      - HTTP [HTTP\_Preferences](/HTTP_Preferences)
    
      - IP [IP\_Reassembly](/IP_Reassembly)
    
      - ISMACryp [ISMACryp\_Preferences](/ISMACryp_Preferences)
    
      - iSNS [iSNS\_Preferences](/iSNS_Preferences)
    
      - NDMP [NDMP\_Preferences](/NDMP_Preferences)
    
      - NFS [NFS\_Preferences](/NFS_Preferences)
    
      - SCSI [SCSI\_Preferences](/SCSI_Preferences)
    
      - SIMULCRYPT [SIMULCRYPT\_Preferences](/SIMULCRYPT_Preferences)
    
      - [SNMP](/SNMP)
    
      - TCP
        
          - [TCP\_Reassembly](/TCP_Reassembly)
        
          - [TCP\_Checksum\_Verification](/TCP_Checksum_Verification)
        
          - [TCP\_Analyze\_Sequence\_Numbers](/TCP_Analyze_Sequence_Numbers)
        
          - [TCP\_Relative\_Sequence\_Numbers](/TCP_Relative_Sequence_Numbers)
    
      - IPsec
        
          - ESP [ESP\_Preferences](/ESP_Preferences)

## Comments

  - How should we add the protocol preferences? Do we do one page per protocol, or do we list each preference on a separate wiki page? -- *Olivier Biot*
    
    Good question, I think it would be good with one page for each preference setting, so it is easy to find it both by searching for it as well as from the index. Maybe also with one main page for the protocol that links to the protocol specific preferences. So that all the TCP preferences above would still remain as separate pages but the TCP above would be come its own page and the three preferences for TCP would be linkes from that page. I dont feel strongly about how we add it so anyone make a decision and I will follow it (ronnie) (Stephen Flynn) I think one page per protocol will be cleaner looking and easier to find, since many preferences only need a couple of lines to describe them. Only on the protocols like TCP, where bigger descriptions are required, do we need to break out new pages per preference setting.

  - Don't forget to tell folks that want to use the "Save" button, that it is enabled via a check box at the bottom of the first page of the preferences editor titled "Settings dialogs show a save button: " - otherwise they may never find the "Save" button. The file saved will appear in the {username}'s Document\&Settings\\[ApplicationData](/ApplicationData)\\Wireshark directory, called "preferences" (at least with the Windoze). /;^) A\_Sieg \<@\> NASA.gov

  - How about command line preferences in the form namepref:value? Is there a reference to valid names? Currently, no; we could add another option to the "-G" flag in TShark to write a list of preferences to the standard output, and process that output into a manual page or other form of documentation. -- *Guy Harris*

---

Imported from https://wiki.wireshark.org/Preferences on 2020-08-11 23:18:18 UTC
