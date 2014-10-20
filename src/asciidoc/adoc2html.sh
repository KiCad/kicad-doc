#!/bin/bash

cd cvpcb

asciidoc --section-numbers cvpcb.adoc
#asciidoctor --section-numbers cvpcb.adoc
#a2x -d book -f xhtml --verbose cvpcb.adoc