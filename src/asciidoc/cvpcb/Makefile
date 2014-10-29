DOCNAME:=cvpcb

pot: po/$(DOCNAME).pot

po/$(DOCNAME).pot: $(DOCNAME).adoc
	po4a-gettextize -f asciidoc -M utf-8 -m $^ -p $@

po: pot
	for i in `cat po/LINGUAS` ; do \
	  po4a-updatepo -f asciidoc -M utf-8 -m $(DOCNAME).adoc -p po/$$i.po ; \
	done

adoc: po
	for i in `cat po/LINGUAS` ; do \
	  po4a-translate -f asciidoc -M utf-8 -m $(DOCNAME).adoc -p po/$$i.po -k 0 -l $(DOCNAME)_$$i.adoc ; \
	done

html: adoc
	for i in *.adoc ; do \
	  asciidoc --section-numbers $$i ; \
	done

docbook: adoc
	for i in *.adoc ; do \
	  asciidoc -a 'newline=\\\n' -b docbook --section-numbers $$i ; \
	done

pdf: adoc
	for i in *.adoc ; do \
	  a2x -fpdf -v $$i ; \
	done

odt: docbook
	for i in *.xml ; do \
	  pandoc -f docbook -t odt -o $(DOCNAME).odt $$i ; \
	done


.PHONY: clean
clean:
	rm -f *_*.*
	rm -f po/cvpcb.pot
	rm -f cvpcb.pdf
	rm -f cvpcb.html
	rm -f cvpcb.xml
	rm -f cvpcb.epub
	rm -f cvpcb.odt
