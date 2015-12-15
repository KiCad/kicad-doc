#############################
#
# General Makefile for multiformat/multilanguage
# automatic asciidoc documentation generation.
# This file should be kept as general as possible.
#
# Copyright (C) 2014 Free Software Foundation, Inc.
# This file under the GNU GPL version 3 or later.
#
#############################

SCRIPTSBASEDIR:=../../utils/old-build-scripts

#It takes the dir name as project name, and the doc title.
#expect the asciidoc main doc being of the same name 
#(i.e. ThisDirName.adoc)
DOCNAME:= $(shell basename `pwd`)

#Get doc title
DOCTITLE:= $(shell echo $(DOCNAME)|sed -e 's/_/ /')

#Translated files source dir
PODIR:=po

#Get list of languages from the list of .po files
LANGUAGES:= $(shell if [ -d "$(PODIR)" ]; then cd $(PODIR) ; ls -1 *.po|sed -e 's/\.po//'; fi)

#Get list of generated chapters translated files
DOCTRANSLATED:= $(foreach trans, $(LANGUAGES), $(wildcard $(DOCNAME)*-$(trans).adoc)) 

#Get list of chapter files
DOCCHAPTERS:= $(filter-out $(DOCTRANSLATED), $(wildcard $(DOCNAME)_*.adoc))

#DOCCHAPTERS:=$(wildcard $(DOCNAME)_*.adoc)

#I like HTML in Unix style text
ASCIIDOCVAR:= -a 'newline=\n' -v

#Uncomment this to debug pdflatex
DEBUGPDFLTX:= -d

#I like left side html toc
UTOC:= $(shell if [ -z "$$TOC2" ] ; then echo -n "-a toc2" ; fi )

#disabling some unuseful print and added custom dblatex style to generate a nice cover image
DBLATEXOPTS="-P latex.output.revhistory=0 -P doc.publisher.show=0 -s $(SCRIPTSBASEDIR)/pdf-cover-dblatex.sty $(DEBUGPDFLTX)"
.SUFFIXES: #Disabe implicit rules


.PHONY: help
help:
	@echo "Void or invalid target. Use one of:"
	@echo "  pot        to build the english strings catalog .pot file"
	@echo "  $(PODIR)/NN.po   to build/update the single language NN i18n strings .po file"
#	@echo "  po-NN      to build/update the single language NN i18n strings .po file"
	@echo "  po-all     to update all languages i18n strings .po files"
	@echo "  adoc-all   to build all the i18n asciidoc files"
	@echo "  html       to make a standard (english) HTML file"
#	@echo "  html-NN    to make the single language NN i18n html file"
	@echo "  html-all   to make all i18n HTML files"
	@echo "  pdf        to make a standard (english) pdf file"
#	@echo "  pdf-NN     to make the single language NN i18n pdf file"
	@echo "  pdf-all    to make internationalized pdf files"
	@echo "  odt        to make a standard (english) odt file"
#	@echo "  odt-NN     to make the single language NN i18n odt file"
	@echo "  odt-all    to make internationalized odt files"
	@echo "  epub       to make a standard (english) epub file"
#	@echo "  epub-NN    to make the single language NN i18n epub file"
	@echo "  epub-all   to make internationalized epub files"
	@echo "  all        to make all of the above (english)"
	@echo "  all-all    to make all of the above"
	@echo ""
	@echo "Please use this Makefile inside the project dir."
	@echo "Default html has a side toc, to disable: export TOC2=no (or any other string) ; make html"
#	@echo ""
#	@echo "MAKEFILE DEBUG:"
#	@echo ""
#	@echo "DOCTITLE: $(DOCTITLE)"
#	@echo "LANGUAGES: $(LANGUAGES)"
#	@echo "DOTRANSLATED: $(DOCTRANSLATED)"
#	@echo "DOCCHAPTERS: $(DOCCHAPTERS)"


.PHONY: pot
pot: $(PODIR)/$(DOCNAME).pot

