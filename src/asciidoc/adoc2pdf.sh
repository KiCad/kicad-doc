#!/bin/bash

cd cvpcb

#a2x -fpdf -v cvpcb.adoc
#a2x -fpdf --fop -v cvpcb.adoc
#asciidoctor-pdf -v --section-numbers cvpcb.adoc

for i in *.adoc
do
  echo "Executing: a2x -fpdf -v $i"
  a2x -fpdf -v $i
done