MATE Reference Manual

[[_TOC_]]

## Attribute Value Pairs

MATE uses AVPs for almost everything: to keep the data it has extracted from the frames' trees as well as to keep the elements of the configuration.

These "pairs" (actually tuples) are made of a name, a value and, in case of configuration AVPs, an operator. Names and values are strings. AVPs with operators other than '=' are used only in the configuration and are used for matching AVPs of Pdus, [GoPs](/GoPs) and [GoGs](/GoGs) in the analysis phase.

### Name

The name is a string used to refer to a *class* of AVPs. Two attributes won't match unless their names are identical. Capitalized names are *reserved* for keywords (you can use them for your elements if you want but I think it's not the case). MATE attribute names can be used in Wireshark's display filters the same way like names of protocol fields provided by dissectors, but they are *not* just references to (or aliases of) protocol fields.

### Value

The value is a string. It is either set in the configuration (for configuration AVPs) or by MATE while extracting interesting fields from a dissection tree and/or manipulating them later. The values extracted from fields use the same representation as they do in filter strings.

### Operators

Currently only match operators are defined (there are plans to (re)add transform attributes but some internal issues have to be solved before that). The match operations are always performed between two operands: the value of an AVP stated in the configuration and the value of an AVP (or several AVPs with the same name) extracted from packet data (called "data AVPs"). It is *not* possible to match data AVPs to each other.

