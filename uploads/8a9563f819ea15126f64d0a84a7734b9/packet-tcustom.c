/* packet-tcustom.c
 * Routines for Thrift Custom Protocol dissection.
 * Based on work by Anders Broman <anders.broman[at]ericsson.com>
 *
 * Copyright 2021-2023, Triton Circonflexe <triton[at]kumal.info>
 *
 * Wireshark - Network traffic analyzer
 * By Gerald Combs <gerald@wireshark.org>
 * Copyright 1998 Gerald Combs
 *
 * SPDX-License-Identifier: GPL-2.0-or-later
 */

/* tcustom.thrift

service HelloWorld {
  oneway void registration(1: bool unregister, 2: string server_name, 3: i16 port);
  oneway void initialize(1: binary init_vector);
  oneway void greetings(1: binary user_name_utf32le);
  oneway void good_bye();
}

// Inspired by https://thedailywtf.com/articles/What_Is_Truth_0x3f_

enum nearly_boolean {
  True,
  False,
  Maybe,
}

service Enumeration {
  oneway void configure(1: nearly_boolean active);
}

service Containers {
  oneway void set_keys(1: map<string, i32> registry);
}

union big_integer {
  1: i64    small;
  2: binary efficient;
  3: list<bool> inefficient;
}

struct placement {
  0: required i32 position;
  32767: optional i8 occurrences;
}

service Structures {
  oneway void insert(1: big_integer bigint, 2: placement where);
}

exception out_of_memory_exception {
  1: i32 error_code;
  2: string message;
}

service EchoChamber {
  binary ping(1: binary payload)
  throws (1: out_of_memory_exception oom_exc);
}
*/
#include <epan/packet.h>
#include "packet-thrift.h"

void proto_register_tcustom(void);
void proto_reg_handoff_tcustom(void);

/* Return codes or assimilated. */
#define NOT_AN_EXPECTED_PDU  (0)

#define TMUTF8 NULL, { .encoding = ENC_UTF_8 }
#define TMRAW NULL, { .encoding = ENC_NA }

static const int DISABLE_SUBTREE = -1;

static int proto_tcustom = -1;

static int hf_tcustom_big_integer_small = -1;
static int hf_tcustom_big_integer_efficient = -1;
static int hf_tcustom_big_integer_inefficient_bit = -1;
static int hf_tcustom_big_integer_inefficient = -1;
static int hf_tcustom_placement_position = -1;
static int hf_tcustom_placement_occurrences = -1;
static int hf_tcustom_out_of_memory_exception_error_code = -1;
static int hf_tcustom_out_of_memory_exception_message = -1;
static int hf_tcustom_out_of_memory_exception = -1;
static int hf_tcustom_registration_unregister = -1;
static int hf_tcustom_registration_server_name = -1;
static int hf_tcustom_registration_port = -1;
static int hf_tcustom_initialize_init_vector = -1;
static int hf_tcustom_greetings_user_name = -1;
static int hf_tcustom_configure_active = -1;
static int hf_tcustom_set_keys_registry_key = -1;
static int hf_tcustom_set_keys_registry_value = -1;
static int hf_tcustom_set_keys_registry = -1;
//static int hf_tcustom_insert_bigint = -1; // Not interesting for unions
static int hf_tcustom_insert_where = -1;
static int hf_tcustom_ping_payload = -1;
static int hf_tcustom_ping_return = -1;

static int ett_tcustom = -1;
static int ett_tcustom_big_integer_inefficient = -1;
//static int ett_tcustom_insert_bigint = -1; // Not interesting for unions
static int ett_tcustom_insert_where = -1;
static int ett_tcustom_out_of_memory_exception = -1;
static int ett_tcustom_set_keys_registry = -1;

static const value_string tcustom_nearly_boolean_vals[] = {
    {  0, "Very True" },
    {  1, "Absolutely False" },
    {  2, "It’s not impossible" },
    {  0, NULL }
};

