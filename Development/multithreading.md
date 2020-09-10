# Multithreading

## introduction

This is an attempt to list all the tasks involved in making possible to multithread Wireshark. i.e. to have more than one capture (file) open at a time and take advantage of multiple processors.

So that *if* we ever want to do it we know what we are facing.

[[_TOC_]]

## Tasks

### Core

#### Get rid of global variables

#### API

### Dissectors

#### Get rid of global variables

  - Those that are initialized once and never changed like hf\_\* and ett\_\* are OK
  - The "now global" objects should be added to a data structure to be initialized at start of session and later passed to the dissector allong with other session information each time it is called. (This is likely a very minor issue).

#### Modify allocators

  - All g\_malloc calls should eventually be replaced by either ep,se or pe allocators.
  - se and pe allocators do not need a signature change but {se|pe}\_alloc() would need to be protected internally by a lock so that these calls are serialized/reentrant.
  - For the ep allocator we need a pool of data for each thread and a cheap way to do "get\_ep\_pool\_for\_this\_thread()". This can be done by creating new ep pools at the same time a thread is created, and by releasing the entire pool when the thread is terminated. Since each thread has its own pool to allocate from we would not need to add any locking to the ep allocator neither would we need to change the call signature.

#### Modify the associative arrays

  - All `HashTables` should eventually be replaced by ep/se trees.

  - The tree insert/lookup calls need to be protected by a "writer readers lock". This can likely be done by a single global lock since our useage pattern is primarily lookups and few inserts. This should be possible to implement without changing the call signature for these calls. (try free-lock structure googling in order to avoid adding locks)

---

Imported from https://wiki.wireshark.org/Development/multithreading on 2020-08-11 23:12:55 UTC
