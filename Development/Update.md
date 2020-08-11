# Wireshark Update

On Windows, there's commonly no thing like a package manager as on (most?) linux systems. There's the WSUS service, which is unfortunately only for microsoft products and not available for other projects.

Some open source projects (e.g. Firefox) have build their own version check / update mechanisms. Under "Help/Check for Updates..." the user can trigger a version check (it's also done in a frequent way automatically). If there's a new version available, it displays a dialog asking if the user wants to install that update.

As this seems to be a problem on Microsoft Windows systems only, the following will focus on MS Windows. The basic mechanisms could be applied to other platforms as well, if there's demand for it.

So the update mechanism should do the following:

  - download an update file from the internet according to the current version and platform (url and file format see below)
  - if updates available, show a dialog to ask the user to proceed with the update
  - install the update:
      - download the corresponding installer file (e.g. wireshark-setup-0.99.8.exe)
      - check integrity to detect download problems (info from the update file e.g. md5 checksum)
      - call the installer (in effect ending a running wireshark program to be able to replace files)

The URL of the update file should contain version and platform information, some examples could look like:

  - <https://update.wireshark.org/wireshark/0.99.8/release/win-setup/windows-2003-64/>

  - <https://update.wireshark.org/wireshark/0.99.8/release/win-u3/windows-2003-64/>

  - <https://update.wireshark.org/wireshark/0.99.8/pre-release/win-setup/windows-xp/>

  - <https://update.wireshark.org/wireshark/0.99.8/21242/win-setup/windows-XP/>

However, details of the URL still has to be specified.

An example update file could look like:

    # this file's URL (to be able to move the location later)
    update.display: The Wireshark update file base location
    update.info: http://www.wireshark.org/update
    update.version: 0.0.1
    update.update.url: http://www.wireshark.org/update
    # the wireshark setup
    wireshark.setup.display: The Wireshark Windows installer
    wireshark.setup.info: http://www.wireshark.org/download.html
    wireshark.setup.version: 0.99.4
    wireshark.setup.update.url: http://switch.dl.sourceforge.net/sourceforge/wireshark/wireshark-setup-0.99.4.exe
    wireshark.setup.update.url2: http://heanet.dl.sourceforge.net/sourceforge/wireshark/wireshark-setup-0.99.4.exe
    # add more sf.net mirrors here ...
    # an alternative would be to use the round-robin scheduler of sourceforge
    # wireshark.setup.update.url: ftp://dl.sourceforge.net/pub/sourceforge/w/wi/wireshark/wireshark-setup-0.99.4.exe
    wireshark.setup.update.md5: 2556a31d0d770dd1990bd67b98bd2f9b
    # the WinPcap setup
    winpcap.display: The WinPcap version recommended for Windows XP
    winpcap.info: http://www.winpcap.org/
    winpcap.version: 3.1
    winpcap.update.url: http://www.winpcap.org/install/bin/WinPcap_3_1.exe
    winpcap.update.md5: 2556a31d0d770dd1990bd67b98bd2f9b

## External Links

  - [Mozilla's AUS](http://wiki.mozilla.org/AUS)

  - [Autoupdate example on CodeGuru](http://www.codeguru.com/Cpp/Cpp/cpp_mfc/tutorials/article.php/c9331)

  - [GUP for Win32](http://gup-w32.sourceforge.net/)

## Questions

  - are there better ways to do this?
    
    We might want to use an approach similar to Mozilla's AUS, where the client specifies their version and platform in the request, e.g. <http://update.wireshark.org/wireshark/0.99.8/windows-2003-64/>. That would save a little work on the client side. -- [GeraldCombs](/GeraldCombs)
    
      - Sounds like a good idea, I had similiar in mind a while ago. This will: ( -- [UlfLamping](/UlfLamping) )
        
          - \+ make the individual update file shorter (e.g. no separate winpcap entries for each platform)
          - \- require to change more files (for every platform) if a new version is available
          - because of this the update files might better be server side script generated "on demand"
          - I guess this makes it more flexible to handle "special cases" as we cannot change the installed programs out there but at least things on the server side

  - how to add a GPG signature to this file (and still be possible to read from WS file processing functions)?
    
    We could use a TLS/SSL connection instead. This would also help prevent man-in-the-middle attacks. -- [GeraldCombs](/GeraldCombs)
    
      - The prototype I'm currently working on is using wininet.dll - simply changing the URL to <https://> seems to work well -- [UlfLamping](/UlfLamping)

  - how do we select between the available ws-setup.exe sourceforge mirrors - show url selection to user?
    
    We may be able to do this automatically. dl.sf.net points to a set of round-robin addresses, and <ftp://dl.sourceforge.net/pub/sourceforge/w/wi/wireshark/> appears to work. -- [GeraldCombs](/GeraldCombs)
    
      - I don't know if FTP is available for all users - think of very crippled corporate web access where only http/https might be available (we maybe could accept this or ask the users mailing list if it's a big problem) -- [UlfLamping](/UlfLamping)

  - is there a md5 (or a different suitable algorithm alrady available in the WS or lib code?
    
    Libgcrypt comes with md5, sha1, rmd160, and a few others. There's an md5 module in epan. -- [GeraldCombs](/GeraldCombs)
    
      - Someone provide me some pointers how to apply md5 on a downloaded file in principle? MD5 should be ok so we don't need libgcrypt mandatory -- [UlfLamping](/UlfLamping)

  - do we need to specify alternative installer versions (e.g. buildbot versions)?

  - how to handle beta versions?
    
    We could make the SVN revison part of the query path -- [GeraldCombs](/GeraldCombs)
    
      - That would end in a pletora of possible update files - making the update file to be script generated mandatory in effect -- [UlfLamping](/UlfLamping)

  - what about special installations like U3/zip?
    
    This could then be handled by the URL, see the URL examples above -- [UlfLamping](/UlfLamping)

  - Can the file installation be handled by NSIS?
    
    I guess so, see the update process outlined above -- [UlfLamping](/UlfLamping)

  - Should we check for (and optionally disable) insecure dissectors?
    
    This would be possible, but I would guess it's better to dicuss this as a next step -- [UlfLamping](/UlfLamping)

  - As it seems to become necessary to build the update files by a server side script, is it mandatory to include parts to the update file which are already "up-to-date"? Or is it better to leave them out of the file? I guess it's better that the update file should only contain things that really needs an update. -- [UlfLamping](/UlfLamping)

---

Imported from https://wiki.wireshark.org/Development/Update on 2020-08-11 23:13:24 UTC