static const thrift_member_t tcustom_set_keys_registry_key   = { &hf_tcustom_set_keys_registry_key,   0, FALSE, DE_THRIFT_T_BINARY, TMUTF8 };
static const thrift_member_t tcustom_set_keys_registry_value = { &hf_tcustom_set_keys_registry_value, 0, FALSE, DE_THRIFT_T_I32   , TMFILL };

static const thrift_member_t tcustom_big_integer_inefficient = { &hf_tcustom_big_integer_inefficient_bit, 0, FALSE, DE_THRIFT_T_BOOL, TMFILL };
static const thrift_member_t tcustom_big_integer[] = {
    { &hf_tcustom_big_integer_small, 1, TRUE, DE_THRIFT_T_I64, TMFILL },
    { &hf_tcustom_big_integer_efficient, 2, TRUE, DE_THRIFT_T_BINARY, TMRAW },
    { &hf_tcustom_big_integer_inefficient, 3, TRUE, DE_THRIFT_T_LIST, &ett_tcustom_big_integer_inefficient, { .element = &tcustom_big_integer_inefficient } },
    { NULL, 0, FALSE, DE_THRIFT_T_STOP, TMFILL }
};

static const thrift_member_t tcustom_placement[] = {
    { &hf_tcustom_placement_position, 0, FALSE, DE_THRIFT_T_I32, TMFILL },
    { &hf_tcustom_placement_occurrences, 32767, TRUE, DE_THRIFT_T_I8, TMFILL },
    { NULL, 0, FALSE, DE_THRIFT_T_STOP, TMFILL }
};

static const thrift_member_t tcustom_out_of_memory_exception[] = {
    { &hf_tcustom_out_of_memory_exception_error_code, 1, TRUE, DE_THRIFT_T_I32, TMFILL },
    { &hf_tcustom_out_of_memory_exception_message, 2, TRUE, DE_THRIFT_T_BINARY, TMUTF8 },
    { NULL, 0, FALSE, DE_THRIFT_T_STOP, TMFILL }
};

static int
dissect_tcustom_registration(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void *data)
{
    thrift_option_data_t *thrift_opt = (thrift_option_data_t *)data;
    int offset = 0;
    proto_item *tcustom_pi = proto_tree_add_item(tree, proto_tcustom, tvb, offset, -1, ENC_NA);
    proto_tree *tcustom_tree = proto_item_add_subtree(tcustom_pi, ett_tcustom);

    offset = dissect_thrift_t_bool(tvb, pinfo, tcustom_tree, offset, thrift_opt, TRUE, 1, hf_tcustom_registration_unregister);
    // When using string type in the .thrift definition, data is serialized as an UTF-8 string.
    offset = dissect_thrift_t_string(tvb, pinfo, tcustom_tree, offset, thrift_opt, TRUE, 2, hf_tcustom_registration_server_name);
    offset = dissect_thrift_t_i16(tvb, pinfo, tcustom_tree, offset, thrift_opt, TRUE, 3, hf_tcustom_registration_port);

    offset = dissect_thrift_t_stop(tvb, pinfo, tcustom_tree, offset);

    if (offset > 0) proto_item_set_end(tcustom_pi, tvb, offset);
    return offset;
}

static int
dissect_tcustom_initialize(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void *data)
{
    thrift_option_data_t *thrift_opt = (thrift_option_data_t *)data;
    int offset = 0;
    proto_item *tcustom_pi = proto_tree_add_item(tree, proto_tcustom, tvb, offset, -1, ENC_NA);
    proto_tree *tcustom_tree = proto_item_add_subtree(tcustom_pi, ett_tcustom);

    offset = dissect_thrift_t_binary(tvb, pinfo, tcustom_tree, offset, thrift_opt, TRUE, 1, hf_tcustom_initialize_init_vector);

    offset = dissect_thrift_t_stop(tvb, pinfo, tcustom_tree, offset);

    if (offset > 0) proto_item_set_end(tcustom_pi, tvb, offset);
    return offset;
}

