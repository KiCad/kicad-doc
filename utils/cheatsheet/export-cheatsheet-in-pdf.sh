#!/bin/bash

cd ../../src/cheatsheet

for III in *.svg
do
  CHEATNAME=`basename $III .svg`
  inkscape --without-gui --file=${CHEATNAME}.svg  --export-pdf=$CHEATNAME.pdf
done