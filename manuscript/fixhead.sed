#!/bin/sed -f
# Remove stray formatting
/^\*\*\*\* *$/d
/^\*\* *$/d
/^__ *$/d
# Fix level 2 headings
s/^\*\*\(.*\)\*\* *$/## \1/
s/^  \* \*\*\(.*\)\*\* *$/## \1/
# Fix level 3 headings
s/^  \* _\(.*\)_ *$/### \1/
s/^  \*   \*   \* _\(.*\)_ *$/### \1/
