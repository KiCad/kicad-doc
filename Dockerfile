FROM kicadeda/kicad-doc-builder-base:latest as doc-build-env

WORKDIR /src
COPY . .

RUN mkdir -p build
WORKDIR /src/build
RUN cmake -DBUILD_FORMATS="pdf;epub" ../
RUN make

FROM scratch as output-image

COPY --from=doc-build-env /src/build/src /src