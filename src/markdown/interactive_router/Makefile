DOCNAME:=interactive_router
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
	@echo "  md-all     to build all the i18n markdown files"
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

.PHONY: pot
pot: $(PODIR)/$(DOCNAME).pot

$(PODIR)/$(DOCNAME).pot: $(DOCNAME).md
	po4a-gettextize -f text -o markdown -M utf-8 -m $^ -p $@


#Build/update the single language NN i18n strings .po file
$(PODIR)/%.po: $(DOCNAME).md
	@po4a-updatepo -f text -o markdown -v -M utf-8 -m $(DOCNAME).md -p $@

.PHONY: po-all
po-all: $(foreach i,$(LANGUAGES),$(PODIR)/$(i).po)

#.PHONY: $(foreach i,$(LANGUAGES),po-$(i))
#.PHONY: it.po
#po-%: $(PODIR)/%.po
#po-it: $(PODIR)/it.po

#$(foreach i,$(LANGUAGES),po-$(i): $(PODIR)/$(i).po)

################ I18N ASCIIDOC

#Make the single language NN i18n file
#For the options of this command see:
#https://po4a.alioth.debian.org/man/man3/Locale::Po4a::Text.3pm.php
# or man Locale::Po4a::Text
$(DOCNAME)-%.md: $(PODIR)/%.po $(DOCNAME).md
	po4a-translate -f text -o markdown -M utf-8 -m $(DOCNAME).md -p $(PODIR)/$*.po -k 0 -l $@

.PHONY: md-all
md-all: $(foreach i,$(LANGUAGES),$(DOCNAME)-$(i).md)

################ HTML

#English html
$(DOCNAME).html: $(DOCNAME).md
	pandoc -s --toc -f markdown -t html $(DOCNAME).md -o $(DOCNAME).html ;

.PHONY: html
html: $(DOCNAME).html

#I18n html
$(DOCNAME)-%.html: $(DOCNAME)-%.md
	pandoc -s --toc -f markdown -t html -V lang=$* $(DOCNAME)-$*.md -o $(DOCNAME)-$*.html

.PHONY: html-all
html-all: html $(foreach i,$(LANGUAGES),$(DOCNAME)-$(i).html)

################ DOCBOOK

#English docbook
$(DOCNAME).xml: $(DOCNAME).md
	pandoc -s --toc -f markdown -t docbook $(DOCNAME).md -o $(DOCNAME).xml

#I18n docbook
$(DOCNAME)-%.xml: $(DOCNAME)-%.md
	pandoc -s --toc -V lang=$* -f markdown -t docbook $(DOCNAME)-$*.md -o $(DOCNAME)-$*.xml

.PHONY: docbook
docbook: $(DOCNAME).xml

.PHONY: docbook-all
docbook-all: docbook $(DOCNAME).xml $(foreach i,$(LANGUAGES),$(DOCNAME)-$(i).xml)

################ PDF

.PHONY: pdf
pdf: $(DOCNAME).pdf


#English pdf
$(DOCNAME).pdf: $(DOCNAME).md
	pandoc -s --toc -f markdown -t latex $(DOCNAME).md -o $(DOCNAME).pdf

#I18n pdf
$(DOCNAME)-%.pdf: $(DOCNAME)-%.md
	pandoc -s --toc -V lang=italian -f markdown -t latex $(DOCNAME)-$*.md -o $(DOCNAME)-$*.pdf

.PHONY: pdf-all
pdf-all: pdf $(foreach i,$(LANGUAGES),$(DOCNAME)-$(i).pdf)

################ EPUB

#English epub
$(DOCNAME).epub: $(DOCNAME).md
	pandoc -s --toc -t epub $(DOCNAME).md -o $(DOCNAME).epub

#I18n epub
$(DOCNAME)-%.epub: $(DOCNAME)-%.md
	pandoc -s --toc -V lang=italian -f markdown -t epub $(DOCNAME)-$*.md -o $(DOCNAME)-$*.epub

.PHONY: epub
epub: $(DOCNAME).epub

.PHONY: epub-all
epub-all: epub $(foreach i,$(LANGUAGES),$(DOCNAME)-$(i).epub)

################ ODT

.PHONY: odt
odt: $(DOCNAME).odt

#English odt
$(DOCNAME).odt: $(DOCNAME).md
	pandoc -s --toc -f markdown -t odt -o $(DOCNAME).odt $(DOCNAME).md

#I18n odt
$(DOCNAME)-%.odt: $(DOCNAME)-%.md
	pandoc  -V lang=italian -s --toc -f markdown -t odt -o $(DOCNAME)-$*.odt $(DOCNAME)-$*.md

.PHONY: odt-all
odt-all: odt $(foreach i,$(LANGUAGES),$(DOCNAME)-$(i).odt)


################ ALL

.PHONY: all
all: html pdf odt epub 

.PHONY: all-all
all-all: md-all html-all pdf-all odt-all epub-all


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
