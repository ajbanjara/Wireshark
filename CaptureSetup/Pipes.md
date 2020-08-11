# Pipes

The following will explain capturing using pipes a bit.

[[_TOC_]]

Before pipes, Wireshark could read the captured packets to display either from a file (which had been previously created) or for a network interface (in real time). Since pipes are supported, Wireshark can also read captured packets from another application in real time. This is useful if you want to watch a network in real time, and Wireshark cannot capture from that network, e.g. because it is not a network type supported by the version of libpcap/WinPcap on your machine, or because you want to capture traffic on an interface on another machine and your version of libpcap/WinPcap doesn't support remote capturing from that machine.

There are some limitations that you should be aware of:

1.  This only works with the de facto standard libpcap format version 2.4, as described in [Development/LibpcapFileFormat](/Development/LibpcapFileFormat), and with the standard [pcapng](https://github.com/pcapng/pcapng) format.

2.  Capturing from a pipe is inconvenient, because you have to set up the pipe and put a file header into the pipe before you can start the capture. A few patches have been mailed to the development list that could solve this, so if you find the approach inconvenient, try the patches.

3.  The named pipe is not listed in the drop-down interface selection, and must be typed into the interface box. On Windows, it must be typed slowly (or pasted).

Note that this does not permit capturing arbitrary protocols on a named pipe on your machine; it only supports using a named pipe as a mechanism for supplying packets, in the form of a pcap or pcapng packet stream, to Wireshark.

This is a live packet capture, rather than a saved capture file, so you can configure Wireshark to show packets as they arrive, or to just show packet counts as they arrive and dissect and display packets when the capture is done, just as you can do with a live capture from a network interface.

## Named pipes

A named pipe looks like a file, but it is really just a buffer for interprocess communication. One process can send data to it, and another process can read it. There are two main ways to create a named pipe: with mkfifo or using special syntax of the bash shell.

### Way 1: mkfifo on UN\*X

If you have a capture file in the right format (from Wireshark or tcpdump), you can do the following:

    $ mkfifo /tmp/sharkfin
    $ wireshark -k -i /tmp/sharkfin &
    $ cat capture.cap > /tmp/sharkfin &

This should start a capture from the named pipe /tmp/sharkfin. After you start the last command, a list of packets from the file should start appearing on the screen.

An example of remote capture using pipes can be found in [Jesús Roncero's blog](http://blog.notreally.org/2007/01/24/how-to-monitor-packets-from-a-remote-interface).

### Way 2: Bash or Korn shell on UN\*X

You can do exactly the same with special bash/Korn shell syntax:

    $ wireshark -k -i <(cat capture.cap)

### Way 3: Python on Windows

The following small Python script shows how to use Python on Windows:

    # Win32 Wireshark named pipes example
    # Requires Python for Windows and the Python for Windows Extensions:
    # http://www.python.org
    # http://sourceforge.net/projects/pywin32/
    
    import win32pipe, win32file
    import time
    import subprocess
    
    #open Wireshark, configure pipe interface and start capture (not mandatory, you can also do this manually)
    wireshark_cmd=['C:\Program Files\Wireshark\Wireshark.exe', r'-i\\.\pipe\wireshark','-k']
    proc=subprocess.Popen(wireshark_cmd)
    
    #create the named pipe \\.\pipe\wireshark
    pipe = win32pipe.CreateNamedPipe(
        r'\\.\pipe\wireshark',
        win32pipe.PIPE_ACCESS_OUTBOUND,
        win32pipe.PIPE_TYPE_MESSAGE | win32pipe.PIPE_WAIT,
        1, 65536, 65536,
        300,
        None)
    
    #connect to pipe
    win32pipe.ConnectNamedPipe(pipe, None)
    
    #open and read an arbitrary pcap file (file must in same folder than script)
    cf = open(r'pipetest.pcap', 'rb')
    data = cf.read()
    
    #wait 2 second (not mandatory, but this let watching data coming trough the pipe)
    time.sleep(2)
    
    #send pcap data trough the pipe
    win32file.WriteFile(pipe, data)
    
    #then pcap data appears into wireshark

Related useful link:

  - <https://github.com/RIOT-OS/RIOT/blob/master/dist/tools/sniffer/README.md>

  - <https://github.com/Pinoccio/tool-serial-pcap>

### Way 4: C on Windows

Note: This example doesn't show the encoding of the pcap format header or packet data. There is a complete example of using a named pipe in C along with the pcap header and packet data encoding in the [BACnet MS/TP capture utility on SourceForge.net](https://bacnet.svn.sourceforge.net/svnroot/bacnet/trunk/bacnet-stack/demo/mstpcap/main.c).

[alos this may be usefull](https://github.com/RIOT-OS/RIOT/blob/master/dist/tools/sniffer/README.md)

    #include <stdio.h>
    #include <windows.h>
    static HANDLE hPipe = NULL; /* pipe handle */
    
    static void print_last_error(void)
    {
        LPVOID lpMsgBuf;
    
        FormatMessage(FORMAT_MESSAGE_ALLOCATE_BUFFER | FORMAT_MESSAGE_FROM_SYSTEM,
            NULL, GetLastError(), MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT),
            (LPTSTR) & lpMsgBuf, 0, NULL);
        MessageBox(NULL, lpMsgBuf, "GetLastError", MB_OK | MB_ICONINFORMATION);
        LocalFree(lpMsgBuf);
    }
    
    static void named_pipe_create(void)
    {
    
        hPipe = CreateNamedPipe(
            "\\\\.\\pipe\\wireshark",
            PIPE_ACCESS_OUTBOUND,
            PIPE_TYPE_MESSAGE | PIPE_WAIT,
            1, 65536, 65536,
            300,
            NULL);
        if (hPipe == INVALID_HANDLE_VALUE) {
            print_last_error();
            return;
        }
        ConnectNamedPipe(hPipe, NULL);
    }
    
    DWORD data_write(const void *ptr, size_t size, size_t nitems)
    {
        DWORD cbWritten = 0;
    
        if (hPipe) {
            (void)WriteFile(hPipe, ptr, size*nitems, &cbWritten, NULL);
        }
    
        return cbWritten;
    }
    
    void cleanup(void)
    {
        if (hPipe) {
            FlushFileBuffers(hPipe);
            DisconnectNamedPipe(hPipe);
            CloseHandle(hPipe);
        }
    }
    
    int main(
        int argc,
        char *argv[])
    {
        FILE *pFile = NULL;
        char *pFilename = {"c:\\pipetest.pcap"};
        char buffer[512] = {""};
        size_t num_read = 0;
    
        if (argc > 1) {
            pFilename = argv[1];
        }
        pFile = fopen(pFilename, "rb");
        if (pFile) {
            named_pipe_create();
            while ((num_read = fread(buffer,1,sizeof(buffer),pFile)) == sizeof(buffer)) {
                data_write(buffer, 1, num_read);
            }
            /* write remaining stuff */
            if (num_read) {
                data_write(buffer, 1, num_read);
            }
            fclose(pFile);
        }
        cleanup();
        return 0;
    }

### Way 5: C\#, or others on .NET

On .NET, the [NamedPipeServerStream](/NamedPipeServerStream) class is quite easy to use for Named Pipe exploitations. It is also not so hard to convert a struct to a Byte Array in order to generate the two pcap headers.

As [NamedPipeServerStream](/NamedPipeServerStream) connexion is blocking, a background thread can be used in order to wait Wireshark connexion.

Have a look to the attached file : [WiresharkSender.cs](uploads/__moin_import__/attachments/CaptureSetup/Pipes/WiresharkSender.cs)

### Named pipes conclusion

In all of the above cases you cannot use the buttons in Wireshark to (re)start the capture, because the feeding process has no way of knowing that a new capture should be started. Also the feeding process may not be killed after Wireshark terminates. I think it is killed if you stop the capture before closing Wireshark, but I am not quite sure why.

There was a short discussion that the feeding process could detect that the pipe is not connected, and then restart the capture once it is connected again. So maybe this is possible, if you write the feeding process accordingly. This can be done on Linux by using the poll or epoll system calls, which emit a POLLIN/EPOLLIN event when Wireshark closes the FIFO happens. As an example, see [this capture tool](https://github.com/Pinoccio/tool-serial-pcap).

There are also two patches that support reading from a TCP network connect (which has a define connection sequence), and from spawned child processes. Both patches should solve this specific problem.

Of course these examples are not really useful, because you could just read the file directly. In a real scenario, the feeding process could be either a remote capture process, a serial port packetizer, or a special application. Note that the named pipe interface is expecting a single PCAP header, then a series of PCAP packets.

## Remote Capture

In bash syntax, remote capture is possible with the following command:

    > wireshark -k -i <(ssh -l root remote-host "dumpcap -P -w - -f 'not tcp port 22'")

The main problem is that you have to exclude the traffic generated by the ssh session from capturing. Several patches are available to do this, but excluding port 22 is probably the easiest solution for now.

The second problem is that ssh cannot ask for a password on stdin. You should either set up ssh-agent, so that you don't need a password, or you should configure x-askpass to open a window for the password.

This can be worked around by combining SSH with a FIFO.

    $ mkfifo /tmp/sharkfin
    $ wireshark -k -i /tmp/sharkfin &
    $ ssh user@remote-host "dumpcap -P -w - -f 'not tcp port 22'" > /tmp/sharkfin

As soon as Wireshark starts "listening" on the pipe, SSH will prompt for the password and allow you to continue. Wireshark can also be switched out for tshark and tcpdump can be used in place of dumpcap with slight variations on the above commands.

## Special feeding application

Sometimes you want to display traffic from a network that is not accessible to the usual capture tools like tshark, tcpdump and snoop. You may have your own application to capture the traffic, and Wireshark can read the capture files, but how do you interface it with Wireshark to show traces in real time?

Pipes are the answer. As long as you use the de facto standard libpcap format, you should be able to write the capture to a named pipe, and view the packets in real time with Wireshark reading from this pipe.

## Stdin

As described in the man page, you can use the minus sign for the interface name to capture from stdin. Stdin is a file descriptor that is predefined for every process, and it is usually connected to an anonymous pipe by the shell calling the process. So reading from stdin, you should be able to rewrite the command above to

    $ cat capture.cap | wireshark -k -i -

The cat utility returns when it reaches the end of the file; To have the equivalent of a live capture from a file that grows in time, use tail instead, give the follow argument and let it start from the beginning:

    $ tail -f -c +0 capture.cap | wireshark -k -i -

While the documentation says that Wireshark should be able to capture from stdin (which is an anonymous pipe), it is not clear whether it always works. Some people have reported success, but for me it only works with tshark, not with wireshark. Maybe this is related to the following bug?

Please note: this feature won't work with all versions of libiconv, as it will interpret the - sign as the start of a new parameter, see: [bug \#265](http://bugs.wireshark.org/bugzilla/show_bug.cgi?id=265)

XXX - is this possible for both command line and interactive usage?

## TCP socket

Wireshark can also connect to one or more libpcap or pcapng formatted streams served through TCP ports using the *-i TCP@\<addr\>\[:port\]* option. TCP is case sensitive.

    $ wireshark -k -i TCP@127.0.0.1:19000
    $ wireshark -k -i TCP@192.168.1.123

where port 19000 is the default if omitted. As of wireshark v3.1.1, IPv6 addresses are also supported when using the square brackets around the colon (:) delimited address followed by the optional *:port*.

    $ wireshark -k -i TCP@[::1]:19000
    $ wireshark -k -i TCP@[2001:db8:a0b:12f0::1]

    $ wireshark -k -i TCP@[::1]:19000 -i TCP@127.0.0.1:19001

A TCP stream is treated as like data from other pipes and the same restrictions apply. On each new connection the TCP server must send the header blocks as specified by libpcap or pcapng before any packet captures. TCP@ *pipes* may also be added in the GUI's Menu Capture/Options..., Manage Interfaces..., Pipes Tab, but pipe settings are not saved by Wireshark.

-----

---

Imported from https://wiki.wireshark.org/CaptureSetup/Pipes on 2020-08-11 23:12:00 UTC
