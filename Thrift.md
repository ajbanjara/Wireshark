*Please Note*: :construction: This page is a work in progress :construction:

[[_TOC_]]

# Apache Thrift (Thrift)

Thrift is a lightweight, language-independent software stack for point-to-point RPC implementation.

For a description of Thrift refer to [Apache Thrift home page](https://thrift.apache.org/).

One key point of Thrift is that several data serialization methods (Thrift Protocols) are possible for a given definition. Only Thrift Binary Protocol and Thrift Compact Protocol are currently supported by the Thrift dissector of Wireshark.

For an overview of the different protocols available, see [Thrift GitHub repository](https://github.com/apache/thrift).

Change log about Wireshark supporting Thrift:
- Wireshark 2.0.0 - Initial support for Thrift Binary Protocol.
- Wireshark 3.5.0 - Full support for Thrift Binary and Compact protocols as well as C sub-dissectors based on the generic one (in progress, see wireshark!3752).

## Protocol dependencies

Thrift content is usually detected and dissected automatically by the default Thrift dissector, allowing fast analysis out-of-the-box.

In some cases however, in particular when one of the endpoints is using an unbuffered implementation, the heuristic dissector might fail to detect a Thrift header as there is not enough data to look at.

In this case, one can set the known port number in the Thrift dissector preferences (both TCP and UDP are supported).

## Write your own Thrift-based dissector

With Thrift protocols being self-described, it’s relatively easy to analyse Thrift PDU with Wireshark on one screen and the documentation of your protocol on the other but it can get bothersome when your protocol contains a lot of different types and deep sub-structures.

Writing a Thrift-based sub-dissector removes the need for the documentation of your Thrift-based protocol and makes the search for a specific PDU easier in a huge capture.

### Generic usage

This section describes the usual steps to create a dissector based on Thrift.

A Thrift custom sub-dissector works the same way as any dissector: Create the `epan/dissectors/packet-tcustom.c` file and update `epan/dissectors/CMakeLists.txt` accordingly.

The initial `packet-tcustom.c` file looks like that:

```c
#include <epan/packet.h>
#include "packet-thrift.h"

void proto_register_tcustom(void);
void proto_reg_handoff_tcustom(void);

// Common helper definitions but not always needed (see containers and structures)
#define TMUTF8 NULL, { .encoding = ENC_UTF_8|ENC_NA }
#define TMRAW NULL, { .encoding = ENC_NA }

static int proto_tcustom = -1;

// Here will go all hf id declarations
//static int hf_tcustom_<where>_<what>

static int ett_tcustom = -1;
// Any "ett tree" addition (for containers and structures) will happen here first

void
proto_register_tcustom(void)
{
    static hf_register_info hf[] = {
        // This location will be referred to as the "hf_register_info section"
    };

    /* setup protocol subtree arrays */
    static gint* ett[] = {
        &ett_tcustom,
        // Any "ett tree" addition will happen here second
    };

    /* Register protocol name and description */
    proto_tcustom = proto_register_protocol("Thrift Custom Protocol", "TCustom", "tcustom");

    /* register field array */
    proto_register_field_array(proto_tcustom, hf, array_length(hf));

    /* register subtree array */
    proto_register_subtree_array(ett, array_length(ett));
}

void
proto_reg_handoff_tcustom(void)
{
    // Any supported command will be registered in this function.
}
```

#### Basic types

As an "Hello World!"-level example, consider the following Thrift definition:

```c
service HelloWorld {
  oneway void initialize(1: binary payload);
  oneway void register(1: bool unregister, 2: string server_name, 3: i16 port);
  oneway void greetings(1: binary user_name_utf32le);
  oneway void good_bye();
}
```

To handle this protocol, we need to create and register 3 functions, each responsible for one of the commands. Each function is created following this template:
```c
// Here, the <command_name> will be one of register, initialize, and greetings
static int
dissect_tcustom_<command_name>(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void *data)
{
    // We get this data from the generic dissector and need to pass it back to the helper functions.
    thrift_option_data_t *thrift_opt = (thrift_option_data_t *)data;
    // Start dissection from the beginning of the tvbuff_t.
    int offset = 0;
    // Create the tree right now, using unspecified length (-1)
    proto_item *tcustom_pi = proto_tree_add_item(tree, proto_tcustom, tvb, offset, -1, ENC_NA);;
    proto_tree *tcustom_tree = proto_item_add_subtree(tcustom_pi, ett_tcustom);

    /********************************/
    /* Dissection will happen here! */
    /********************************/

    // Thrift commands /always/ ends with T_STOP, so keep it in the template
    offset = dissect_thrift_t_stop(tvb, pinfo, tcustom_tree, offset);

    // The current value of offset is either an error code or the end of the dissected data.
    // T_STOP takes 1 byte so offset cannot be 0.
    if (offset > 0) {
        // Set the end of the main tree
        proto_item_set_end(tcustom_pi, tvb, offset);
    }
    return offset;
}
```
*Note*: The above template can be used to handle a function without any parameter (like `good_bye()` in this example). The only improvement against the generic dissector is the identification of the command as one from our custom protocol, including filtering capabilities, this is why it's interesting to implement this kind of command as well.
In this case, remove the `thrift_opt` definition on the first line and add `_U_` after the `data` parameter as it will not be used.

Registration happens in `proto_reg_handoff_tcustom()`

```c
void
proto_reg_handoff_tcustom(void)
{
    dissector_add_string("thrift.method_names", "register", create_dissector_handle(dissect_tcustom_register, proto_tcustom));
    dissector_add_string("thrift.method_names", "initialize", create_dissector_handle(dissect_tcustom_initialize, proto_tcustom));
    dissector_add_string("thrift.method_names", "greetings", create_dissector_handle(dissect_tcustom_greetings, proto_tcustom));
    dissector_add_string("thrift.method_names", "good_bye", create_dissector_handle(dissect_tcustom_good_bye, proto_tcustom));
}
```

For any field that needs to be dissected, the first step is to define it in the hf_register_info section for proper display:

For `initialize(binary init_vector)`, we define the unique parameter via its hf id under the name `hf_tcustom_<command_name>_<param_name>` (if a parameter or structure field with a given name is _always_ of the same type as any other parameter or structure field with the same name, you can omit the command name):
```c
        // Associated with the declaration of hf_tcustom_initialize_init_vector at the beginning
        { &hf_tcustom_initialize_init_vector,
            { "Initialization Vector", "tcustom.initialize.init_vector",
                FT_BYTES, BASE_NONE, NULL,
                0x0, NULL, HFILL }
        },
```
After that, we can use the hf info using the matching `dissect_thrift_t_<type>` helper in `dissect_tcustom_initialize` function:
```c
    offset = dissect_thrift_t_binary(tvb, pinfo, tcustom_tree, offset, thrift_opt, TRUE, 1, hf_tcustom_initialize_init_vector);
```

- Parameters `tvb`, `pinfo`, `tcustom_tree`, and `thrift_opt` are always passed as-is to the helper function, *do not* change anything.
- `offset` is always passed as it was received from previous helper, they do handle the error cases transparently.
- `is_field` is always set to `TRUE` when using the individual fields dissection (essentially an internal parameter).
- `field_id` is the number associated to the parameter in the IDL definition.
- `hf_id` is the hf info matching the field we want to dissect.

For `register(bool unregister, string server_name, i16 port)`, we define the 3 parameters:
```c
        { &hf_tcustom_register_unregister,
            { "Unregister", "tcustom.register.unregister",
                FT_BOOLEAN, BASE_NONE, NULL,
                0x0, NULL, HFILL }
        },
        { &hf_tcustom_register_server_name,
            { "Server Host Name", "tcustom.register.server_name",
                FT_STRING, BASE_NONE, NULL,
                0x0, NULL, HFILL }
        },
        // Please note that all Thrift integers are signed.
        // This particular application seems to only support ports up to 32767.
        { &hf_tcustom_register_port,
            { "Port Number", "tcustom.register.port",
                FT_INT16, BASE_DEC, NULL,
                0x0, NULL, HFILL }
        },
```
and we put the 3 successive calls in `dissect_tcustom_register`:
```c
    offset = dissect_thrift_t_bool(tvb, pinfo, tcustom_tree, offset, thrift_opt, TRUE, 1, hf_tcustom_register_unregister);
    // When using string type in the .thrift definition, data is serialized as an UTF-8 string.
    offset = dissect_thrift_t_string(tvb, pinfo, tcustom_tree, offset, thrift_opt, TRUE, 2, hf_tcustom_register_server_name);
    offset = dissect_thrift_t_i16(tvb, pinfo, tcustom_tree, offset, thrift_opt, TRUE, 3, hf_tcustom_register_port);
```

For `greetings(binary user_name_utf32le)`, the content is just a binary from Thrift point of view but we happen to know that this is indeed an UTF-32 string encoded in little-endian (for some kind of historical reasons, this tends to happen in real-life projects) so we define it as a string:
```c
        { &hf_tcustom_greetings_user_name,
            { "User Name", "tcustom.greetings.user_name",
                FT_STRING, BASE_NONE, NULL,
                0x0, NULL, HFILL }
        },
```
In this case, we need to use `dissect_thrift_t_string_enc` that allows us to specify the encoding of the string:
```c
    offset = dissect_thrift_t_string_enc(tvb, pinfo, tcustom_tree, offset, thrift_opt, TRUE, 1, hf_tcustom_greetings_user_name, ENC_UCS_4|ENC_LITTLE_ENDIAN);
```

#### Enumerations

The handling of thrift enumerations is similar to any enumeration in Wireshark, the only constraint is to associate them with `i32` integers.

The example will use the following definition:
```c
enum nearly_boolean {
  true,
  false,
  maybe,
}

service Enumeration {
  oneway void configure(1: nearly_boolean active);
}
```

In this case, we need to define the string translations for each enum values as usual:
```c
static const value_string tcustom_nearly_boolean_vals[] = {
    { 0, "Very True" }, // Like in C, Thrift enums start at 0
    { 1, "Absolutely False" },
    { 2, "It’s not impossible" },
    { 0, NULL },
};
```

Then, we define the parameter in the hf_field_info section associated to the right enumeration:
```c
        { &hf_tcustom_configure_active,
            { "Active", "tcustom.configure.active",
                FT_INT32, BASE_DEC, VALS(tcustom_nearly_boolean_vals),
                0x0, NULL, HFILL }
        },
```

*Note*: I choose to keep the hf_id associated with the specific use and not the type itself to allow for an easier search. This choice brings the need to define a new hf_id for every usage of this type. You might want to do otherwise to limit the number of hf_id.

Then, the dissection is done as usual using `dissect_thrift_t_i32`:

```c
    offset = dissect_thrift_t_i32(tvb, pinfo, tcustom_tree, offset, thrift_opt, TRUE, 1, hf_tcustom_configure_active);
```

#### Containers

Thrift exposes 3 kinds of container:
* A `list` is an ordered sequence of 0 or more objects of a given type (same type for all elements, repetitions are authorized).
* A `set` is an unordered sequence of 0 or more objects of a given type (same type for all elements) without repetition of the same object in the set.
* A `map` is an unordered sequence of 0 or more pairs of objects
  * The first object of each pair is the _key_.
  * The second object of each pair is the _value_.
  * All keys are of the same type, all values are of the same type.
  * The type of the keys can be different from the type of the values.
  * A given _key_ cannot be repeated within the `map`.
  * A given _value_ can be repeated within the `map`.

The example will use the following definition:
```c
service Containers {
  oneway void set_keys(1: map<string, i32> registry);
}
```

In order to properly dissect these containers, we need to describe both the container itself and the elements (key and value in case of `map`).

We will first describe the key and value as any `string` or `i32`:
```c
        { &hf_tcustom_set_keys_registry_key,
            { "Registry Key", "tcustom.set_keys.registry.key",
                FT_STRING, BASE_NONE, NULL,
                0x0, NULL, HFILL }
        },
        { &hf_tcustom_set_keys_registry_value,
            { "Registry Value", "tcustom.set_keys.registry.value",
                FT_INT32, BASE_DEC, NULL,
                0x0, NULL, HFILL }
        },
```

But we also need to encapsulate that into a `thrift_member_t` structure that will be used by the container helper function:
```c
static const thrift_member_t tcustom_set_keys_registry_key   = { &hf_tcustom_set_keys_registry_key,   0, FALSE, DE_THRIFT_T_BINARY, TMUTF8 };
static const thrift_member_t tcustom_set_keys_registry_value = { &hf_tcustom_set_keys_registry_value, 0, FALSE, DE_THRIFT_T_BINARY, TMFILL };
```

In order, the fields of this structure are:
* The hf id that describes the data.
* The field id. (only used in structures, set it to 0)
* Is the field optional? (also for structures, set to `FALSE`)
* The expected type of the field/element/key/value, required to ensure we will decode the data properly. Remember that Thrift exposes more types in the IDL than on the network:
  * `string` and `binary` are transfered as `DE_THRIFT_T_BINARY` (only the encoding changes)
  * `struct`, `union`, and `exception` are transfered as `DE_THRIFT_T_STRUCT`.
* The "ett tree" of the inner element (for a list of structures, it would be the ett tree of the structure), keep it `NULL` for all types but containers and structures.
* The additional parameters in case this element needs some:
  * `binary` and `string` need an encoding.
  * `list` and `set` need information about the element type.
  * `map` needs information about the key and value types.
  * `struct` & co need information about the fields (we’ll see in next chapter).

Since in most cases, ett tree and additional parameters are not necessary, the `packet-thrift.h` header provides the convenient definition of `TMFILL` (similar to the `HFILL` for hf ids).

If your dissector often uses strings and/or binaries, you can use the `TMUTF8` and `TMRAW` definitions given in this example.

The definition of the `thrift_member_t` for the inner element or key and value types closes the description of the content, then we need to describe the container itself.

* Add the matching "ett tree":
  * Add `static int ett_tcustom_set_keys_registry = -1;` next to the declaration of `ett_custom` (the _trunk_ of our tree).
  * Add `ett_tcustom_set_keys_registry` in the initialization list in `proto_register_tcustom`.
* Add the hf id definition which is straightforward:

```c
        { &hf_tcustom_set_keys_registry,
            { "Registry Configuration Keys", "tcustom.set_keys.registry",
                FT_NONE, BASE_NONE, NULL, // We don’t want to display the data in the interface
                0x0, NULL, HFILL }
        },
```

Then you can call `dissect_thrift_t_map` (or any other container helper) with its additional parameters.
```c
    offset = dissect_thrift_t_map(tvb, pinfo, tcustom_tree, offset, thrift_opt, TRUE, 1, hf_tcustom_set_keys_registry, ett_tcustom_set_keys_registry, &tcustom_set_keys_registry_key, &tcustom_set_keys_registry_value);
```

#### Structures

The last types of object exposed by Thrift are the `struct` and `union` types.
* A `struct` contains any number of fields, each of them indexed by a specific numeric value (visible on the network). In addition, each field can be
  * either `required`, meaning it must be present when the parent `struct` is used in communication,
  * or `optional`, meaning it may or may not be present during communication.
  * In the context of Wireshark, the absence of qualifier must be considered equivalent to `optional`.
* An `union` is similar to a `struct` (and is sent as such in the serialized data) with the following restrictions:
  * All fields are `optional`.
  * Exactly one (1) field is filled when used in a communication.

To demonstrate this, we’ll use the following definition:
```c
union big_integer {
  1: i64    small;
  2: binary efficient;
  3: list<bool> inefficient;
};

struct placement {
  0: required i32 position;
  32767: optional i8 occurrences;
};

service Structures {
  oneway void insert(1: big_integer bigint, 2: placement where);
}
```

As usual, we start with the definition of the leafs (exact definition left as an exercise :pencil:):
```c
// hf id for all leaf elements
static int hf_tcustom_big_integer_small = -1;
static int hf_tcustom_big_integer_efficient = -1;
static int hf_tcustom_big_integer_inefficient_bit = -1; // For the elements of the list
static int hf_tcustom_big_integer_inefficient = -1; // The list itself
static int hf_tcustom_placement_position = -1;
static int hf_tcustom_placement_occurrences = -1;

// ett tree for the list
static int ett_tcustom_big_integer_inefficient = -1;

// description of the list for deep dissection
static const thrift_member_t tcustom_big_integer_inefficient = { &hf_tcustom_big_integer_inefficient_bit, 0, FALSE, DE_THRIFT_T_BOOL, TMFILL };
```
Note that in this case, the leafs are child of a structure type so the naming scheme is now following the pattern `hf_tcustom_<type_name>_<field_name>` (it should be safe to assume we never have collision between type and command names but you can adapt to your needs).

Now we need to write the necessary ett trees (`ett_tcustom_insert_bigint` and `ett_tcustom_insert_where`) and hf id for the structures:
```c
        { &hf_tcustom_insert_bigint,
            { "Big Integer", "tcustom.insert.bigint",
                FT_NONE, BASE_NONE, NULL,
                0x0, NULL, HFILL }
        },
        { &hf_tcustom_insert_where,
            { "Where", "tcustom.insert.where",
                FT_NONE, BASE_NONE, NULL,
                0x0, NULL, HFILL }
        },
```

Now, we need the description for the structure dissection which looks like the same type as for lists and sets. The main difference is while the containers took 1 or 2 pointers to a `thrift_member_t`, the structure needs a sequence of elements so in this case, we want an array of element which are described as follows in our example:
```c
static const thrift_member_t tcustom_big_integer[] = {
    { &hf_tcustom_big_integer_small, 1, TRUE, DE_THRIFT_T_I64, TMFILL },
    { &hf_tcustom_big_integer_efficient, 2, TRUE, DE_THRIFT_T_BINARY, TMFILL },
    { &hf_tcustom_big_integer_inefficient, 3, TRUE, DE_THRIFT_T_LIST, &ett_tcustom_big_integer_inefficient, { .element = &tcustom_big_integer_inefficient } },
    { NULL, 0, FALSE, DE_THRIFT_T_STOP, TMFILL }
};
static const thrift_member_t tcustom_placement[] = {
    { &hf_tcustom_placement_position, 0, FALSE, DE_THRIFT_T_I32, TMFILL },
    { &hf_tcustom_placement_occurrences, 32767, TRUE, DE_THRIFT_T_I8, TMFILL },
    { NULL, 0, FALSE, DE_THRIFT_T_STOP, TMFILL }
};
```
This time, we see the second and third fields of the `thrift_member_t` structure really used:
* The second one is the field id as described in the .thrift IDL file (necessary to realign when optional fields are not provided).
* The third one is `TRUE` if the field is `optional` (or without qualifier) and `false` if `required`.

The last parameter (after the ett tree for the targetted element) also get more visible here (it can be used in container as well, depending on the type of elements):
* Most of the time, it’s not used and `TMFILL` provides a default initialization.
* For binary fields, we provide the expected encoding with `{ .encoding = ENC_SOMETHING }`.
* For lists and set, we provide the pointer to the element description with `{ .element = &tcustom_<type_name>_<field_name> }`
* For maps, we provide both the key and value descriptions with `{ .key = &tcustom_<type_name>_<field_name>_key, .value = &tcustom_<type_name>_<field_name>_value }`
* For sub-structures, we provide the list of members with `{ .members = tcustom_<subtype_name> }`
* Finally, all structures and unions end with a `T_STOP` field when serialized, this is materialized in the description with the fixed content `{ NULL, 0, FALSE, DE_THRIFT_T_STOP, TMFILL }` which also marks the end of the array.

At this point, we can now call the helper as usual:
```c
    offset = dissect_thrift_t_struct(tvb, pinfo, tcustom_tree, offset, thrift_opt, TRUE, 1, hf_tcustom_insert_bigint, ett_tcustom_insert_bigint, tcustom_big_integer);
    offset = dissect_thrift_t_struct(tvb, pinfo, tcustom_tree, offset, thrift_opt, TRUE, 2, hf_tcustom_insert_where, ett_tcustom_insert_where, tcustom_placement);
```
 
##### Simplified display of unions

Given that unions always contain exactly one field, you might want to omit the sub-tree that would contain only one element (especially if you need to scan a long list of these).

This is very easily achieved by _not_ giving the matching hf id and ett tree elements and replace them with `-1` which is the default value for uninitialized elements.

In order to clarify this behavior, we can define the constant:
```c
static const int DISABLE_SUBTREE = -1;
```

And we can now replace the first call with:
```c
    offset = dissect_thrift_t_struct(tvb, pinfo, tcustom_tree, offset, thrift_opt, TRUE, 1, DISABLE_SUBTREE, DISABLE_SUBTREE, tcustom_big_integer);
```

In a similar way, when used as a field for a structure or an element inside a container, the matching `thrift_member_t` definition would be:
```c
    { DISABLE_SUBTREE, 1, TRUE, DE_THRIFT_T_STRUCT, DISABLE_SUBTREE, { .members = tcustom_big_integer } },
```

:warning: If you choose to omit the tree, the label displayed in the interface will be the one from the available field (here, it would be the definition for `small`, `efficient`, or `inefficient` field) and not the definition of the union itself (which can in fact be removed, along with the matching ett tree).

#### Functions with a reply

Until now, we only dissected `oneway` commands which do not expect any response so when we see them on the network, we just have to dissect the parameters.

However, the Thrift IDL allow the definition of commands that return a value or possibly an exception:
```c
exception out_of_memory_exception {
  1: int error_code;
  2: string message;
};

service EchoChamber {
  binary ping(1: binary payload)
  throws (1: out_of_memory_exception oom_exc
          /* 2: some_other_exception so_exc, … */);
}
```

When commands with a result are used, we need to answer 2 questions:
1. Is this the request or the answer?
2. In case of answer, what kind of response was it?

For the first question, we need to take a look at the `data` provided by the Thrift generic dissector that we already casted into a `thrift_option_data_t` pointer:
```c
    switch (thrift_opt->mtype) {
    case ME_THRIFT_T_CALL:
        // Dissect the parameters as we do for oneway commands.
        offset = dissect_thrift_t_binary(tvb, pinfo, tcustom_tree, offset, thrift_opt, TRUE, 1, hf_tcustom_ping_payload);
        break;
    case ME_THRIFT_T_REPLY:
        /* TODO: Dissect the answer. */
        break;
    default: // ME_THRIFT_T_ONEWAY or ME_THRIFT_T_EXCEPTION
        // Something is wrong, let the generic dissector handle that.
        return 0;
    }
    // We still need to dissect the ending `T_STOP` in all cases.
    offset = dissect_thrift_t_stop(tvb, pinfo, tcustom_tree, offset);
```

Note: You could do the check for `oneway` commands as well, in which case only `ME_THRIFT_T_ONEWAY` would be valid.

Regarding dissection of the answer, we need to understand that 2 kinds of answers are possible:
- A successful answer where we need to dissect the return type in the `T_REPLY`.
- A application exception reply, where we received one of the exceptions described in the `.thrift` files in the `T_REPLY`.
- A Thrift protocol exception, where we receive a `T_EXCEPTION`.

The last case is the easy one: as these exceptions are described in [Thrift itself](https://github.com/apache/thrift/blob/master/doc/specs/thrift-rpc.md), the `T_EXCEPTION` messages are handled by the generic dissector.

The `T_REPLY` on the other hand are a little more complex. As described in the [RPC specification](https://github.com/apache/thrift/blob/master/doc/specs/thrift-rpc.md), the answer contains either the return type as field 0, or exactly one exception with the field id defined in the IDL.

To be able to dissect the right element, we need to know the field id that is contained in the `T_REPLY`. This piece of information is once again provided in the `thrift_option_data_t` structure:
```c
    case ME_THRIFT_T_REPLY:
        // Dissect the answer.
        switch (thrift_opt->reply_field_id) {
        case 0:
            // If the return type is void, this `case 0:` only contains the `break;`.
            offset = dissect_thrift_t_binary(tvb, pinfo, tcustom_tree, offset, thrift_opt, TRUE, 0, hf_tcustom_ping_return);
            break;
        case 1:
            // Exception are just structures with a specific use.
            offset = dissect_thrift_t_struct(tvb, pinfo, tcustom_tree, offset, thrift_opt, TRUE, 1, hf_tcustom_ping_oom_exc, ett_tcustom_oom_exc, tcustom_oom_exc);
            break;
        /*case 2:
            offset = dissect_thrift_t_struct(tvb, pinfo, tcustom_tree, offset, thrift_opt, TRUE, 2, hf_tcustom_ping_so_exc, ett_tcustom_so_exc, tcustom_so_exc);
            break;
        // et caetera. */
        default:
            // Unsupported exception, let the generic dissector handle that.
            return 0:
        }
        break;
```

*Note*: whether or not application exceptions are defined for a particular command, the return type will always be field number 0 in the `T_REPLY`.

#### :paperclip: Hijacking structure dissection feature :paperclips:

:gift:

### Example 1: [Jaeger](https://github.com/jaegertracing)

For this first real example, we will dissect the `emitBatch` command described in [agent.thrift](https://github.com/jaegertracing/jaeger-idl/blob/master/thrift/agent.thrift) and depending on structures defined in [jaeger.thrift](https://github.com/jaegertracing/jaeger-idl/blob/master/thrift/jaeger.thrift).

The complete dissector is shared on GitLab and/or GitHub (repository TBD), with the history of commits following the process described below.

:construction:

### Example 2: [Armeria Maritima](https://en.wikipedia.org/wiki/Armeria_maritima)

The second example is the reverse engineered protocol for an anonymized capture that will allow us to cover all types of data as well as a few elements not covered by the Jaeger dissector above.

In particular, Jaeger is using ONEWAY command which allow the dissector to start dissecting the data without any prior check, while this protocol uses CALL commands associated to REPLY which request the sub-dissector to check the direction before analysis of the content.

This protocol is also developed as a plugin instead of an integrated dissector.

The complete dissector is shared on GitLab and/or GitHub (repository TBD), with the history of commits following the process described below.

:construction: