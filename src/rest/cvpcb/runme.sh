#!/bin/bash

#Note: created source/_static to eliminate a warning message.
#mkdir source/_static

#To create html
#make -e html
#make -e SPHINXOPTS="-D html_logo=images/10000201000003200000022675E94B31.png" html
#make --dry-run -e SPHINXOPTS="-D html_logo=images/10000201000003200000022675E94B31.png" html

#To create pdf
#make latexpdf
make -e SPHINXOPTS="-D latex_logo=images/10000201000003200000022675E94B31.png -D latex_paper_size=a4" latexpdf
make -e SPHINXOPTS="-D latex_logo=images/10000201000003200000022675E94B31.png -D language=it -D latex_paper_size=a4" BUILDDIR="build-it" latexpdf
make -e SPHINXOPTS="-D latex_logo=images/10000201000003200000022675E94B31.png -D language=fr -D latex_paper_size=a4" BUILDDIR="build-fr" latexpdf
# ... equivalent to
#sphinx-build -b latex -d build/doctrees -D latex_paper_size=a4 -D latex_logo=images/10000201000003200000022675E94B31.png source build/latex
#make -C build/latex all-pdf

#To create epub
#make epub
#make -e SPHINXOPTS="epub_cover = ('_static/cover.png', '') epub
#make -e SPHINXOPTS="-D epub_cover=\('images/10000201000003200000022675E94B31.png', ''\)" epub

#To create CHM
#make htmlhelp

#####################
# i18n
#####################

#To extract messages to translate. Create build/locale/docname.pot
#make --dry-run gettext
#To extract messages to translate. Create source/catalog/docname.pot
#sphinx-build -b gettext -d build/doctrees source source/catalog

#Added to conf.py
#locale_dirs = ['locale/'] # path is example but recommended
#or added manually to the sphinx-intl command:

#Create
#sphinx-intl -c source/conf.py update -p source/catalog -d source/locale -l it 

#Check
#sphinx-intl -c source/conf.py stat -d source/locale -l it 

#Build .mo files: always update compiled .po gettext files
sphinx-intl -c source/conf.py build -d source/locale

#export SPHINXINTL_LANGUAGE=it
#Build nationalized html
make -e SPHINXOPTS="-D html_logo=images/10000201000003200000022675E94B31.png" html
make -e SPHINXOPTS="-D language='it' -D html_logo=images/10000201000003200000022675E94B31.png" BUILDDIR="build-it" html
make -e SPHINXOPTS="-D language='fr' -D html_logo=images/10000201000003200000022675E94B31.png" BUILDDIR="build-fr" html
##
#sphinx-build -a -b html -d build/doctrees -D language=it -D locale_dirs=['./locale'] -D html_logo=images/10000201000003200000022675E94B31.png source build/html
#sphinx-build -a -b html -d build/doctrees                -D html_logo=images/10000201000003200000022675E94B31.png source build/html
#sphinx-build -a -b html -d build/doctrees -D language=it -D html_logo=images/10000201000003200000022675E94B31.png source build/html-it
#sphinx-build -a -b html -d build/doctrees -D language=fr -D html_logo=images/10000201000003200000022675E94B31.png source build/html-fr

#Then
#cd build/locale/
#cp cvpcb.po it.po
#...translate...then:

#To create translated messages catalogs
#msgfmt "it.po" -o "it.mo"

#cd ../..

#install it.mo "source/locale/it/LC_MESSAGES/it.mo"

rm -R build/doctrees