static int
dissect_tcustom_greetings(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void *data)
{
    thrift_option_data_t *thrift_opt = (thrift_option_data_t *)data;
    int offset = 0;
    proto_item *tcustom_pi = proto_tree_add_item(tree, proto_tcustom, tvb, offset, -1, ENC_NA);
    proto_tree *tcustom_tree = proto_item_add_subtree(tcustom_pi, ett_tcustom);

    // We can specify another encoding for the string, Little Endian UTF-32 is specified as ENC_UCS_4|ENC_LITTLE_ENDIAN.
    offset = dissect_thrift_t_string_enc(tvb, pinfo, tcustom_tree, offset, thrift_opt, TRUE, 1, hf_tcustom_greetings_user_name, ENC_UCS_4|ENC_LITTLE_ENDIAN);

    offset = dissect_thrift_t_stop(tvb, pinfo, tcustom_tree, offset);

    if (offset > 0) proto_item_set_end(tcustom_pi, tvb, offset);
    return offset;
}

static int
dissect_tcustom_good_bye(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void *data _U_)
{
    int offset = 0;
    proto_item *tcustom_pi = proto_tree_add_item(tree, proto_tcustom, tvb, offset, -1, ENC_NA);
    proto_tree *tcustom_tree = proto_item_add_subtree(tcustom_pi, ett_tcustom);

    // Nothing to dissect here, except for the ending T_STOP.

    offset = dissect_thrift_t_stop(tvb, pinfo, tcustom_tree, offset);

    if (offset > 0) proto_item_set_end(tcustom_pi, tvb, offset);
    return offset;
}

static int
dissect_tcustom_configure(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void *data)
{
    thrift_option_data_t *thrift_opt = (thrift_option_data_t *)data;
    int offset = 0;
    proto_item *tcustom_pi = proto_tree_add_item(tree, proto_tcustom, tvb, offset, -1, ENC_NA);
    proto_tree *tcustom_tree = proto_item_add_subtree(tcustom_pi, ett_tcustom);

    offset = dissect_thrift_t_i32(tvb, pinfo, tcustom_tree, offset, thrift_opt, TRUE, 1, hf_tcustom_configure_active);

    offset = dissect_thrift_t_stop(tvb, pinfo, tcustom_tree, offset);

    if (offset > 0) proto_item_set_end(tcustom_pi, tvb, offset);
    return offset;
}

static int
dissect_tcustom_set_keys(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void *data)
{
    thrift_option_data_t *thrift_opt = (thrift_option_data_t *)data;
    int offset = 0;
    proto_item *tcustom_pi = proto_tree_add_item(tree, proto_tcustom, tvb, offset, -1, ENC_NA);
    proto_tree *tcustom_tree = proto_item_add_subtree(tcustom_pi, ett_tcustom);

    offset = dissect_thrift_t_map(tvb, pinfo, tcustom_tree, offset, thrift_opt, TRUE, 1, hf_tcustom_set_keys_registry, ett_tcustom_set_keys_registry, &tcustom_set_keys_registry_key, &tcustom_set_keys_registry_value);

    offset = dissect_thrift_t_stop(tvb, pinfo, tcustom_tree, offset);

    if (offset > 0) proto_item_set_end(tcustom_pi, tvb, offset);
    return offset;
}

static int
dissect_tcustom_insert(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void *data)
{
    thrift_option_data_t *thrift_opt = (thrift_option_data_t *)data;
    int offset = 0;
    proto_item *tcustom_pi = proto_tree_add_item(tree, proto_tcustom, tvb, offset, -1, ENC_NA);
    proto_tree *tcustom_tree = proto_item_add_subtree(tcustom_pi, ett_tcustom);

    offset = dissect_thrift_t_struct(tvb, pinfo, tcustom_tree, offset, thrift_opt, TRUE, 1, DISABLE_SUBTREE, DISABLE_SUBTREE, tcustom_big_integer);
    offset = dissect_thrift_t_struct(tvb, pinfo, tcustom_tree, offset, thrift_opt, TRUE, 2, hf_tcustom_insert_where, ett_tcustom_insert_where, tcustom_placement);

    offset = dissect_thrift_t_stop(tvb, pinfo, tcustom_tree, offset);

    if (offset > 0) proto_item_set_end(tcustom_pi, tvb, offset);
    return offset;
}

