#!/bin/bash

./adoc2docbook.sh


cd cvpcb

#pandoc -f docbook -t odt -o cvpcb.odt cvpcb.xml

for i in *.xml
do
  echo "Executing: pandoc -f docbook -t odt -o cvpcb.odt $i"
  pandoc -f docbook -t odt -o cvpcb.odt $i
done