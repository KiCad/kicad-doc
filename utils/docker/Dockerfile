FROM ubuntu:utopic

RUN apt-get update
RUN apt-get -y install git make cmake asciidoc pandoc gettext po4a dblatex texlive-xetex fonts-vlgothic source-highlight texlive-lang-*

WORKDIR /mnt/kicad-doc
CMD mkdir -p build && cd build && cmake .. && make