The defined match operators are:

  - [Equal](/Mate/Reference#Equal) **=** test for equality, that is: either the value strings are identical or the match will fail.

  - [Not Equal](/Mate/Reference#NotEqual) **\!** will match only if the value strings aren't equal.

  - [One Of](/Mate/Reference#OneOf) **{}** will match if one of the value strings listed is equal to the data AVP's string. Individual tems of the list inside the curly braces are separated using **|** character.

  - [Starts With](/Mate/Reference#StartsWith) **^** will match if the configuration value string matches the first characters of the data AVP's value string

  - [Ends WIth](/Mate/Reference#EndsWith) **$** will match if the configuration value string matches the last characters of the data AVP's value string

  - [Contains](/Mate/Reference#Contains) **\~** will match if the configuration value string matches a substring of the characters of the data AVP's value string

  - [Lower Than](/Mate/Reference#Lower) **\<** will match if the data AVP's value string is semantically lower than the configuration value string

  - [Higher Than](/Mate/Reference#Higher) **\>** will match if the data AVP's value string is semantically higher than the configuration value string

  - [Exists](/Mate/Reference#Exists) **?** (can be omitted) will match if the AVP name matches, regardless what the value string is

#### Equal AVP Operator

This operator tests whether the values of the operator and the operand AVP are equal.

##### Example

  - attrib=aaa **matches** attrib=aaa

  - attrib=aaa **does not match** attrib=bbb

#### Not equal AVP operator

This operator matches if the value strings of two AVPs are not equal.

##### Examples

  - attrib=aaa **matches** attrib\!bbb

  - attrib=aaa **does not match** attrib\!aaa

#### "One of" AVP operator

The "one of" operator matches if the data AVP value is equal to one of the values listed in the "one of" AVP.

##### Examples

  - attrib=1 **matches** attrib{1|2|3}

  - attrib=2 **matches** attrib{1|2|3}

  - attrib=4 **does not match** attrib{1|2|3}

#### "Starts with" AVP operator

The "starts with" operator matches if the first characters of the data AVP value are identical to the configuration AVP value.

##### Examples

  - attrib=abcd **matches** attrib^abc

  - attrib=abc **matches** attrib^abc

  - attrib=ab **does not match** attrib^abc

  - attrib=abcd **does not match** attrib^bcd

  - attrib=abc **does not match** attrib^abcd

#### "Ends with" operator

The ends with operator will match if the last bytes of the data AVP value are equal to the configuration AVP value.

##### Examples

  - attrib=wxyz **matches** attrib$xyz

  - attrib=yz **does not match** attrib$xyz

  - attrib=abc...wxyz **does not match** attrib$abc

#### Contains operator

The "contains" operator will match if the data AVP value contains a string identical to the configuration AVP value.

##### Example

  - attrib=abcde **matches** attrib\~bcd

  - attrib=abcde **matches** attrib\~abc

  - attrib=abcde **matches** attrib\~cde

  - attrib=abcde **does not match** attrib\~xyz

#### "Lower than" operator

The "lower than" operator will match if the data AVP value is semantically lower than the configuration AVP value.

##### Examples

  - attrib=abc **matches** attrib\<bcd

  - attrib=1 **matches** attrib\<2

  - *but beware:* attrib=10 **does not match** attrib\<9

  - attrib=bcd **does not match** attrib\<abc

  - attrib=bcd **does not match** attrib\<bcd

##### BUGS

It should check whether the values are numbers and compare them numerically

#### "Higher than" operator

The "higher than" operator will match if the data AVP value is semantically higher than the configuration AVP value.

##### Examples

  - attrib=bcd **matches** attrib\>abc

  - attrib=3 **matches** attrib\>2

  - *but beware:* attrib=9 **does not match** attrib\>10

  - attrib=abc **does not match** attrib\>bcd

  - attrib=abc **does not match** attrib\>abc

##### BUGS

It should check whether the values are numbers and compare them numerically

#### Exists operator

The exists operator will always match as far as the two operands have the same name.

##### Examples

  - attrib=abc **matches** attrib?

  - attrib=abc **matches** attrib *(this is just an alternative notation of the previous example)*

  - *obviously* attrib=abc **does not match** other\_attrib?

## Attribute/Value Pair List (AVPL)

Pdus, [GoPs](/GoPs) and [GoGs](/GoGs) use an AVPL to contain the tracing information. An AVPL is an unsorted set of [AVPs](/Mate/Reference#AVP) that can be matched against other AVPLs.

### Operations between AVPLs

  - There are three types of match operations that can be performed between AVPLs. The Pdu's/GoP's/GoG's AVPL will be always one of the operands; the AVPL operator (match type) and the second operand AVPL will always come from the [configuration](/Mate/Reference#Config).

  - Note that a diverse AVP match operator may be specified for each AVP in the configuration AVPL.

  - An AVPL match operation returns a result AVPL. In [Transform](/Mate/Reference#Transforms)s, the result AVPL may be replaced by another AVPL. The replacement means that the existing data AVPs are dropped and the replacement AVPL from the [configuration](/Mate/Reference#Config) is [Merged](/Mate/Reference#Merge) to the data AVPL of the Pdu/GoP/GoG.

  - [Loose Match](/Mate/Reference#Loose): Will match if at least one of the AVPs of the two operand AVPLs match. If it matches, it returns a result AVPL containing all AVPs from the data AVPL that did match the configuration's AVPs.

  - ["Every" Match](/Mate/Reference#Every): Will match if none of the AVPs of the configuration AVPL fails to match an AVP in the data AVPL, even if not all of the configuration AVPs have a match. If it matches, it returns a result AVPL containing all AVPs from the data AVPL that did match an AVP in the configuration AVPL.

  - [Strict Match](/Mate/Reference#Strict): Will match if and only if each of the AVPs in the configuration AVPL has at least one match in the data AVPL. If it matches, it returns a result AVPL containing those AVPs from the data AVPL that matched.

#### Loose Match

  - A loose match between AVPLs succeeds if at least one of the data AVPs matches at least one of the configuration AVPs. Its result AVPL contains all the data AVPs that matched.
    
    Loose matches are used in Extra operations against the [Pdu's](/Mate/Reference#Pdu) AVPL to merge the result into [Gop's](/Mate/Reference#GoPExtra) AVPL, and against [Gop's](/Mate/Reference#GoPExtra) AVPL to merge the result into [Gog's](/Mate/Reference#GogExtra) AVPL. They may also be used in [Criteria](/Mate/Reference#Criteria_clause) and [Transforms](/Mate/Reference#Transform).

  - :warning: As of current (2.0.1), Loose Match does not work as described here, see [Bug 12184](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=12184). Only use in Transforms and Criteria is effectively affected by the bug.

##### Loose Match Examples

  - (attr\_a=aaa, attr\_b=bbb, attr\_c=xxx) **Match Loose** (attr\_a?, attr\_c?) **==\>** (attr\_a=aaa, attr\_c=xxx)

  - (attr\_a=aaa, attr\_b=bbb, attr\_c=xxx) **Match Loose** (attr\_a?, attr\_c=ccc) **==\>** (attr\_a=aaa)

  - (attr\_a=aaa, attr\_b=bbb, attr\_c=xxx) **Match Loose** (attr\_a=xxx; attr\_c=ccc) **==\> No Match\!**

  - 
#### Every Match

  - An "every" match between AVPLs succeeds if none of the configuration's AVPs that have a counterpart in the data AVPL fails to match. Its result AVPL contains all the data AVPs that matched.
    
    These may only be used in [Criteria](/Mate/Reference#Criteria_clause) and [Transforms](/Mate/Reference#Transform).

  - :warning: As of current (2.0.1), Every Match does not work as described here, see [Bug 12184](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=12184)

##### "Every" Match Examples

  - (attr\_a=aaa, attr\_b=bbb, attr\_c=xxx) **Match Every** (attr\_a?, attr\_c?) **==\>** (attr\_a=aaa, attr\_c=xxx)

  - (attr\_a=aaa, attr\_b=bbb, attr\_c=xxx) **Match Every** (attr\_a?, attr\_c?, attr\_d=ddd) **==\>** (attr\_a=aaa, attr\_c=xxx)

  - (attr\_a=aaa, attr\_b=bbb, attr\_c=xxx) **Match Every** (attr\_a?, attr\_c=ccc) **==\> No Match\!**

  - (attr\_a=aaa; attr\_b=bbb; attr\_c=xxx) **Match Every** (attr\_a=xxx, attr\_c=ccc) **==\> No Match\!**

#### Strict Match

  - A Strict match between AVPLs succeeds if and only if every AVP in the configuration AVPL has at least one counterpart in the data AVPL and none of the AVP matches fails. The result AVPL contains all the data AVPs that matched.

  - 
  - These are used between Gop keys (key AVPLs) and Pdu AVPLs. They may also be used in [Criteria](/Mate/Reference#Criteria_clause) and [Transforms](/Mate/Reference#Transform).

##### Examples

  - (attr\_a=aaa, attr\_b=bbb, attr\_c=xxx) **Match Strict** (attr\_a?, attr\_c=xxx) **==\>** (attr\_a=aaa, attr\_c=xxx)

  - (attr\_a=aaa, attr\_b=bbb, attr\_c=xxx, attr\_c=yyy) **Match Strict** (attr\_a?, attr\_c?) **==\>** (attr\_a=aaa, attr\_c=xxx, attr\_c=yyy)

  - (attr\_a=aaa, attr\_b=bbb, attr\_c=xxx) **Match Strict** (attr\_a?, attr\_c=ccc) **==\> No Match\!**

  - (attr\_a=aaa, attr\_b=bbb, attr\_c=xxx) **Match Strict** (attr\_a?, attr\_c?, attr\_d?) **==\> No Match\!**

#### AVPL Merge

  - An AVPL may be merged into another one. That would add to the latter every AVP from the former that does not already exist there.
  - This operation is done
      - between the result of a key match and the Gop's or Gog's AVPL,
    
      - between the result of an Extra match and the Gop's or Gog's AVPL,
    
      - between the result of a [Transform](/Mate/Reference#Transform) match and Pdu's/Gop's AVPL. If the operation specified by the Match clause is Replace, the result AVPL of the match is removed from the item's AVPL before the modify\_avpl is merged into it.

##### Examples

  - (attr\_a=aaa, attr\_b=bbb) **Merge** (attr\_a=aaa, attr\_c=xxx) **former becomes** (attr\_a=aaa, attr\_b=bbb, attr\_c=xxx)

  - (attr\_a=aaa, attr\_b=bbb) **Merge** (attr\_a=aaa, attr\_a=xxx) **former becomes** (attr\_a=aaa, attr\_a=xxx, attr\_b=bbb)

  - (attr\_a=aaa, attr\_b=bbb) **Merge** (attr\_c=xxx, attr\_d=ddd) **former becomes** (attr\_a=aaa, attr\_b=bbb, attr\_c=xxx, attr\_d=ddd)

#### Transforms

A Transform is a sequence of Match rules optionally followed by an instruction how to modify the match result using an additional AVPL. Such modification may be an Insert (merge) or a Replace. The syntax is as follows:

``` 
    Transform name {
      Match [Strict|Every|Loose] match_avpl [[Insert|Replace] modify_avpl] ; // may occur multiple times, at least once
    };
```

  - For examples of Transforms, check the [Manual](/Mate/Manual) page.

  - 
  - TODO: migrate the examples here?

  - 
  - The list of Match rules inside a Transform is processed top to bottom; the processing ends as soon as either a Match rule succeeds or all have been tried in vain.

  - Transforms can be used as helpers to manipulate an item's AVPL before the item is processed further. An item declaration may contain a Transform clause indicating a list of previously declared Transforms. Regardless whether the individual transforms succeed or fail, the list is always executed completely and in the order given, i.e. left to right.

  - In MATE configuration file, a Transform must be declared before declaring any item which uses it.

## Configuration AVPLs

### Pdu's configuration actions

The following configuration AVPLs deal with PDU creation and data extraction.

#### Pdu declaration block header

  - In each frame of the capture, MATE will look for source `proto_name`'s PDUs in the order in which the declarations appear in its configuration and will create Pdus of every type it can from that frame, unless specifically instructed that some Pdu type is the last one to be looked for in the frame. If told so for a given type, MATE will extract all Pdus of that type and the previously declared types it finds in the frame but not those declared later.

  - The complete declaration of a Pdu looks as below; the mandatory order of the diverse clauses is as shown.

<!-- end list -->

``` 
    Pdu name Proto proto_name Transport proto1[/proto2/proto3[/...]]] {
      Payload proto; //optional, no default value
      Extract attribute From proto.field ; //may occur multiple times, at least once
      Transform (transform1[, transform2[, ...]]); //optional
      Criteria [{Accept|Reject}] [{Strict|Every|Loose} match_avpl];
      DropUnassigned {true|false}; //optional, default=false
      DiscardPduData {true|false}; //optional, default=false
      LastExtracted {true|false}; //optional, default=false
    };
```

#### Pdu name

  - The `name` is a mandatory attribute of a Pdu declaration. It is chosen arbitrarily, except that each `name` may only be used once in MATE's configuration, regardless the class of an item it is used for. The `name` is used to distinguish between different types of Pdus, Gops, and Gogs. The `name` is also used as part of the filterable fields' names related to this type of Pdu which MATE creates.

  - However, several Pdu declarations may share the same `name`. In such case, all of them are created from each source PDU matching their `Proto`, `Transport`, and `Payload` clauses, while the bodies of their declarations may be totally different from each other. Together with the `Accept` (or `Reject`) clauses, this feature is useful when it is necessary to build the Pdu's AVPL from different sets of source fields depending on contents (or mere presence) of other source fields.

#### Proto and Transport clauses

  - Every instance of the protocol `proto_name` PDU in a frame will generate one Pdu with the AVPs extracted from fields that are in the `proto_name`'s range and/or the ranges of underlying protocols specified by the `Transport` list. It is a mandatory attribute of a Pdu declaration. The `proto_name ` is the name of the protocol as used in Wireshark display filter.

  - The Pdu's `Proto`, and its `Transport` list of protocols separated by `/` tell MATE which fields of a frame can get into the Pdu's AVPL. In order that MATE would extract an attribute from a frame's protocol tree, the area representing the field in the hex display of the frame must be within the area of either the `Proto` or its relative `Transport`s. `Transport`s are chosen moving backwards from the protocol area, in the order they are given.

  - `Proto http Transport tcp/ip` does what you'd expect it to - it selects the nearest tcp range that precedes the current http range, and the nearest ip range that precedes that tcp range. If there is another ip range before the nearest one (e.g. in case of IP tunneling), that one is not going to be selected. `Transport tcp/ip/ip` that "logically" should select the encapsulating IP header too doesn't work so far.

  - Once we've selected the `Proto` and `Transport` ranges, MATE will fetch those protocol fields belonging to them whose extraction is declared using the `Extract` clauses for the Pdu type. The `Transport` list is also mandatory, if you actually don't want to use any transport protocol, use `Transport mate`. (This didn't work until 0.10.9).

#### Payload clause

Other than the Pdu's `Proto` and its `Transport` protocols, there is also a `Payload` attribute to tell MATE from which ranges of `Proto`'s payload to extract fields of a frame into the Pdu. In order to extract an attribute from a frame's tree the highlighted area of the field in the hex display must be within the area of the `Proto`'s relative payload(s). `Payload`s are choosen moving forward from the protocol area, in the order they are given. `Proto http Transport tcp/ip Payload mmse` will select the first mmse range after the current http range. Once we've selected the Payload ranges, MATE will fetch those protocol fields belonging to them whose extraction is declared using the `Extract` clauses for the Pdu type.

#### Extract clause

Each `Extract` clause tells MATE which protocol field value to extract as an AVP value and what string to use as the AVP name. The protocol fields are referred to using the names used in Wireshark display filters. If there is more than one such protocol field in the frame, each instance that fulfills the criteria stated above is extracted into its own AVP. The AVP names may be chosen arbitrarily, but to be able to match values originally coming from different Pdus (e.g., hostname from DNS query and a hostname from HTTP GET request) later in the analysis, identical AVP names must be assigned to them and the dissectors must provide the field values in identical format (which is not always the case).

#### Transform clause

The `Transform` clause specifies a list of previously declared `Transform`s to be performed on the Pdu's AVPL after all protocol fields have been extracted to it. The list is always executed completely, left to right. On the contrary, the list of Match clauses inside each individual `Transform` is executed only until the first match succeeds.

#### Criteria clause

This clause tells MATE whether to use the Pdu for analysis. It specifies a match AVPL, an AVPL match type (`Strict`, `Every`, or `Loose`) and the action to be performed (`Accept` or `Reject`) if the match succeeds. Once every attribute has been extracted and eventual transform list has been executed, and if the `Criteria` clause is present, the Pdu's AVPL is matched against the match AVPL; if the match succeeds, the action specified is executed, i.e. the Pdu is accepted or rejected. The default behaviours used if the respective keywords are omitted are `Strict` and `Accept`. Accordingly, if the clause is omitted, all Pdus are accepted.

#### DropUnassigned clause

If set to `TRUE`, MATE will destroy the Pdu if it cannot assign it to a Gop. If set to `FALSE` (the default if not given), MATE will keep them.

#### DiscardPduData clause

If set to `TRUE`, MATE will delete the Pdu's AVPL once it has analyzed it and eventually extracted some AVPs from it into the Gop's AVPL. This is useful to save memory (of which MATE uses a lot). If set to `FALSE` (the default if not given), MATE will keep the Pdu attributes.

#### LastExtracted clause

If set to `FALSE` (the default if not given), MATE will continue to look for Pdus of other types in the frame. If set to `TRUE`, it will not try to create Pdus of other types from the current frame, yet it will continue to try for the current type.

### Gop's configuration actions

#### Gop declaration block header

Declares a Gop type and its prematch candidate key.

``` 
    Gop name On pduname Match key {
      Start match_avpl; // optional
      Stop match_avpl; // optional
      Extra match_avpl; // optional
      Transform transform_list; // optional
      Expiration time; // optional
      IdleTimeout time; // optional
      Lifetime time; // optional
      DropUnassigned [TRUE|FALSE]; //optional
      ShowTree [NoTree|PduTree|FrameTree|BasicTree]; //optional
      ShowTimes [TRUE|FALSE]; //optional, default TRUE
    };
```

#### Gop name

The `name` is a mandatory attribute of a Gop declaration. It is chosen arbitrarily, except that each `name` may only be used once in MATE's configuration, regardless the class of an item it is used for. The `name` is used to distinguish between different types of Pdus, Gops, and Gogs. The `name` is also used as part of the filterable fields' names related to this type of Gop which MATE creates.

#### On clause

The `name `of Pdus which this type of Gop is supposed to be groupping. It is mandatory.

#### Match clause

Defines what AVPs form up the `key `part of the Gop's AVPL (the Gop's `key` AVPL or simply the Gop's key). All Pdus matching the `key` AVPL of an active Gop are assigned to that Gop; a Pdu which contains the AVPs whose attribute names are listed in the Gop's `key` AVPL, but they do not strictly match any active Gop's `key` AVPL, will create a new Gop (unless a `Start` clause is given). When a Gop is created, the elements of its `key` AVPL are copied from the creating Pdu.

#### Start clause

If given, it tells MATE what match\_avpl must a Pdu's AVPL match, in addition to matching the Gop's key, in order to start a Gop. If not given, any Pdu whose AVPL matches the Gop's `Key` AVPL will act as a start for a Gop. The Pdu's AVPs matching the match\_avpl are not automatically copied into the Gop's AVPL.

#### Stop clause

If given, it tells MATE what match\_avpl must a Pdu's AVPL match, in addition to matching the Gop's key, in order to stop a Gop. If omitted, the Gop is "auto-stopped" - that is, the Gop is marked as stopped as soon as it is created. The Pdu's AVPs matching the match\_avpl are not automatically copied into the Gop's AVPL.

#### Extra clause

If given, tells MATE which AVPs from the Pdu's AVPL are to be copied into the Gop's AVPL in addition to the Gop's key.

#### Transform clause

The `Transform` clause specifies a list of previously declared `Transform`s to be performed on the Gop's AVPL after the AVPs from each new Pdu, specified by the key AVPL and the Extra clause's match\_avpl, have been merged into it. The list is always executed completely, left to right. On the contrary, the list of Match clauses inside each individual `Transform` is executed only until the first match succeeds.

#### Expiration clause

A (floating) number of seconds after a Gop is `Stop`ped during which further Pdus matching the `Stop`ped Gop's key but not the `Start` condition will still be assigned to that Gop. The default value of zero has an actual meaning of infinity, as it disables this timer, so all Pdus matching the `Stop`ped Gop's key will be assigned to that Gop unless they match the `Start `condition.

#### IdleTimeout clause

A (floating) number of seconds elapsed from the last Pdu assigned to the Gop after which the Gop will be considered released. The default value of zero has an actual meaning of infinity, as it disables this timer, so the Gop won't be released even if no Pdus arrive - unless the `Lifetime` timer expires.

#### Lifetime clause

A (floating) of seconds after the Gop `Start` after which the Gop will be considered released regardless anything else. The default value of zero has an actual meaning of infinity.

#### DropUnassigned clause

Whether or not a Gop that has not being assigned to any Gog should be discarded. If `TRUE`, the Gop is discarded right after creation. If `FALSE`, the default, the unassigned Gop is kept. Setting it to `TRUE` helps save memory and speed up filtering.

#### TreeMode clause

Controls the display of Pdus subtree of the Gop:

  - `NoTree`: completely suppresses showing the tree

  - `PduTree`: the tree is shown and shows the Pdus by Pdu Id

  - `FrameTree`: the tree is shown and shows the Pdus by the frame number in which they are

  - `BasicTree`: needs investigation

#### ShowTimes clause

Whether or not to show the times subtree of the Gop. If `TRUE`, the default, the subtree with the timers is added to the Gop's tree. If `FALSE`, the subtree is suppressed.

### Gog's configuration actions

#### Gop declaration block header

Declares a Gog type and its prematch candidate key.

``` 
    Gog name {
      Member gopname (key); // mandatory, at least one
      Extra match_avpl; // optional
      Transform transform_list; // optional
      Expiration time; // optional, default 2.0
      GopTree [NoTree|PduTree|FrameTree|BasicTree]; // optional
      ShowTimes [TRUE|FALSE]; // optional, default TRUE
    };
```

#### Gop name

The `name` is a mandatory attribute of a Gog declaration. It is chosen arbitrarily, except that each `name` may only be used once in MATE's configuration, regardless the class of an item it is used for. The `name` is used to distinguish between different types of Pdus, Gops, and Gogs. The `name` is also used as part of the filterable fields' names related to this type of Gop which MATE creates.

#### Member clause

  - Defines the `key `AVPL for the Gog individually for each Gop type `gopname`. All `gopname` type Gops whose `key `AVPL matches the corresponding `key `AVPL of an active Gog are assigned to that Gog; a Gop which contains the AVPs whose attribute names are listed in the Gog's corresponding `key` AVPL, but they do not strictly match any active Gog's `key` AVPL, will create a new Gog. When a Gog is created, the elements of its `key` AVPL are copied from the creating Gop.

  - Although the `key `AVPLs are specified separately for each of the Member `gopname`s, in most cases they are identical, as the very purpose of a Gog is to group together Gops made of Pdus of different types.

#### Extra clause

If given, tells MATE which AVPs from any of the Gop's AVPL are to be copied into the Gog's AVPL in addition to the Gog's key.

#### Expiration clause

A (floating) number of seconds after all the Gops assigned to a Gog have been released during which new Gops matching any of the session keys should still be assigned to the existing Gog instead of creating a new one. Its value can range from 0.0 to infinite. Defaults to 2.0 seconds.

#### Transform clause

The `Transform` clause specifies a list of previously declared `Transform`s to be performed on the Gog's AVPL after the AVPs from each new Gop, specified by the key AVPL and the Extra clause's match\_avpl, have been merged into it. The list is always executed completely, left to right. On the contrary, the list of Match clauses inside each individual `Transform` is executed only until the first match succeeds.

#### TreeMode clause

Controls the display of Gops subtree of the Gog:

  - `NoTree`: completely suppresses showing the tree

  - `BasicTree`: needs investigation

  - `FullTree`: needs investigation

#### ShowTimes clause

Whether or not to show the times subtree of the Gog. If `TRUE`, the default, the subtree with the timers is added to the Gog's tree. If `FALSE`, the subtree is suppressed.

### Settings Config AVPL

The **Settings** config element is used to pass to MATE various operational parameters. the possible parameters are

##### GogExpiration

How long in seconds after all the gops assigned to a gog have been released new gops matching any of the session keys should create a new gog instead of being assigned to the previous one. Its value can range from 0.0 to infinite. Defaults to 2.0 seconds.

##### DiscardPduData

Whether or not the AVPL of every Pdu should be deleted after it was being processed (saves memory). It can be either TRUE or FALSE. Defaults to TRUE. Setting it to FALSE can save you from a headache if your config does not work.

##### DiscardUnassignedPdu

Whether Pdus should be deleted if they are not assigned to any Gop. It can be either TRUE or FALSE. Defaults to FALSE. Set it to TRUE to save memory if unassigned Pdus are useless.

##### DiscardUnassignedGop

Whether [GoPs](/GoPs) should be deleted if they are not assigned to any session. It can be either TRUE or FALSE. Defaults to FALSE. Setting it to TRUE saves memory.

##### ShowPduTree

##### ShowGopTimes

### Debugging stuff

The following settings are used to debug MATE and its configuration. All levels are integers ranging from 0 (print only errors) to 9 (flood me with junk), defaulting to 0.

#### Debug declaration block header

``` 
    Debug {
      Filename "path/name"; //optional, no default value
      Level [0-9]; //optional, generic debug level
      Pdu Level [0-9]; //optional, specific debug level for Pdu handling
      Gop Level [0-9]; //optional, specific debug level for Gop handling
      Gog Level [0-9]; //optional, specific debug level for Gog handling
    };
```

#### Filename clause

The `path/name` is a full path to the file to which debug output is to be written. Non-existent file will be created, existing file will be overwritten at each opening of a capture file. If the statement is missing, debug messages are written to console, which means they are invisible on Windows.

#### Level clause

Sets the level of debugging for generic debug messages. It is an integer ranging from 0 (print only errors) to 9 (flood me with junk).

#### Pdu Level clause

Sets the level of debugging for messages regarding Pdu creation. It is an integer ranging from 0 (print only errors) to 9 (flood me with junk).

#### Gop Level clause

Sets the level of debugging for messages regarding Pdu analysis (that is how do they fit into [GoPs](/GoPs)). It is an integer ranging from 0 (print only errors) to 9 (flood me with junk).

#### Gog Level clause

Sets the level of debugging for messages regarding GoP analysis (that is how do they fit into [GoGs](/GoGs)). It is an integer ranging from 0 (print only errors) to 9 (flood me with junk).

#### Settings Example

` Action=Settings; SessionExpiration=3.5; DiscardPduData=FALSE; `

### Action=Include

Will include a file to the configuration.

``` 
        Action=Include; {Filename=filename;|Lib=libname;}
```

#### Filename

The filename of the file to include. If it does not beging with '/' it will look for the file in the current path.

#### Lib

The name of the lib config to include. will look for libname.mate in *wiresharks\_dir*/matelib .

#### Include Example

`Action=Include; Filename=rtsp.mate;` This will include the file called *"rtsp.mate"* into the current config.

---

Imported from https://wiki.wireshark.org/Mate/Reference on 2020-08-11 23:16:35 UTC