$(PODIR)/$(DOCNAME).pot: $(DOCNAME).adoc $(foreach l,$(DOCCHAPTERS), $(l))
	po4a-gettextize -f asciidoc -M utf-8 -m $(DOCNAME).adoc $(foreach pot,$(DOCCHAPTERS),-m $(pot)) -p $@

#Build/update the single language NN i18n strings .po file
#$(PODIR)/%.po: $(DOCNAME).adoc #Single file dependency
$(PODIR)/%.po: $(DOCNAME).adoc $(foreach l,$(DOCCHAPTERS), $(l))
	@touch $(DOCNAME).adoc
	@po4a-updatepo -f asciidoc -v -M utf-8 -m $(DOCNAME).adoc $(foreach l,$(DOCCHAPTERS),-m $(l)) -p $@

.PHONY: po-all
po-all: $(foreach i,$(LANGUAGES),$(PODIR)/$(i).po)

#.PHONY: $(foreach i,$(LANGUAGES),po-$(i))
#.PHONY: it.po
#po-%: $(PODIR)/%.po
#po-it: $(PODIR)/it.po

#$(foreach i,$(LANGUAGES),po-$(i): $(PODIR)/$(i).po)

################ I18N ASCIIDOC

#Make the single language NN i18n file
$(DOCNAME)-%.adoc: $(PODIR)/%.po $(DOCNAME).adoc $(PODIR)/addendum.%
	po4a-translate -f asciidoc -a $(PODIR)/addendum.$* -A utf-8 -M utf-8 -m $(DOCNAME).adoc -p $(PODIR)/$*.po -k 0 -l $@ ; #translate master doc
	sed -i -e 's/include::$(DOCNAME)_\(.*\)\.adoc/include::$(DOCNAME)_\1-$*.adoc/' $(DOCNAME)-$*.adoc      #fix translated include files
	$(foreach l, $(DOCCHAPTERS) , po4a-translate -f asciidoc -A utf-8 -M utf-8 -m $(l) -p $(PODIR)/$*.po -k 0 -l $(shell basename -s .adoc $(l))-$*.adoc ; ) #translate chapter files

.PHONY: adoc-all
adoc-all: $(foreach i,$(LANGUAGES),$(DOCNAME)-$(i).adoc)

################ HTML

#English html
$(DOCNAME).html: $(DOCNAME).adoc $(DOCCHAPTERS)
	asciidoc $(UTOC) $(ASCIIDOCVAR) --theme flask --section-numbers $(DOCNAME).adoc ;

#I18n html
$(DOCNAME)-%.html: $(DOCNAME)-%.adoc
	asciidoc $(UTOC) $(ASCIIDOCVAR) --theme flask --section-numbers -a lang=$* $(DOCNAME)-$*.adoc ;

.PHONY: html
html: $(DOCNAME).html

.PHONY: html-all
html-all: html $(foreach i,$(LANGUAGES),$(DOCNAME)-$(i).html)

################ DOCBOOK

#English docbook
$(DOCNAME).xml: $(DOCNAME).adoc $(DOCCHAPTERS)
	asciidoc -b docbook $(ASCIIDOCVAR) --section-numbers $(DOCNAME).adoc

#I18n docbook
$(DOCNAME)-%.xml: $(DOCNAME)-%.adoc
	asciidoc -b docbook $(ASCIIDOCVAR) --section-numbers -a lang=$* $(DOCNAME)-$*.adoc

.PHONY: docbook
docbook: $(DOCNAME).xml

.PHONY: docbook-all
docbook-all: docbook $(DOCNAME).xml $(foreach i,$(LANGUAGES),$(DOCNAME)-$(i).xml)

################ PDF

#English pdf
$(DOCNAME).pdf: $(DOCNAME).adoc $(DOCCHAPTERS)
	a2x -f pdf $(ASCIIDOCVAR) --dblatex-opts $(DBLATEXOPTS) $(DOCNAME).adoc

