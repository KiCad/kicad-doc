#!/bin/bash

dir-list () {
  ls -l $1 | awk '/^d/ {print $9}'
}

update-po () {
  pushd ../../src/$1
  if [ -d po ]; then
    make -f ../../utils/old-build-scripts/Makefile po-all
  fi
  popd
}

for i in `dir-list ../../src`
do
  update-po $i
done
