DOCNAME:=cvpcb
DBLATEXOPTS="-P latex.output.revhistory=0 -P doc.publisher.show=0"

.PHONY: help
help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  pot        to build the english strings catalog .pot file"
	@echo "  po-all     to build/update the i18n strings .po files"
	@echo "  adoc-all   to build/update the i18n asciidoc files"
	@echo "  html       to make a standard (english) HTML file"
	@echo "  html-all   to make internationalized HTML files"
	@echo "  pdf        to make a standard (english) pdf file"
	@echo "  pdf-all    to make internationalized pdf files"
	@echo "  odt        to make a standard (english) odt file"
	@echo "  odt-all    to make internationalized odt files"

.PHONY: pot
pot: po/$(DOCNAME).pot

po/$(DOCNAME).pot: $(DOCNAME).adoc
	po4a-gettextize -f asciidoc -M utf-8 -m $^ -p $@

.PHONY: po-all
po-all: pot
	for i in `cat po/LINGUAS` ; do \
	  po4a-updatepo -f asciidoc -M utf-8 -m $(DOCNAME).adoc -p po/$$i.po ; \
	done

.PHONY: adoc-all
adoc-all: po
	for i in `cat po/LINGUAS` ; do \
	  po4a-translate -f asciidoc -M utf-8 -m $(DOCNAME).adoc -p po/$$i.po -k 0 -l $(DOCNAME)_$$i.adoc ; \
	done

#English html
.PHONY: html
html:
	asciidoc -a 'newline=\n' --section-numbers $(DOCNAME).adoc

#Internationalized html
.PHONY: html-all 
html-all: adoc-all html
	for i in `cat po/LINGUAS` ; do \
	  asciidoc -a 'newline=\n' -a lang=$$i --section-numbers $(DOCNAME)_$$i.adoc ; \
	done

.PHONY: docbook
docbook:
	asciidoc -a 'newline=\n' -b docbook --section-numbers $(DOCNAME).adoc

.PHONY: docbook-all
docbook-all: adoc-all docbook
	for i in `cat po/LINGUAS` ; do \
	  asciidoc -a 'newline=\n' -a lang=$$i -b docbook --section-numbers $(DOCNAME)_$$i.adoc ; \
	done

.PHONY: pdf
pdf:
	a2x -a 'newline=\n' -fpdf -v $(DOCNAME).adoc --dblatex-opts $(DBLATEXOPTS)

.PHONY: pdf-all
pdf-all: adoc-all pdf
	for i in `cat po/LINGUAS` ; do \
	  a2x  -a 'newline=\n' -a lang=$$i -fpdf -v $(DOCNAME)_$$i.adoc --dblatex-opts $(DBLATEXOPTS) ; \
	done

.PHONY: odt
odt: docbook
	pandoc -f docbook -t odt -o $(DOCNAME).odt $(DOCNAME).xml

.PHONY: odt-all
odt-all: docbook-all odt
	for i in `cat po/LINGUAS` ; do \
	  pandoc -f docbook -t odt -o $(DOCNAME)_$$i.odt $(DOCNAME)_$$i.xml ; \
	done

.PHONY: clean
clean:
	rm -f *_*.*
	rm -f po/cvpcb.pot
	rm -f po/*.po\~
	rm -f cvpcb.pdf
	rm -f cvpcb.html
	rm -f cvpcb.xml
	rm -f cvpcb.epub
	rm -f cvpcb.odt