#Japanese pdf
DBLATEXOPTS-JA="-b xetex -p ../../xsl/dblatex-pdf-ja.xsl -P latex.output.revhistory=0 -P doc.publisher.show=0 -s $(SCRIPTSBASEDIR)/pdf-cover-dblatex.sty $(DEBUGPDFLTX)"
$(DOCNAME)-ja.pdf: $(DOCNAME)-ja.adoc
	echo "Note: To make japanese pdf, you need to install fonts-vlgothic (like: sudo apt-get install fonts-vlgothic)."
	a2x -f pdf $(ASCIIDOCVAR) -a lang=ja --dblatex-opts $(DBLATEXOPTS-JA) $(DOCNAME)-ja.adoc

#I18n pdf
$(DOCNAME)-%.pdf: $(DOCNAME)-%.adoc
	a2x -f pdf $(ASCIIDOCVAR) -a lang=$* --dblatex-opts $(DBLATEXOPTS) $(DOCNAME)-$*.adoc

.PHONY: pdf
pdf: $(DOCNAME).pdf

.PHONY: pdf-all
pdf-all: pdf $(foreach i,$(LANGUAGES),$(DOCNAME)-$(i).pdf)

################ EPUB

#Build cover docinfo
$(DOCNAME)-docinfo.xml:
	$(shell sed -e 's/DOCTITLE/$(DOCTITLE)/' $(SCRIPTSBASEDIR)/epub-cover-docinfo-template.xml > $(DOCNAME)-docinfo.xml)

#	cp $(SCRIPTSBASEDIR)/epub-cover-docinfo-template-new.xml $(DOCNAME)-docinfo.xml


#Build i18n cover docinfo
$(DOCNAME)-%-docinfo.xml:
	$(shell sed -e 's/DOCTITLE/$(DOCTITLE)/' $(SCRIPTSBASEDIR)/epub-cover-docinfo-template.xml > $(DOCNAME)-$*-docinfo.xml)
#	cp $(SCRIPTSBASEDIR)/epub-cover-docinfo-template-new.xml $(DOCNAME)-$*-docinfo.xml

#English epub
$(DOCNAME).epub: $(DOCNAME).adoc $(DOCCHAPTERS) $(DOCNAME)-docinfo.xml
	a2x -f epub -a docinfo $(DOCNAME).adoc
#	rm $(DOCNAME)-docinfo.xml

#I18n epub
$(DOCNAME)-%.epub: $(DOCNAME)-%.adoc $(DOCNAME)-%-docinfo.xml
	a2x -f epub -a lang=$* -a docinfo $(DOCNAME)-$*.adoc

.PHONY: epub
epub: $(DOCNAME).epub

.PHONY: epub-all
epub-all: epub $(foreach i,$(LANGUAGES),$(DOCNAME)-$(i).epub)

################ ODT

#English odt
$(DOCNAME).odt: $(DOCNAME).xml
	pandoc -t odt -f docbook -o $(DOCNAME).odt $(DOCNAME).xml

#I18n odt
$(DOCNAME)-%.odt: $(DOCNAME)-%.xml
	pandoc -t odt -f docbook -o $(DOCNAME)-$*.odt $(DOCNAME)-$*.xml

.PHONY: odt
odt: $(DOCNAME).odt

.PHONY: odt-all
odt-all: odt $(foreach i,$(LANGUAGES),$(DOCNAME)-$(i).odt)

################ ALL

.PHONY: all
all: html pdf odt epub

.PHONY: all-all
all-all: adoc-all html-all pdf-all odt-all epub-all

################

.PHONY: clean
clean:
#Delete generated output
	rm -f $(DOCNAME).pdf
	rm -f $(DOCNAME).html
	rm -f $(DOCNAME).xml
	rm -f $(DOCNAME).epub
	rm -rf $(DOCNAME)*.epub.d
	rm -f $(DOCNAME)-docinfo.xml
	rm -f $(DOCNAME).odt
	rm -f $(foreach i,$(LANGUAGES),$(DOCNAME)*-$(i).*)
