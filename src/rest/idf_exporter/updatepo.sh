#!/bin/bash

DOCNAME=`grep master_doc source/conf.py|tr -d \\'\\'\\ |sed -e 's/master_doc=//'` ; #echo \"$DOCNAME\" ; exit #Debug
LANGUAGES=$(ls -1 -x source/locale/)

#####################
# i18n
#####################

#To extract messages to translate. Create build/locale/docname.pot
make gettext
#that does simply a:
#sphinx-build -b gettext -d build/doctrees source build/locale

#Added to conf.py
#locale_dirs = ['locale/'] # path is example but recommended

#Create/Update
for i in $LANGUAGES ; do
  msgmerge -U source/locale/$i/LC_MESSAGES/$DOCNAME.po build/locale/$DOCNAME.pot
#  sphinx-intl -c source/conf.py update -p build/locale -d source/locale -l $i
done

#Check
for i in $LANGUAGES ; do
  sphinx-intl -c source/conf.py stat -d source/locale -l $i
done

#Build .mo files: always update compiled .po gettext files
sphinx-intl -c source/conf.py build -d source/locale

