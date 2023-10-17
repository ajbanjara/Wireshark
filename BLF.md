[[_TOC_]]

# Vector BLF Format

BLF, short for Binary Logging File, is the file format which is output by [Vector Informatik](https://www.vector.com/) CANoe and CANalyzer software. It consists of a file header and one or more log containers, each of which can contain one or more log objects. Containers may be compressed with ZLib.

The Bitbucket repo [tobylorenz/vector_blf](https://bitbucket.org/tobylorenz/vector_blf/) was used as a reference for supporting this proprietary format.