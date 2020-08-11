# RADIUS Servers

RADIUS server packages generally include an authentication and accounting server and some administrator tools.

## Authentication Schemes

RADIUS servers support a wide variety of authentication schemes. A user supplies his authentication data to the server either directly by answering the terminal server's login/password prompts, or using PAP or CHAP protocols. The server obtains the user's personal data from one of the following places:

  - System Database  
    The user's login and password are stored in /etc/passwd on the server, i.e. they are a "normal" UNIX user on the system.

  - Internal Database  
    The user's login ID, password etc. are stored in the internal RADIUS server database. The user's password is stored in encrypted form using either MD5 or DES hash, whichever is appropriate. Alternatively, a plaintext password can also be used if CHAP protocol is being used; CHAP usage is strongly discouraged for security reasons.

  - SQL authentication  
    The user's details are stored in an SQL database. The database structure is fully determined by the system administrator; the RADIUS server does not restrict it in any way. See Interaction with SQL Servers.

  - PAM authentication  
    The user is authenticated via PAM (Pluggable Authentication Service) framework. See the Linux PAM homepage for more details.

## Accounting Schemes

RADIUS servers have three built-in accounting schemes:

  - Unix accounting  
    Accounting data are stored in radutmp/radwtmp files and can be viewed using radwho and radlast commands. Both commands are upward compatible with their Unix counterparts who and last.

  - Detailed accounting  
    The detailed accounting information is stored in plain text format. The resulting files can easily be parsed using standard text processing tools (grep, awk, etc.)

  - SQL accounting  
    Upon receiving accounting information the RADIUS server stores it in an SQL database. This can then be processed using standard SQL queries.

RADIUS servers are usually extensible and new accounting methods can be added using the extension language.

## Examples of RADIUS servers

[Free Radius server](http://www.freeradius.org)

[Open Radius server](http://sites.e-advies.nl/openradius/)

[Aradial Radius server](http://www.aradial.com)

[Cisco Radius server](http://www.cisco.com)

[SteelBelted Radius server](https://secureaccessworks.com/Steel-Belted-Radius.asp)

[Radius server for Billing solutions](http://www.radius-server.net)

[Cistron Radius server](http://www.radius.cistron.nl/)

[Interlink RADIUS Server](https://www.interlinknetworks.com/rad/)

---

Imported from https://wiki.wireshark.org/RadiusServers on 2020-08-11 23:23:48 UTC
