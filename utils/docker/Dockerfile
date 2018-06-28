FROM ubuntu:bionic

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get -y install git make cmake asciidoc pandoc gettext po4a dblatex texlive-xetex fonts-vlgothic source-highlight texlive-lang-english texlive-lang-french texlive-lang-italian texlive-lang-japanese texlive-lang-european texlive-lang-polish fonts-freefont-ttf texlive-lang-cyrillic texlive-lang-german texlive-lang-other texlive-lang-spanish texlive-lang-chinese

WORKDIR /mnt/kicad-doc
CMD mkdir -p build && cd build && cmake .. && make
