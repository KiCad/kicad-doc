#!/bin/bash

DOC=kicad-doc-doc
DBLATEXOPTS="-P latex.output.revhistory=0 -P doc.publisher.show=0"

echo "Converting $DOC.adoc to html..."
asciidoc $DOC.adoc

echo "Converting $DOC.adoc to pdf..."
a2x -f pdf --dblatex-opts "$DBLATEXOPTS" $DOC.adoc

echo "Converting $DOC.adoc to epub..."
a2x -f epub $DOC.adoc

echo "Converting $DOC.adoc to docbook..."
a2x -f docbook $DOC.adoc

