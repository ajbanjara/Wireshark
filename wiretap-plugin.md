# Wiretap plugin

It is possible to write a wiretap plugin, ie a plugin that will enable wireshark to read a new file format. If you have modified the wiretap to add a new file format, and you want to compile that as a plugin, add the following part in your wiretap file:

    #include "file_wrappers.h"
    
    /* wtap stuff */
    
    static int wf_myFileType = -1;
    
    int encap_myFileType = -1;
    
    
    /* Register with wtap */
    void wtap_register_myFileType(void) {
    
            static struct file_type_info fi =
            { "My File Type", "myFileType", "*.myfiletype", NULL, TRUE, NULL,NULL };
    
            wtap_register_open_routine(myFileType_open,TRUE); // open routine in wiretap
    
            encap_myFileType = wtap_register_encap_type("My File Type","myFileType");
            wf_myFileType =  wtap_register_file_type(&fi);
    
            g_warning("Register");
    }

Then in the dissector file, the dissector should register to the wiretap file handle

    void proto_reg_handoff_myDissector(void)
    {
        gboolean init = FALSE;
    
        if (init == FALSE)
        {
          dissector_handle_t myDissector_handle;
    
          myDissector_handle = find_dissector("myDissector");
    
          dissector_add("wtap_encap", encap_myFileType, myDissector_handle);
    
          init = TRUE;
        }
    }

A change must also be makde to your plugin's Makefile.am to allow the registration routines to be included in plugin.c. The plugin type must be changed from "plugin" to "plugin\_wtap" as shown in the following example.

    plugin.c: $(DISSECTOR_SRC) $(top_srcdir)/tools/make-dissector-reg \
        $(top_srcdir)/tools/make-dissector-reg.py
            @if test -n "$(PYTHON)"; then \
                    echo Making plugin.c with python ; \
                    $(PYTHON) $(top_srcdir)/tools/make-dissector-reg.py $(srcdir) \
                        plugin_wtap $(DISSECTOR_SRC) ; \
            else \
                    echo Making plugin.c with shell script ; \
                    $(top_srcdir)/tools/make-dissector-reg $(srcdir) \
                        $(plugin_src) plugin_wtap $(DISSECTOR_SRC) ; \
            fi

This change creates an additional stanza in plugin.c:

    G_MODULE_EXPORT void
    register_wtap_module(void)
    {
      {extern void wtap_register_myFileType (void); wtap_register_myFileType ();}
    }

---

Imported from https://wiki.wireshark.org/wiretap%20plugin on 2020-08-11 23:27:36 UTC
