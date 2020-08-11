# How To Decode G.729

Wireshark 2.6.0 and later is able to play audio encoded with G.729 codec, see [VoIP\_calls](/VoIP_calls), chapter Playing VoIP calls. Version 3.2.0 and later is able to save audio encoded with G.729 codec as .au.

For older releases legacy procedure must be used.

## Procedure to decode G.729 on versions before 2.6.0

G.729 is another commonly used codec used in Voice over IP. This procedure will allow you to decode this type of stream. In order to run the procedure, you will first need to obtain the Open G.729 decoder, available for free from <https://codecpro.com/en/codecs/page/downloads>

Note that this procedure works either under Windows or under Linux with Wine.

1.  In Wireshark, use menu "Telephony -\> RTP -\> Show All Streams". Select the desired stream and press "Analyze".

2.  In the next dialog screen, press "Save Payload..." or "Save" (depends on version of Wireshark). Save options are Format = .raw and Channel = forward. Name file sample.raw.

3.  Convert the .raw file to .pcm format using the Open G.729 decoder. **Syntax:** cp\_g729\_decoder.exe sample.raw sample.pcm. Or for Linux: wine cp\_g729\_decoder.exe sample.raw sample.pcm.

4.  The .pcm file contains 16-bit linear PCM samples at 8000 Hz. Note that each sample is in Little-Endian format. To convert to .au format, all you need to do is prepend the 24 byte au header, and convert each PCM sample to network byte order (or Big-Endian). The following Perl Script will do the trick.

<!-- end list -->

    #
    # USAGE: perl pcm2au.pl inputFile outputFile
    
    
    $usage = "Usage: 'perl $0 <Source PCM File> <Destination AU File>' ";
    
    $srcFile = shift or die $usage;
    $dstFile = shift or die $usage;
    
    open(SRCFILE, "$srcFile") or die "Unable to open file: $!\n";
    binmode SRCFILE;
    
    open(DSTFILE, "> $dstFile") or die "Unable to open file: $!\n";
    binmode DSTFILE;
    
    ###################################
    # Write the AU header
    ###################################
    
    print DSTFILE  ".snd";
    
    $foo = pack("CCCC", 0,0,0,24);
    print DSTFILE  $foo;
    
    $foo = pack("CCCC", 0xff,0xff,0xff,0xff);
    print DSTFILE  $foo;
    
    $foo = pack("CCCC", 0,0,0,3);
    print DSTFILE  $foo;
    
    $foo = pack("CCCC", 0,0,0x1f,0x40);
    print DSTFILE  $foo;
    
    $foo = pack("CCCC", 0,0,0,1);
    print DSTFILE  $foo;
    
    #############################
    # swap the PCM samples
    #############################
    
    while (read(SRCFILE, $inWord, 2) == 2) {
    
        @bytes   = unpack('CC', $inWord);
        $outWord = pack('CC', $bytes[1], $bytes[0]);
        print DSTFILE  $outWord;
    }
    
    close(DSTFILE);
    close(SRCFILE);

As will this Python script:

    import sys
    import struct
    import os
    
    if len(sys.argv) != 2:
        print("Usage: 'python pcm2au.py <Source PCM File>'")
        sys.exit(1)
    srcFilename = sys.argv[1]
    dstFilename = '%s.au' % os.path.splitext(srcFilename)[0]
    with open(srcFilename, 'r+b') as srcFile, open(dstFilename, 'w+b') as dstFile:
        ###################################
        # Write the AU header
        ###################################
        dstFile.write(b'.snd')
        dstFile.write(struct.pack('BBBB', 0,0,0,24))
        dstFile.write(struct.pack('BBBB', 0xff,0xff,0xff,0xff))
        dstFile.write(struct.pack('BBBB', 0,0,0,3))
        dstFile.write(struct.pack('BBBB', 0,0,0x1f,0x40))
        dstFile.write(struct.pack('BBBB', 0,0,0,1))
    
        #############################
        # swap the PCM samples
        #############################
        while True:
            data = srcFile.read(2)
            if len(data) == 2:
                word = struct.unpack('<H', data)[0]
                dstFile.write(struct.pack('>H', word))
            else:
                break

-----

---

Imported from https://wiki.wireshark.org/HowToDecodeG729 on 2020-08-11 23:14:43 UTC
