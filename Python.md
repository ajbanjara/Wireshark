# Extending Wireshark with Python

**Note: Python support was removed from wireshark as of June 2014 (commit 1777f6082462). An alternative might be <https://github.com/ashdnazg/pyreshark>.**

[Is it still possible to make a dissector plugin for Wireshark in python ?](https://ask.wireshark.org/question/18108/is-it-still-possible-to-make-a-dissector-plugin-for-wireshark-in-python/)  

----------------------------

The projects aim is to give the possibility to developers to easily extend Wireshark with Python.

It is a project in development and therefore is experimental. It is better to not use this in production for now. It is good though for prototyping as the syntax is rather concise.

It is better to have read [doc/README.developer](http://anonsvn.wireshark.org/wireshark/trunk/doc/README.developer) and [doc/README.python](http://anonsvn.wireshark.org/wireshark/trunk/doc/README.python) before attempting to play with the Python API.

## Requirements

You must have a valid Python environment (python \>= 2.3) and [ctypes](http://python.net/crew/theller/ctypes/).

ctypes is part of the Python package from the version 2.5. If you have an older version, you have to install it yourself.

## Compile with Python support

./configure --with-python

For a common installation all Pythonic stuff will be installed in **${libdir}/wireshark/python/${VERSION}/**

All dissectors can be added to **${libdir}/wireshark/python/${VERSION}/wspy\_dissectors/**. You do not need to register your protocol in a Makefile whatsoever. Just add a **\<dissectorname\>.py** in this directory and it will be detected at Wireshark/Tshark launch.

## Writing your first dissector in Python

This Python binding has been written with the idea in mind to ease the development of dissectors (write less) without losing the power offered by libwireshark. The consequence is that you have to follow some conventions.

### A valid skeleton dissector

``` 
 from wspy_dissector import Dissector

 class homeplug(Dissector):
  def protocol_ids(self):
    return [ ("ethertype", 0x887B, None) ]

  def dissect(self):
    print 'yahoo!'

 def register_protocol():
  return homeplug("HomePlug protocol", "HomePlug", "homeplug")
```

This dissector will print at the console 'yahoo\!' when dissecting a packet of the homeplug protocol.

Note: The homeplug dissector already exists in wireshark-1.4.2, so whilst this example is valid, you should choose another name if you actually want to try it out.

A valid dissector is composed of 2 main items. Let's see how this works:

1.  Defining a dissector : class *homeplug* is defined inheriting from *Dissector* which contains all the magic simplifying stuff for you.
    
      - *protocol\_ids* method must return a list of three values, all parameters used in dissector\_add
        
          - *None* can be defined in the third parameter and it will create a new handle for this dissector (create\_dissector\_handle()).
        
          - you could use self.find\_dissector or self.create\_dissector\_handle() as well.
    
      - *dissect* method which is the method called when a packet is to be dissected by this dissector.

2.  the function *register\_protocol* : This function MUST be present to be able to register your dissector. This function is called at the time Wireshark is registering all protocols. It basically has to return a handle to the instanciated dissector.

### Dissecting Something

``` 
 from wspy_dissector import Dissector
 from wspy_dissector import FT_UINT8, FT_NONE
 from wspy_dissector import BASE_NONE

 class homeplug(Dissector):
  def protocol_ids(self):
    return [ ("ethertype", 0x887B, None) ]

  def dissect(self):
    self.dissect_mctrl()

  def dissect_mctrl(self):
    hf = self.fields()
    subt = self.subtrees()
    self.c_tree = self.tree()

    tree = self.c_tree.add_item(hf.homeplug_mctrl, length=1, adv=False)
    mctrl_tree = tree.add_subtree(subt.mctrl)

    mctrl_tree.add_item(hf.homeplug_mctrl_rsvd, length=1, adv=False)
    mctrl_tree.add_item(hf.homeplug_mctrl_ne, length=1)


 def register_protocol():
  tp = homeplug("HomePlug protocol", "HomePlug", "homeplug")

  hf = tp.fields()

  hf.add("Mac Control Field", "homeplug.mctrl", FT_NONE, BASE_NONE)
  hf.add("Reserved", "homeplug.mctrl.rsvd", FT_UINT8, bitmask=0x80)
  hf.add("Number of MAC Data Entries", "homeplug.mctrl.ne", FT_UINT8, bitmask=0x7F)

  subt = tp.subtrees()
  subt.add('mctrl')

  return tp
```

## Advanced Stuff

### Adding the Base Subtree

This phase has been automated but you could want to personalize this. Here is how to do that.

``` 
 from wspy_dissector import Dissector

 class homeplug(Dissector):
  def protocol_ids(self):
    return "ethertype", 0x887B

  def dissect(self):
    subt = self.subtrees()
    main_tree = self.tree()

    p_tree = main_tree.add_item(self.protocol())
    homeplug_tree = p_tree.add_subtree(subt.homeplug)

 def register_protocol():
   tp = homeplug("HomePlug protocol", "HomePlug", "homeplug")

   subt = tp.subtrees()
   subt.add('homeplug')

   return tp
```

Steps to define the base tree in which the dissection tree will be displayed:

1.  registering the protocol subtree in the homeplug dissector with Subtree.add(\<treename\>). This step is made in register\_protocol before returning a handle of the homeplug dissector.

2.  display the subtree in method *dissect* :

3.  *subt = self.subtrees()* returns a Subtree object. You can refer to any subtree you want based on this object.

4.  For example, when you want to create the subtree 'homeplug' with *p\_tree.add\_subtree* method you'll have to pass the reference of this subtree. You can do that with *subt.homeplug*. Every subtree defined when registering can be accessed later as an **attribute** of the Subtree object.

NOTE: defining a subtree with the same name as the third parameter used for the creation of the dissector (in this case "homeplug"), makes you responsible for adding the main subtree of this dissector. Else, if this subtree isn't defined, this main subtree will be added for you automatically.

### Using libwireshark directly

The idea is to let user have a direct access to some libwireshark functions without having been wrapped by this binding.

... work in progress ...

#### Limitations (TODO)

  - dissect\_tcp\_pdus
  - RVALS, VALS, ...
  - conversation
  - tap
  - having a dissect function differentiated for tcp and udp
  - and probably many more ...

---

Imported from https://wiki.wireshark.org/Python on 2020-08-11 23:23:44 UTC
