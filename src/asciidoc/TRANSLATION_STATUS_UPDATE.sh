#!/bin/bash

DIRLIST=`ls -d */ |tr -d '/'`

OUTPUTF=i18n_status.csv

rm -f $OUTPUTF

echo "Manual,LANG ID,Status">$OUTPUTF

export LANG=C
export LC_ALL=C

for i in $DIRLIST
do
  for j in $i/po/*.po
  do
    NNLANG=`basename $j .po`
    echo -n "$i, $NNLANG, " >>$OUTPUTF
    msgfmt --use-fuzzy --statistics $j 2>&1 |sed  -e 's/,/;/g' -e 's/\.//' -e 's/ messages//g'  -e 's/ message//g' -e 's/ translation//' -e 's/ translations//'  >> $OUTPUTF
    #  
    rm messages.mo
  done
done