static int
dissect_tcustom_ping(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void *data)
{
    thrift_option_data_t *thrift_opt = (thrift_option_data_t *)data;
    int offset = 0;
    proto_item *tcustom_pi = proto_tree_add_item(tree, proto_tcustom, tvb, offset, -1, ENC_NA);
    proto_tree *tcustom_tree = proto_item_add_subtree(tcustom_pi, ett_tcustom);

    switch (thrift_opt->mtype) {
    case ME_THRIFT_T_CALL:
        // Dissect the parameters as we do for oneway commands.
        offset = dissect_thrift_t_binary(tvb, pinfo, tcustom_tree, offset, thrift_opt, TRUE, 1, hf_tcustom_ping_payload);
        break;
    case ME_THRIFT_T_REPLY:
        switch (thrift_opt->reply_field_id) {
        case 0:
            offset = dissect_thrift_t_binary(tvb, pinfo, tcustom_tree, offset, thrift_opt, TRUE, 0, hf_tcustom_ping_return);
            break;
        case 1:
            offset = dissect_thrift_t_struct(tvb, pinfo, tcustom_tree, offset, thrift_opt, TRUE, 1, hf_tcustom_out_of_memory_exception, ett_tcustom_out_of_memory_exception, tcustom_out_of_memory_exception);
            break;
        default:
            // Unsupported exception, let the generic dissector handle that.
            return NOT_AN_EXPECTED_PDU;
        }
        break;
    default:
        // Something is wrong, let the generic dissector handle that.
        return NOT_AN_EXPECTED_PDU;
    }

    offset = dissect_thrift_t_stop(tvb, pinfo, tcustom_tree, offset);

    if (offset > 0) proto_item_set_end(tcustom_pi, tvb, offset);
    return offset;
}

