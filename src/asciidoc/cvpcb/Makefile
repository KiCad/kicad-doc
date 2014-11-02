DOCNAME:=cvpcb

.PHONY: pot
pot: po/$(DOCNAME).pot

po/$(DOCNAME).pot: $(DOCNAME).adoc
	po4a-gettextize -f asciidoc -M utf-8 -m $^ -p $@

.PHONY: po
po: pot
	for i in `cat po/LINGUAS` ; do \
	  po4a-updatepo -f asciidoc -M utf-8 -m $(DOCNAME).adoc -p po/$$i.po ; \
	done

.PHONY: adoc
adoc: po
	for i in `cat po/LINGUAS` ; do \
	  po4a-translate -f asciidoc -M utf-8 -m $(DOCNAME).adoc -p po/$$i.po -k 0 -l $(DOCNAME)_$$i.adoc ; \
	done

.PHONY: html
html: adoc
	asciidoc -a 'newline=\n' --section-numbers $(DOCNAME).adoc ; \
	for i in `cat po/LINGUAS` ; do \
	  asciidoc -a 'newline=\n' -a lang=$$i --section-numbers $(DOCNAME)_$$i.adoc ; \
	done

.PHONY: docbook
docbook: adoc
	asciidoc -a 'newline=\n' -b docbook --section-numbers $(DOCNAME).adoc ; \
	for i in `cat po/LINGUAS` ; do \
	  asciidoc -a 'newline=\n' -a lang=$$i -b docbook --section-numbers $(DOCNAME)_$$i.adoc ; \
	done

.PHONY: pdf
pdf: adoc
	a2x -a 'newline=\n' -fpdf -v $(DOCNAME).adoc --dblatex-opts "-P latex.output.revhistory=0" ; \
	for i in `cat po/LINGUAS` ; do \
	  a2x  -a 'newline=\n' -a lang=$$i -fpdf -v $(DOCNAME)_$$i.adoc --dblatex-opts "-P latex.output.revhistory=0" ; \
	done

.PHONY: odt
odt: docbook
	for i in *.xml ; do \
	  y=`basename $$i .xml` ; \
	  pandoc -f docbook -t odt -o $$y.odt $$i ; \
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
