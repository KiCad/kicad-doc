#!/bin/bash

#Usage:
#    po4a-updatepo -f *fmt* (-m *master.docE*)+ (-p *XX.po*)+
#
#    (*XX.po* are the outputs, all others are inputs)

cd cvpcb

for i in `cat po/LINGUAS`
do
  echo "Executing: po4a-updatepo -f asciidoc -M utf-8 -m cvpcb.adoc -p po/$i.po"
  po4a-updatepo -f asciidoc -M utf-8 -m cvpcb.adoc -p po/$i.po
done