#!/bin/bash

DOC=kicad-doc-doc

echo "Converting $DOC.adoc to html..."
asciidoc $DOC.adoc

echo "Converting $DOC.adoc to pdf..."
a2x -f pdf  $DOC.adoc

echo "Converting $DOC.adoc to epub..."
a2x -f epub $DOC.adoc

echo "Converting $DOC.adoc to docbook..."
a2x -f docbook $DOC.adoc

