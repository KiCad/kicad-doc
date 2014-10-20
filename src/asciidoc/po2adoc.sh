#!/bin/bash

# Usage:
#     po4a-translate -f *fmt* -m *master.doc* -p *XX.po* -l *XX.doc*
#
#     (*XX.doc* is the output, all others are inputs)

cd cvpcb

po4a-translate -f asciidoc -M utf-8 -m cvpcb.adoc -p po/it.po -k 0 -l internat/cvpcb_it.adoc
