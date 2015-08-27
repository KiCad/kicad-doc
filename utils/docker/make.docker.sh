#! /bin/bash
# Script to build the KiCad docs within a Docker container
#

# where the docs are pulled down to
adocRoot=/mnt/src/kicad-doc/src

# function build each sub directory
function makeAll {
        cd "$adocRoot/$1"
            export TOC2='-a toc2' #Set side toc for HTML
            ./make.sh all-all
}

cd "$adocRoot"

# build each sub directory
makeAll CvPcb
makeAll Eeschema
makeAll GerbView
makeAll Getting_Started_in_KiCad
makeAll IDF_Exporter
makeAll Interactive_Router
makeAll KiCad
makeAll Pcbnew
makeAll Pl_Editor
