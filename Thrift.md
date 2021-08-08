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

:construction:
- [x] Basic types (booleans, numbers, strings, and binary blobs)
- [ ] Enumerations
- [ ] Containers (lists, sets, and maps)
- [ ] Structures (for any depth of imbrication)

This section describes the usual steps to create a dissector based on Thrift.

A Thrift custom sub-dissector works the same way as any dissector: Create the `epan/dissectors/packet-tcustom.c` file and update `epan/dissectors/CMakeLists.txt` accordingly.

The initial `packet-tcustom.c` file looks like that:

```c
#include <epan/packet.h>
#include "packet-thrift.h"

void proto_register_tcustom(void);
void proto_reg_handoff_tcustom(void);

static int proto_tcustom = -1;

static int ett_tcustom = -1;
// Any "ett tree" addition will happen here first

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
*Note*: The above template can be used without any modification to handle a function without any parameter (like `good_bye()` in this example). The only improvement against the generic dissector is the identification of the command as one from our custom protocol, including filtering capabilities, this is why it's interesting to implement this kind of command as well.

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

For `initialize(binary init_vector)`, we define the unique parameter:
```c
        { &hf_tcustom_init_vector,
            { "Initialization Vector", "tcustom.init_vector",
                FT_BYTES, BASE_NONE, NULL,
                0x0, NULL, HFILL }
        },
```
After that, we can use the hf info using the matching `dissect_thrift_t_<type>` helper in `dissect_tcustom_initialize` function:
```c
    offset = dissect_thrift_t_binary(tvb, pinfo, tcustom_tree, offset, thrift_opt, TRUE, 1, hf_tcustom_init_vector);
```

- Parameters `tvb`, `pinfo`, `tcustom_tree`, and `thrift_opt` are always passed as-is to the helper function, *do not* change anything.
- `offset` is always passed as it was received from previous helper, they do handle the error cases transparently.
- `is_field` is always set to `TRUE` when using the individual fields dissection (essentially an internal parameter).
- `field_id` is the number associated to the parameter in the IDL definition (not checked in the case of parameter dissection).
- `hf_id` is the hf info matching the field we want to dissect.

For `register(bool unregister, string server_name, i16 port)`, we define the 3 parameters:
```c
        { &hf_tcustom_unregister,
            { "Unregister", "tcustom.unregister",
                FT_BOOLEAN, BASE_NONE, NULL,
                0x0, NULL, HFILL }
        },
        { &hf_tcustom_server_name,
            { "Server Host Name", "tcustom.server_name",
                FT_STRING, BASE_NONE, NULL,
                0x0, NULL, HFILL }
        },
        // Please note that all Thrift integers are signed.
        // This particular application seems to only support ports up to 32767.
        { &hf_tcustom_port,
            { "Port Number", "tcustom.port",
                FT_INT16, BASE_DEC, NULL,
                0x0, NULL, HFILL }
        },
```
and we put the 3 successive calls in `dissect_tcustom_register`:
```c
    offset = dissect_thrift_t_bool(tvb, pinfo, tcustom_tree, offset, thrift_opt, TRUE, 1, hf_tcustom_unregister);
    // When using string type in the .thrift definition, data is serialized as an UTF-8 string.
    offset = dissect_thrift_t_string(tvb, pinfo, tcustom_tree, offset, thrift_opt, TRUE, 2, hf_tcustom_server_name);
    offset = dissect_thrift_t_i16(tvb, pinfo, tcustom_tree, offset, thrift_opt, TRUE, 3, hf_tcustom_port);
```

For `greetings(binary user_name_utf32le)`, the content is just a binary from Thrift point of view but we happen to know that this is indeed an UTF-32 string encoded in little-endian (for some kind of historical reasons, this tends to happen in real-life projects) so we define it as a string:
```c
        { &hf_tcustom_user_name,
            { "User Name", "tcustom.user_name",
                FT_STRING, BASE_NONE, NULL,
                0x0, NULL, HFILL }
        },
```
In this case, we need to use `dissect_thrift_t_string_enc` that allows us to specify the encoding of the string:
```c
    offset = dissect_thrift_t_string_enc(tvb, pinfo, tcustom_tree, offset, thrift_opt, TRUE, 1, hf_tcustom_user_name, ENC_UCS_4|ENC_LITTLE_ENDIAN);
```

#### Enumerations

:construction:

### Example 1: [Jaeger](https://github.com/jaegertracing)

For this first real example, we will dissect the `emitBatch` command described in [agent.thrift](https://github.com/jaegertracing/jaeger-idl/blob/master/thrift/agent.thrift) and depending on structures defined in [https://github.com/jaegertracing/jaeger-idl/blob/master/thrift/jaeger.thrift](jaeger.thrift).

The complete dissector is shared on GitLab and/or GitHub (repository TBD), with the history of commits following the process described below.

:construction:

### Example 2: [Armeria Maritima](https://en.wikipedia.org/wiki/Armeria_maritima)

The second example is the reverse engineered protocol for an anonymized capture that will allow us to cover all types of data as well as a few elements not covered by the Jaeger dissector above.

In particular, Jaeger is using ONEWAY command which allow the dissector to start dissecting the data without any prior check, while this protocol uses CALL commands associated to REPLY which request the sub-dissector to check the direction before analysis of the content.

This protocol is also developed as a plugin instead of an integrated dissector.

The complete dissector is shared on GitLab and/or GitHub (repository TBD), with the history of commits following the process described below.

:construction: