#!/bin/bash

cd cvpcb

#asciidoc  -a 'newline=\n' -b docbook  --section-numbers  cvpcb.adoc
#asciidoctor  -a 'newline=\n' -b docbook  --section-numbers  cvpcb.adoc

for i in *.adoc
do
    echo "Executing: asciidoc  -a 'newline=\n' -b docbook  --section-numbers $i"
    asciidoc  -a 'newline=\n' -b docbook  --section-numbers $i
done
