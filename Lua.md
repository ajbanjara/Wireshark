# Lua

![Lua logo](uploads/__moin_import__/attachments/Lua/lua_logo.gif)

Lua is a powerful light-weight programming language designed for extending applications. Lua is designed and implemented by a [team](https://www.lua.org/authors.html) at [PUC-Rio](https://www.puc-rio.br/), the Pontifical Catholic University of Rio de Janeiro in Brazil. Lua was born and raised at [Tecgraf](https://www.tecgraf.puc-rio.br/), the Computer Graphics Technology Group of PUC-Rio, and is now housed at [Lua.org](https://www.lua.org/). Both Tecgraf and Lua.org are laboratories of the [Department of Computer Science](https://www.inf.puc-rio.br/).

Lua's been added to Wireshark as a language for prototyping and scripting.

For more information about Lua refer to [Lua's main site](https://www.lua.org), there you can find its [Reference Manual](https://www.lua.org/manual/5.0/manual.html) and a [book](https://www.lua.org/pil) that describes the language. There is also [The lua-users wiki](http://lua-users.org/wiki/). For the nickel tour see   - [Introducing Lua](https://web.archive.org/web/20120329183839/http://onlamp.com/pub/a/onlamp/2006/02/16/introducing-lua.html).

[[_TOC_]]

## Beware the GPL

Wireshark is released under [GPL](https://www.gnu.org/licenses/gpl.html) so every derivative work based on Wireshark must be released under the terms of the GPL.

:warning: Even if the code you write in Lua does not need to be GPL'ed. The code written in Lua that uses bindings to Wireshark must be distributed under the GPL terms. see the [GPL FAQ](https://www.gnu.org/licenses/gpl-faq.html#TOCIfInterpreterIsGPL) for more info :warning:

There is at least one Wireshark author that will not allow to distribute derivative work under different terms. To distribute Lua code that uses Wireshark's bindings under different terms would be a clear violation of the GPL.

If it isn't clear to you what the GPL is and how it works please consult your lawyer.

## Lua in Wireshark

Lua can be used to write [dissectors](/Lua/Dissectors), [post-dissectors](/Lua/Examples/PostDissector) and [taps](/Lua/Taps).

Although it's possible to write [dissectors](/Lua/Dissectors) in Lua, Wireshark dissectors are written in C, as C is several times faster than Lua. Lua is ok for prototyping dissectors, during Reverse Engineering you can use your time for finding out how things work instead of compiling and debugging your C dissector.

[Post-dissectors](/Lua/Examples/PostDissector) are dissectors meant to run after every other dissector has run. They can add items the dissection tree so they can be used to create your own extensions to the filtering mechanism.

[Taps](/Lua/Taps) are used to collect information after the packet has been dissected.

## Getting Started

Lua has shipped with the Windows version of Wireshark since 0.99.4. Availability on other platforms varies. To see if your version of Wireshark supports Lua, go to *Help→About Wireshark* and look for Lua in the "Compiled with" paragraph.

![lua-about.png](uploads/__moin_import__/attachments/Lua/lua-about.png "lua-about.png")

In some older versions Lua was available as a plugin.

To test Lua on your system, do the following:

1.  Make sure Lua is enabled in the global configuration as described below in **How Lua Fits Into Wireshark**

2.  Create a simple Lua script such as:
    
    ```lua
     -- hello.lua
     -- Lua's implementation of D. Ritchie's hello world program.
        print("hello world!")
    ```

3.  Name this script `hello.lua` and place it in the current directory.

4.  Run `tshark -X lua_script:hello.lua` from the command prompt. You should see something like:
    
    ``` 
     $ tshark -X lua_script:hello.lua
     hello world!
     Capturing on en0
     1   0.000000 111.123.234.55 -> 111.123.234.255 NBNS Name query NB XXX.COM<00>
    ```

If you can read "hello world\!" in the first line after you run `tshark`, Lua is ready to go\!

:warning: Please note: On Windows, you may not see any output when running Lua scripts in Wireshark. If the console window is enabled it will be opened **after** the Lua engine is loaded. This does not affect TShark, since it is a console program.

## How Lua fits into Wireshark

Every time Wireshark starts it will search for a script called `init.lua` located in the global configuration directory of Wireshark. If Wireshark finds this file it will run the script.

Once *\<global configuration directory\>*`/init.lua` has run that there are two variables that tell Wireshark whether to continue looking for scripts.

If the first init script sets the variable `disable_lua` to `true` Wireshark will stop reading scripts and shut down the Lua engine right after the script was run.

Once this first script was run Wireshark will search the global plugin directory directory for files ending in `.lua` and run them as scripts.

If Wireshark is running suexec (i.e. as **root** but launched by another user) it will check if the variable `run_user_scripts_when_superuser` is set to `true` before loading any further scripts. Otherwise, after that, it will run the `init.lua` script in your personal configuration directory, if it exists, and then search your personal plugin directory for files ending in `.lua` and run them as scripts, and then will run all scripts passed with the **-X lua\_script:***xxx.lua* command line option in the given order.

All these scripts will be run **before** packets are read, at the end of the dissector registration process. So, what you have to do is to register a series of functions that will be called while processing packets.

The location of the directories containing these scripts are different on different platforms. See [Appendix B, "Files and Folders"](https://www.wireshark.org/docs/wsug_html/#AppFiles) of the Wireshark User's Guide for the location of those directories.

## Wireshark's Lua API

Wireshark’s Lua API Reference Manual can be found [here](https://www.wireshark.org/docs/wsdg_html_chunked/wsluarm_modules.html). Changes to the API can be found [here](/Lua/ApiChanges).  
For a view of the Lua API internals and the steps used to create the `wsluarm`, see the slightly out of date, mostly correct [doc/README.wslua](https://gitlab.com/wireshark/wireshark/-/blob/master/doc/README.wslua).  
  
[220711_wslua_Index_DRAFT.pdf](uploads/04a18cffc1ba39292e97a99252d93416/220711_wslua_Index_DRAFT.pdf) - an Index for the wsluarm - **DRAFT**


## Examples

Examples of generic Lua code can be found in [The Sample Code](http://lua-users.org/wiki/SampleCode) page of Lua-Users wiki.

Examples of Wireshark and TShark specific scripts:  
- [Lua examples wiki page](/Lua/Examples)  
- [Contrib repository wiki page](/Contrib)  
- the Wireshark Developer’s Guide (WSDG) [Lua Support in Wireshark](https://www.wireshark.org/docs/wsdg_html_chunked/wsluarm.html)  
  
[EASYPOST.lua](uploads/6f35ec7531e1557df3f2964c81d80510/EASYPOST.lua) - a template to copy a field, modify the data and add as a new Protocol field.  

## External Links

  - [Introducing Lua](https://web.archive.org/web/20120329183839/http://onlamp.com/pub/a/onlamp/2006/02/16/introducing-lua.html) at (Internet Archive) O'Reilly (onlamp.com)  :school: :book:  Lua Primer

  - [ZeroBrane Studio](https://studio.zerobrane.com/) Lightweight IDE for your Lua needs

  - [WireBait](https://github.com/MarkoPaul0/WireBait) Lua library to facilitate the development of Wireshark dissectors by enabling users to run them against packet data without Wireshark. The packet data can come from hexadecimal string or a .pcap file. The goal here is to provide a tool reducing development time when creating a new dissector.

  - [wireshark-ntop](https://github.com/ntop/wireshark-ntop) 
This repository contains open source extensions for Wireshark. (several written in Lua)  
Includes `sflow_tap.lua`, a tap/listener and gui screens for sflow statistics covered in
[sFlow: Theory & practice of a sampling technology and its analysis with Wireshark](https://sharkfestus.wireshark.org/assets/presentations18/21.pdf) at [SharkFest'18](https://sharkfestus.wireshark.org/sf18). ([Presentation Video](https://youtu.be/SX_LBoGgZK4))

  - [wireshark-lua-plugin](https://gitlab.com/jvalverde/wireshark-lua-plugin) 
This is a plugin for Wireshark providing Lua 5.4 bindings to the libwireshark API. It allows writing Wireshark dissectors in Lua instead of C.  This is a new experimental alternative to the code using Lua 5.2 that comes with Wireshark 3.6. It is an external project to Wireshark and not officially supported by the Wireshark developer team.

---

Imported from https://wiki.wireshark.org/Lua on 2020-08-11 23:16:06 UTC
