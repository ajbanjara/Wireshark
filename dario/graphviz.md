# Wireshark's components graph

Cmake can automatically generate a *.dot* file describing its components and their relations. To generate the file, just run

    cmake . --graphviz=wireshark.dot

within the build directory. The output file can then be rendered with one of the graphviz applications (dot, neato, circo, fdp, etc.)

## Examples

Here follow some examples of outputs got with the main graphviz renderes:

### fdp

![fdp.png](/uploads/__moin_import__/attachments/dario/graphviz/fdp.png "fdp.png")

### dot

![dot.png](/uploads/__moin_import__/attachments/dario/graphviz/dot.png "dot.png")

### circo

![circo.png](/uploads/__moin_import__/attachments/dario/graphviz/circo.png "circo.png")

### neato

![neato.png](/uploads/__moin_import__/attachments/dario/graphviz/neato.png "neato.png")

---

Imported from https://wiki.wireshark.org/dario/graphviz on 2020-08-11 23:12:28 UTC
