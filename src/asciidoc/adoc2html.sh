#!/bin/bash

cd cvpcb

#asciidoc --section-numbers cvpcb.adoc
#asciidoctor --section-numbers cvpcb.adoc
#a2x -d book -f xhtml --verbose cvpcb.adoc

for i in *.adoc
do
    echo "Executing: asciidoc --section-numbers $i"
    asciidoc --section-numbers $i
done
