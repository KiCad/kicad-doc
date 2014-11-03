#!/bin/bash

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
#make -e SPHINXOPTS="epub_cover = ('_static/cover.png', '') epub
#make -e SPHINXOPTS="-D epub_cover=\('images/kicad_logo.png', ''\)" epub

#To create CHM
#make htmlhelp

#Clean build cache
rm -R build/doctrees

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

#Build nationalized html
for i in `cat source/LINGUAS` ; do
  make -e SPHINXOPTS="-D language='$i' -D html_logo=images/kicad_logo.png" BUILDDIR="build-$i" html
done

#Build nationalized pdf
for i in `cat source/LINGUAS` ; do
  make -e SPHINXOPTS="-D latex_logo=images/kicad_logo.png -D language=$i -D latex_paper_size=a4" BUILDDIR="build-$i" latexpdf
done

#Then
#cd build/locale/
#cp cvpcb.po it.po
#...translate...then:

#To create translated messages catalogs
#msgfmt "it.po" -o "it.mo"

#cd ../..

#install it.mo "source/locale/it/LC_MESSAGES/it.mo"

#Clean nationalized build cache
for i in `cat source/LINGUAS` ; do
  rm -R build-$i/doctrees
done
