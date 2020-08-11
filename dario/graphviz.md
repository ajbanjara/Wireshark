# Wireshark's components graph

Cmake can automatically generate a *.dot* file describing its components and their relations. To generate the file, just run

    cmake . --graphviz=wireshark.dot

within the build directory. The output file can then be rendered with one of the graphviz applications (dot, neato, circo, fdp, etc.)

## Examples

Here follow some examples of outputs got with the main graphviz renderes:

### fdp

[![attachment:fdp.png](uploads/__moin_import__/attachments/dario/graphviz/fdp.png "attachment:fdp.png")](uploads/__moin_import__/attachments/dario/graphviz/fdp.png "{{attachment:fdp.png||width=800}}")

### dot

[![attachment:dot.png](uploads/__moin_import__/attachments/dario/graphviz/dot.png "attachment:dot.png")](uploads/__moin_import__/attachments/dario/graphviz/dot.png "{{attachment:dot.png||width=800}}")

### circo

[![attachment:circo.png](uploads/__moin_import__/attachments/dario/graphviz/circo.png "attachment:circo.png")](uploads/__moin_import__/attachments/dario/graphviz/circo.png "{{attachment:circo.png||width=800}}")

### neato

[![attachment:neato.png](uploads/__moin_import__/attachments/dario/graphviz/neato.png "attachment:neato.png")](uploads/__moin_import__/attachments/dario/graphviz/neato.png "{{attachment:neato.png||width=800}}")

---

Imported from https://wiki.wireshark.org/dario/graphviz on 2020-08-11 23:12:28 UTC
