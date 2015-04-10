
set( CVPCB_ADOC_SOURCES
     CvPcb.adoc )

add_custom_target( cvpcb ALL )

set( ASCIIDOC_OPTIONS -b html5 -a toc2 -a 'newline=\\n' --section-numbers --theme flask )
set( A2X_OPTIONS -f pdf -a 'newline=\\n' --dblatex-opts '-P latex.output.revhistory=0 -P doc.publisher.show=0 -s ${CMAKE_CURRENT_SOURCE_DIR}/../pdf-cover-dblatex.sty' )
# -D ${CMAKE_CURRENT_BINARY_DIR}

# Get a list of all po translation files so we know what languages can be built
file( GLOB TRANSLATIONS RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}/po ${CMAKE_CURRENT_SOURCE_DIR}/po/*.po )


# Deal with English target differently, because it doesn't require translation
set( LANGUAGE en )
add_custom_target( cvpcb_html_en ALL
                   ${ASCIIDOC_COMMAND} ${ASCIIDOC_OPTIONS} -a lang=${LANGUAGE} -o ${CMAKE_CURRENT_BINARY_DIR}/CvPcb-${LANGUAGE}.html ${CMAKE_CURRENT_SOURCE_DIR}/CvPcb.adoc )

add_custom_target( cvpcb_pdf_en ALL
                   ${A2X_COMMAND} ${A2X_OPTIONS} ${CMAKE_CURRENT_SOURCE_DIR}/CvPcb.adoc )

install( FILES ${CMAKE_CURRENT_BINARY_DIR}/CvPcb-${LANGUAGE}.html DESTINATION ./CvPcb/pdf )

add_dependencies( cvpcb cvpcb_html_en )
add_dependencies( cvpcb cvpcb_pdf_en )

foreach( LANGUAGE ${TRANSLATIONS} )
    
    string( SUBSTRING "${LANGUAGE}" 0 2 LANGUAGE )

    add_custom_target( cvpcb_translate_${LANGUAGE} ALL
            ${PO4A_TRANSLATE_COMMAND} -f asciidoc -a ${CMAKE_CURRENT_SOURCE_DIR}/po/addendum.${LANGUAGE} -A utf-8 -M utf-8 -m ${CMAKE_CURRENT_SOURCE_DIR}/CvPcb.adoc -p ${CMAKE_CURRENT_SOURCE_DIR}/po/${LANGUAGE}.po -k -0 -l ${CMAKE_CURRENT_BINARY_DIR}/CvPcb-${LANGUAGE}.adoc )

    add_custom_target( cvpcb_html_${LANGUAGE} ALL
                   ${ASCIIDOC_COMMAND} ${ASCIIDOC_OPTIONS} -a lang=${LANGUAGE} -o ${CMAKE_CURRENT_BINARY_DIR}/CvPcb-${LANGUAGE}.html ${CMAKE_CURRENT_BINARY_DIR}/CvPcb-${LANGUAGE}.adoc
                   DEPENDS cvpcb_translate_${LANGUAGE} )

    add_custom_target( cvpcb_pdf_${LANGUAGE} ALL
                   ${A2X_COMMAND} ${A2X_OPTIONS} ${CMAKE_CURRENT_BINARY_DIR}/CvPcb-${LANGUAGE}.adoc
                   DEPENDS cvpcb_translate_${LANGUAGE} )

    install( FILES ${CMAKE_CURRENT_BINARY_DIR}/CvPcb-${LANGUAGE}.html DESTINATION ./CvPcb/html )
    install( FILES ${CMAKE_CURRENT_BINARY_DIR}/CvPcb-${LANGUAGE}.pdf DESTINATION ./CvPcb/pdf )

    add_dependencies( cvpcb cvpcb_html_${LANGUAGE} )
    add_dependencies( cvpcb cvpcb_pdf_${LANGUAGE} )

endforeach()

# Copy the images folder to the binary build directory such that the
# translation can be easily previewed after it's been built
file( COPY ${CMAKE_CURRENT_SOURCE_DIR}/images
      DESTINATION ${CMAKE_CURRENT_BINARY_DIR} )

install( DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/images DESTINATION ./CvPcb/html )
