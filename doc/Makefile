DOCNAME:=README
DBLATEXOPTS="-P latex.output.revhistory=0 -P doc.publisher.show=0"
.SUFFIXES: #Disabe implicit rules

.PHONY: help
help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  html       to make a standard HTML file"
	@echo "  pdf        to make a standard pdf file"
	@echo "  docbook    to make a standard docbook file"
	@echo "  odt        to make a standard odt file"
	@echo "  epub       to make a standard epub file"
	@echo "  all        to make all of the above "
	@echo ""
	@echo "To create html side toc, just prepend: export TOC2='-a toc2' ; make html"


$(DOCNAME).html: $(DOCNAME).adoc
	asciidoc $(TOC2) -a 'newline=\n' --section-numbers $(DOCNAME).adoc ;

.PHONY: html
html: $(DOCNAME).html

$(DOCNAME).xml: $(DOCNAME).adoc
	asciidoc -a 'newline=\n' -b docbook --section-numbers $(DOCNAME).adoc

.PHONY: docbook
docbook: $(DOCNAME).xml

$(DOCNAME).pdf: $(DOCNAME).adoc
	a2x -fpdf $(DOCNAME).adoc --dblatex-opts $(DBLATEXOPTS)

.PHONY: pdf
pdf: $(DOCNAME).pdf

$(DOCNAME).epub: $(DOCNAME).adoc
	a2x -fepub $(DOCNAME).adoc

.PHONY: epub
epub: $(DOCNAME).epub

$(DOCNAME).odt: $(DOCNAME).xml
	pandoc -f docbook -t odt -o $(DOCNAME).odt $(DOCNAME).xml

.PHONY: odt
odt: $(DOCNAME).odt

.PHONY: all
all: html pdf odt epub 

.PHONY: clean
clean:
	rm -f $(DOCNAME).pdf
	rm -f $(DOCNAME).html
	rm -f $(DOCNAME).xml
	rm -f $(DOCNAME).epub
	rm -f $(DOCNAME).odt
