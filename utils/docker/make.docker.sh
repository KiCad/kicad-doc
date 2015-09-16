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
makeAll cvpcb
makeAll eeschema
makeAll gerbview
makeAll getting_started_in_kicad
makeAll idf_exporter
makeAll interactive_router
makeAll kicad
makeAll pcbnew
makeAll pl_editor
