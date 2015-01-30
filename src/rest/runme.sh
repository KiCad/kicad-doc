#!/bin/bash

###################
#
# Use this script inside doc dir!!!!
#
###################

DOCNAME=`grep master_doc source/conf.py|tr -d "\' " |sed -e 's/master_doc=//'` # ; echo -n \"$DOCNAME\" ; exit #Debug
LANGUAGES=$(ls -1 -x source/locale/)

#Note: created source/_static to eliminate a warning message.
if [ ! -d "source/_static" ]; then
  mkdir source/_static
fi

#To create html
make -e SPHINXOPTS="-D html_logo=images/kicad_logo.png" html

#To create pdf
make -e SPHINXOPTS="-D latex_logo=images/kicad_logo.png -D latex_paper_size=a4" latexpdf

#To create epub
#make epub
#Epub cover does not work ...
#make -e SPHINXOPTS="epub_cover = ('_static/cover.png', '') epub
#make -e SPHINXOPTS="-D epub_cover=\('images/kicad_logo.png', ''\)" epub

#To create CHM
#make htmlhelp

#Clean build cache
rm -R build/doctrees

#####################
# i18n
#####################

#Added to conf.py to make i18n work...
#locale_dirs = ['locale/'] 

#To extract messages to translate. Create source/catalog/docname.pot
make gettext
#that does simply a:
#sphinx-build -b gettext -d build/doctrees source source/catalog

#Then install build/locale/$DOCNAME.pot source/$LANGUAGE/LC_MESSAGES/$DOCNAME.po
#...translate...then:

#Create/Update
for i in $LANGUAGES ; do
  #To create fuzzy msgs
  msgmerge -U source/locale/$i/LC_MESSAGES/$DOCNAME.po source/catalog/$DOCNAME.pot 
  #Disabled: sphinx does not support fuzzy msgs yet
  #sphinx-intl -c source/conf.py update -p source/catalog -d source/locale -l $i 
done

#Check
for i in $LANGUAGES ; do
  sphinx-intl -c source/conf.py stat -d source/locale -l $i
done

#Build .mo files: always update compiled .po gettext files
sphinx-intl -c source/conf.py build -d source/locale
#Same as:
#cd source/locale/$LANGUAGE/LC_MESSAGES/
#msgfmt "it.po" -o "it.mo"

#Build nationalized html
for i in $LANGUAGES ; do
  make -e SPHINXOPTS="-D language='$i' -D html_logo=images/kicad_logo.png" BUILDDIR="build-$i" html
done

#Build nationalized pdf
for i in $LANGUAGES ; do
  make -e SPHINXOPTS="-D latex_logo=images/kicad_logo.png -D language=$i -D latex_paper_size=a4" BUILDDIR="build-$i" latexpdf
done

#Build nationalized epub
#for i in $LANGUAGES ; do
#  make -e SPHINXOPTS="-D language=$i" BUILDDIR="build-$i" epub
#done

#Clean nationalized build cache
for i in $LANGUAGES ; do
  rm -R build-$i/doctrees
done
