DOCNAME:=cvpcb
PODIR:=po
#Get list of languages from the list of .po files
LANGUAGES:= $(shell cd $(PODIR) ; ls -1 *.po|sed -e 's/\.po//')
DBLATEXOPTS="-P latex.output.revhistory=0 -P doc.publisher.show=0"
.SUFFIXES: #Disabe implicit rules


.PHONY: help
help:
	@echo "Please use \`make <target>' where <target> is one of"
#	@echo "  pot        to build the english strings catalog .pot file"
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
	@echo "To create html side toc, just prepend: export TOC2='-a toc2' ; make html"


#.PHONY: pot
#pot: $(PODIR)/$(DOCNAME).pot

#$(PODIR)/$(DOCNAME).pot: $(DOCNAME).adoc
#	po4a-gettextize -f asciidoc -M utf-8 -m $^ -p $@

#Build/update the single language NN i18n strings .po file
$(PODIR)/%.po: $(DOCNAME).adoc
	@po4a-updatepo -f asciidoc -v -M utf-8 -m $(DOCNAME).adoc -p $@

.PHONY: po-all
po-all: $(foreach i,$(LANGUAGES),$(PODIR)/$(i).po)

#.PHONY: $(foreach i,$(LANGUAGES),po-$(i))
#.PHONY: it.po
#po-%: $(PODIR)/%.po
#po-it: $(PODIR)/it.po

#$(foreach i,$(LANGUAGES),po-$(i): $(PODIR)/$(i).po)

################ I18N ASCIIDOC

#Make the single language NN i18n file
$(DOCNAME)-%.adoc: $(PODIR)/%.po $(DOCNAME).adoc
	po4a-translate -f asciidoc -M utf-8 -m $(DOCNAME).adoc -p $(PODIR)/$*.po -k 0 -l $@

.PHONY: adoc-all
adoc-all: $(foreach i,$(LANGUAGES),$(DOCNAME)-$(i).adoc)

################ HTML

#English html
$(DOCNAME).html: $(DOCNAME).adoc
	asciidoc $(TOC2) -a 'newline=\n' --section-numbers $(DOCNAME).adoc ;

#I18n html
$(DOCNAME)-%.html: $(DOCNAME)-%.adoc
	asciidoc $(TOC2) -a 'newline=\n' -a lang=$* --section-numbers $(DOCNAME)-$*.adoc ;

.PHONY: html
html: $(DOCNAME).html

.PHONY: html-all
html-all: html $(foreach i,$(LANGUAGES),$(DOCNAME)-$(i).html)

################ DOCBOOK

#English docbook
$(DOCNAME).xml: $(DOCNAME).adoc
	asciidoc -a 'newline=\n' -b docbook --section-numbers $(DOCNAME).adoc

#I18n docbook
$(DOCNAME)-%.xml: $(DOCNAME)-%.adoc
	asciidoc -a 'newline=\n' -a lang=$* -b docbook --section-numbers $(DOCNAME)-$*.adoc

.PHONY: docbook
docbook: $(DOCNAME).xml

.PHONY: docbook-all
docbook-all: docbook $(DOCNAME).xml $(foreach i,$(LANGUAGES),$(DOCNAME)-$(i).xml)

################ PDF

#English pdf
$(DOCNAME).pdf: $(DOCNAME).adoc
	a2x -fpdf $(DOCNAME).adoc --dblatex-opts $(DBLATEXOPTS)

#I18n pdf
$(DOCNAME)-%.pdf: $(DOCNAME)-%.adoc
	a2x -a lang=$* -fpdf --dblatex-opts $(DBLATEXOPTS) $(DOCNAME)-$*.adoc

.PHONY: pdf
pdf: $(DOCNAME).pdf

.PHONY: pdf-all
pdf-all: pdf $(foreach i,$(LANGUAGES),$(DOCNAME)-$(i).pdf)

################ EPUB

#English epub
$(DOCNAME).epub: $(DOCNAME).adoc
	a2x -fepub $(DOCNAME).adoc

#I18n pdf
$(DOCNAME)-%.epub: $(DOCNAME)-%.adoc
	a2x -a lang=$* -fepub $(DOCNAME)-$*.adoc

.PHONY: epub
epub: $(DOCNAME).epub

.PHONY: epub-all
epub-all: epub $(foreach i,$(LANGUAGES),$(DOCNAME)-$(i).epub)

################ ODT

#English odt
$(DOCNAME).odt: $(DOCNAME).xml
	pandoc -f docbook -t odt -o $(DOCNAME).odt $(DOCNAME).xml

#I18n odt
$(DOCNAME)-%.odt: $(DOCNAME)-%.xml
	pandoc -f docbook -t odt -o $(DOCNAME)-$*.odt $(DOCNAME)-$*.xml ; \

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
	rm -f $(DOCNAME)-*.*
#	rm -f $(PODIR)/cvpcb.pot
	rm -f $(PODIR)/*.po\~
	rm -f $(DOCNAME).pdf
	rm -f $(DOCNAME).html
	rm -f $(DOCNAME).xml
	rm -f $(DOCNAME).epub
	rm -f $(DOCNAME).odt
