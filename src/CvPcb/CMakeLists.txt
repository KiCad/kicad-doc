#
# Part of the KiCad ASCIIDOC Documentation Project
#
# (c)2015 KiCad Developers
# (c)2015 Brian Sidebotham <brian.sidebotham@gmail.com>
#

set( CVPCB_ADOC_SOURCES
     CvPcb.adoc )

add_custom_target( cvpcb ALL )

macro( add_adoc_pdf_target TARGET INFILE OUTFILE LANGUAGE )
    string( REPLACE "A2XOUTFILE" "${OUTFILE}" A2X_OPTIONS "${A2X_OPTIONS_BASE}" )
    add_custom_target( ${TARGET} ALL ${A2X_COMMAND} ${A2X_OPTIONS} ${INFILE} )
endmacro()

macro( add_adoc_html_target TARGET INFILE OUTFILE LANGUAGE )
  add_custom_target( ${TARGET} ALL ${ASCIIDOC_COMMAND} ${ASCIIDOC_OPTIONS} -a lang=${LANGUAGE} -o ${OUTFILE} ${INFILE} )
endmacro()

set( ASCIIDOC_OPTIONS -b html5 -a toc2 -a 'newline=\\n' --section-numbers --theme flask )
set( A2X_OPTIONS_BASE -f pdf -a 'newline=\\n' --dblatex-opts '-P latex.output.revhistory=0 -P doc.publisher.show=0 -s ${CMAKE_CURRENT_SOURCE_DIR}/../pdf-cover-dblatex.sty -o A2XOUTFILE' )
# -D ${CMAKE_CURRENT_BINARY_DIR}

# Get a list of all po translation files so we know what languages can be built
file( GLOB TRANSLATIONS RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}/po ${CMAKE_CURRENT_SOURCE_DIR}/po/*.po )


# Deal with English target differently, because it doesn't require translation
set( LANGUAGE en )

add_adoc_html_target( cvpcb_html_${LANGUAGE} ${CMAKE_CURRENT_SOURCE_DIR}/CvPcb.adoc ${CMAKE_CURRENT_BINARY_DIR}/CvPcb-${LANGUAGE}.html ${LANGUAGE} )
add_dependencies( cvpcb cvpcb_html_${LANGUAGE} )
install( FILES ${CMAKE_CURRENT_BINARY_DIR}/CvPcb-${LANGUAGE}.html DESTINATION ./CvPcb/html )

add_adoc_pdf_target( cvpcb_pdf_${LANGUAGE} ${CMAKE_CURRENT_SOURCE_DIR}/CvPcb.adoc ${CMAKE_CURRENT_BINARY_DIR}/CvPcb-${LANGUAGE}.pdf ${LANGUAGE} )
add_dependencies( cvpcb cvpcb_pdf_${LANGUAGE} )
install( FILES ${CMAKE_CURRENT_BINARY_DIR}/CvPcb-${LANGUAGE}.pdf DESTINATION ./CvPcb/pdf )

foreach( LANGUAGE ${TRANSLATIONS} )

    string( SUBSTRING "${LANGUAGE}" 0 2 LANGUAGE )

    add_custom_target( cvpcb_translate_${LANGUAGE} ALL
            ${PO4A_TRANSLATE_COMMAND} -f asciidoc -a ${CMAKE_CURRENT_SOURCE_DIR}/po/addendum.${LANGUAGE} -A utf-8 -M utf-8 -m ${CMAKE_CURRENT_SOURCE_DIR}/CvPcb.adoc -p ${CMAKE_CURRENT_SOURCE_DIR}/po/${LANGUAGE}.po -k -0 -l ${CMAKE_CURRENT_BINARY_DIR}/CvPcb-${LANGUAGE}.adoc )

    add_adoc_html_target( cvpcb_html_${LANGUAGE}
            ${CMAKE_CURRENT_BINARY_DIR}/CvPcb-${LANGUAGE}.adoc
            ${CMAKE_CURRENT_BINARY_DIR}/CvPcb-${LANGUAGE}.html
            ${LANGUAGE} )

    add_dependencies( cvpcb_html_${LANGUAGE} cvpcb_translate_${LANGUAGE} )
    add_dependencies( cvpcb cvpcb_html_${LANGUAGE} )

    install( FILES ${CMAKE_CURRENT_BINARY_DIR}/CvPcb-${LANGUAGE}.html DESTINATION ./CvPcb/html )

    add_adoc_pdf_target( cvpcb_pdf_${LANGUAGE}
            ${CMAKE_CURRENT_BINARY_DIR}/CvPcb-${LANGUAGE}.adoc
            ${CMAKE_CURRENT_BINARY_DIR}/CvPcb-${LANGUAGE}.pdf
            ${LANGUAGE} )

    add_dependencies( cvpcb_pdf_${LANGUAGE} cvpcb_translate_${LANGUAGE} )
    add_dependencies( cvpcb cvpcb_pdf_${LANGUAGE} )

    install( FILES ${CMAKE_CURRENT_BINARY_DIR}/CvPcb-${LANGUAGE}.pdf DESTINATION ./CvPcb/pdf )

endforeach()

# Copy the images folder to the binary build directory such that the
# translation can be easily previewed after it's been built
file( COPY ${CMAKE_CURRENT_SOURCE_DIR}/images
      DESTINATION ${CMAKE_CURRENT_BINARY_DIR} )

install( DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/images DESTINATION ./CvPcb/html )
