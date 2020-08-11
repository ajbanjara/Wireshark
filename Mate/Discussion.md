[[_TOC_]]

# Upcoming Features

## Gog

### GogExtra's On=...;

Gog****Extra must have an On=...; avp to tell which gop type the avps are to be copied from

### GogIdleTimeout

A Gog should be released after a while if its Gops do not get any more pdus assigned to them.

### GogAbsoluteTimeout

A Gop should autorelease itself after a certain time has passed since it has been created.

### merge Gogs with common keys

Whenever a gog changes and some of its keys happen to match another gog(s) merge all the gogs into a single gog.

## Gop

### FullStop={TRUE|FALSE}

Attribute to Gop****Def, Gop****Stop, and Gop****Extra to indicate that the key should be removed once the Gop****Stop arrives, that way no more Gop****Key matching Pdus will be assigned to the Gop.

### Pre-Started Gops

:white\_check\_mark: Whenever a Pdu matches a Gop****Key of a Gop that has not being given an explicit Gop****Start, And the key exists already as a Gog****Key, that Pdu should become part of an auto-started Gop that automagically belongs to the Gog that has that Gog****Key.

TO DO: These Gops should have the lifetime of the Gog they belong to, not infinite.

## Transform

### Transform's Mode=Map;

A Mapped version of transforms should exist where a fixed set of matching keys maps using a hash a fixed set of AVPLs to either be Inserted or Replace the matching set. This will save a lot of time for very long sequences of transformations.

### Transformation AVP Operations

Create a set of operations for the insert/replace part of a Transform.

  - append `.operand>str;`

  - prepend `.operand<str;`

  - insert `.operand^pos^string;`

  - slice `.operand[-pos1,pos2-pos3,pos4,pos5-];`

  - replace `.operand~str1~str2;`

  - convert to number and operate `.operand(+5,*8,-attr_a);` -- (integer only and RPN)

  - "rename" AVP `.new$old;`

## Internal Features

### avp\_subscribe, avp\_unsubscribe

internal optimization to save space and accelerate avpl ops. It eases memory management as well.

  - use hash to hold avp2strs
      - avp\_hash and avp\_equal

### avpl to string to use a static buffer

  - a static buffers should speed up avpl key matching

### Memory management

There should be a limit in the amount of memory mate is allowed to use, once mate reaches the limit it should start to destroy the oldest items as newer items are created. This is essential to be able to use mate in long running tshark sniffs, but it could be a killer if using it interactivelly with wireshark.

# Known Bugs

## Those that are there to stay

### There cannot be two identical AVPs in the same AVPL

This is not really a BUG. It is a deliberate choice taken in the very beginning in order to avoid AVPL match operations becoming too complex. This might become obnoxious. But that's how it is. If it is a problem not having more than one copy, your configuration must workaround it.

Example Workaround: add `port=0;` when both ports are equal and only one `port;` is inserted into the AVPL.

    # transformations stop at the fisrt good match
    # do nothing (insert an empty avpl) if both ports are defined  
    Action=Transform; Name=Fix_same_port; Mode=Insert; Match=Strict; port; port;
    # insert a port=0; so that both ports are defined  
    Action=Transform; Name=Fix_same_port; Mode=Insert; Match=Every; port; .port=0;
    
    Action=PduTransform; For=xxx_pdu; Name=Fix_same_port;

## Those that have to go

### The Gog Mechanism does not get propperly reinitialized

It works OK at the first run it doesn't in the following ones.

Workarround: Restart wireshark.

:white\_check\_mark: Fix: fixed in svn rev 13318.

### Some AVPL operations make wireshark crash when the operand avpl is empty

In some ocasions an operation on an empty AVPL might cause wireshark to crash.

Workarround: Avoid empty AVPLs as operations the configuration. (Insert an empty AVPL works OK)

Fix: We need to be able to reproduce the condition (used config & capture file).

### Some incorrect/incomplete GoG configurations cause wireshark to crash

It works fine if the config is correct. But in some cases You'll get a crash report instead of an error message.

Workarround: None Known. You got to fix that config anyway, don't you?

:white\_check\_mark: Fix: fixed in svn rev 13318

### Gops with no GopStart might be or not be created

After reinitialization Gops with no [GopStart](/GopStart) might be or not be created, this happens in an apparently random fashion (some get created some don't, not always the same though)

Workarround: None Known.

Fix: none yet.

---

Imported from https://wiki.wireshark.org/Mate/Discussion on 2020-08-11 23:16:30 UTC
