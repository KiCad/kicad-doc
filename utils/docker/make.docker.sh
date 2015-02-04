#! /bin/bash
# Script to build the KiCad docs within a Docker container
#

# where the docs are pulled down to
adocRoot=/mnt/src/kicad-doc/src/asciidoc

# function build each sub directory
function makeAll {
        cd "$adocRoot/$1"
            ./make.sh all-all
}

cd "$adocRoot"

# build each sub directory
makeAll KiCad
makeAll Eeschema
makeAll IDF_Exporter
makeAll CvPcb
makeAll Getting_Started_in_KiCad
