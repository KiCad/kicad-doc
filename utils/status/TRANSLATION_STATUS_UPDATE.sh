#!/bin/bash

cd ../../src

DIRLIST=`ls -d */ |tr -d '/'`

OUTPUTF=../utils/status/i18n_status.csv

rm -f $OUTPUTF

echo "Manual,LANG ID,Status">$OUTPUTF

export LANG=C
export LC_ALL=C

for i in $DIRLIST
do
  #check for i18n
  if [ -e "$i/po" ]; then
    for j in $i/po/*.po
    do
      NNLANG=`basename $j .po`
      echo -n "$i, $NNLANG, " >>$OUTPUTF
      msgfmt --statistics $j 2>&1 |sed  -e 's/,/;/g' -e 's/\.//' -e 's/ messages//g'  -e 's/ message//g' -e 's/ translation//' -e 's/ translations//'  >> $OUTPUTF
      #  
      rm messages.mo
    done
  fi
done