void
proto_register_tcustom(void)
{
    static hf_register_info hf[] = {
        { &hf_tcustom_big_integer_small,
            { "Big Int as i64", "tcustom.big_integer.small",
                FT_INT64, BASE_DEC, NULL,
                0x0, NULL, HFILL }
        },
        { &hf_tcustom_big_integer_efficient,
            { "Binary-encoded Big Int", "tcustom.big_integer.efficient",
                FT_BYTES, BASE_NONE, NULL,
                0x0, NULL, HFILL }
        },
        { &hf_tcustom_big_integer_inefficient_bit,
            { "Big Int Bit", "tcustom.big_integer.inefficient.bit",
                FT_BOOLEAN, BASE_NONE, NULL,
                0x0, NULL, HFILL }
        },
        { &hf_tcustom_big_integer_inefficient,
            { "Bit-by-bit encoded Big Int", "tcustom.big_integer.inefficient",
                FT_NONE, BASE_NONE, NULL,
                0x0, NULL, HFILL }
        },
        { &hf_tcustom_placement_position,
            { "Insert Before", "tcustom.placement.position",
                FT_INT32, BASE_DEC, NULL,
                0x0, NULL, HFILL }
        },
        { &hf_tcustom_placement_occurrences,
            { "Nb of Insertions", "tcustom.placement.occurrences",
                FT_INT8, BASE_DEC, NULL,
                0x0, NULL, HFILL }
        },
        { &hf_tcustom_out_of_memory_exception_error_code,
            { "Error Code", "tcustom.exception.out_of_memory.error_code",
                FT_INT32, BASE_DEC, NULL,
                0x0, NULL, HFILL }
        },
        { &hf_tcustom_out_of_memory_exception_message,
            { "Message", "tcustom.exception.out_of_memory.message",
                FT_STRING, BASE_NONE, NULL,
                0x0, NULL, HFILL }
        },
        { &hf_tcustom_out_of_memory_exception,
            { "Out-of-memory Exception", "tcustom.exception.out_of_memory",
                FT_NONE, BASE_NONE, NULL,
                0x0, NULL, HFILL }
        },
        { &hf_tcustom_registration_unregister,
            { "Unregister", "tcustom.registration.unregister",
                FT_BOOLEAN, BASE_NONE, NULL,
                0x0, NULL, HFILL }
        },
        { &hf_tcustom_registration_server_name,
            { "Server Host Name", "tcustom.registration.server_name",
                FT_STRING, BASE_NONE, NULL,
                0x0, NULL, HFILL }
        },
        // Please note that all Thrift integers are signed.
        // This particular application seems to only support ports up to 32767.
        // Or maybe it does an ugly cast to unsigned but Wireshark has no way to know that.
        { &hf_tcustom_registration_port,
            { "Port Number", "tcustom.registration.port",
                FT_INT16, BASE_DEC, NULL,
                0x0, NULL, HFILL }
        },
        { &hf_tcustom_initialize_init_vector,
            { "Initialization Vector", "tcustom.initialize.init_vector",
                FT_BYTES, BASE_NONE, NULL,
                0x0, NULL, HFILL }
        },
        { &hf_tcustom_greetings_user_name,
            { "User Name", "tcustom.greetings.user_name",
                FT_STRING, BASE_NONE, NULL,
                0x0, NULL, HFILL }
        },
        { &hf_tcustom_configure_active,
            { "Is Not", "tcustom.configure.active",
                FT_INT32, BASE_DEC, VALS(tcustom_nearly_boolean_vals),
                0x0, NULL, HFILL }
        },
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
        { &hf_tcustom_set_keys_registry,
            { "Registry Configuration Keys", "tcustom.set_keys.registry",
                FT_NONE, BASE_NONE, NULL,
                0x0, NULL, HFILL }
        },
        /*{ &hf_tcustom_insert_bigint,
            { "Big Integer", "tcustom.insert.bigint",
                FT_NONE, BASE_NONE, NULL,
                0x0, NULL, HFILL }
        },*/
        { &hf_tcustom_insert_where,
            { "Where", "tcustom.insert.where",
                FT_NONE, BASE_NONE, NULL,
                0x0, NULL, HFILL }
        },
        { &hf_tcustom_ping_payload,
            { "Payload", "tcustom.ping.payload",
                FT_BYTES, BASE_NONE, NULL,
                0x0, NULL, HFILL }
        },
        { &hf_tcustom_ping_return,
            { "Return Payload", "tcustom.ping.result",
                FT_BYTES, BASE_NONE, NULL,
                0x0, NULL, HFILL }
        },
    };

    /* setup protocol subtree arrays */
    static gint* ett[] = {
        &ett_tcustom,
        &ett_tcustom_big_integer_inefficient,
        //&ett_tcustom_insert_bigint, // Not interesting for unions
        &ett_tcustom_insert_where,
        &ett_tcustom_out_of_memory_exception,
        &ett_tcustom_set_keys_registry,
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
    dissector_add_string("thrift.method_names", "registration", create_dissector_handle(dissect_tcustom_registration, proto_tcustom));
    dissector_add_string("thrift.method_names", "initialize", create_dissector_handle(dissect_tcustom_initialize, proto_tcustom));
    dissector_add_string("thrift.method_names", "greetings", create_dissector_handle(dissect_tcustom_greetings, proto_tcustom));
    dissector_add_string("thrift.method_names", "good_bye", create_dissector_handle(dissect_tcustom_good_bye, proto_tcustom));

    dissector_add_string("thrift.method_names", "configure", create_dissector_handle(dissect_tcustom_configure, proto_tcustom));
    dissector_add_string("thrift.method_names", "set_keys", create_dissector_handle(dissect_tcustom_set_keys, proto_tcustom));
    dissector_add_string("thrift.method_names", "insert", create_dissector_handle(dissect_tcustom_insert, proto_tcustom));

    dissector_add_string("thrift.method_names", "ping", create_dissector_handle(dissect_tcustom_ping, proto_tcustom));
}

/*
 * Editor modelines  -  https://www.wireshark.org/tools/modelines.html
 *
 * Local variables:
 * c-basic-offset: 4
 * tab-width: 8
 * indent-tabs-mode: nil
 * End:
 *
 * vi: set shiftwidth=4 tabstop=8 expandtab:
 * :indentSize=4:tabSize=8:noTabs=true:
 */
