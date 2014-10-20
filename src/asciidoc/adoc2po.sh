#!/bin/bash

#po4a-gettextize 
#Usage:
#    po4a-gettextize -f *fmt* -m *master.doc* [-l *XX.doc*] -p *XX.po*
#
#    (*XX.po* is the output, all others are inputs)

cd cvpcb

po4a-gettextize -f asciidoc -M utf-8 -m cvpcb.adoc -p po/cvpcb.pot
