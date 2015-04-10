
set( CVPCB_ADOC_SOURCES
     CvPcb.adoc )

add_custom_target( cvpcb ALL )

# Get a list of all po translation files so we know what languages can be built
file( GLOB TRANSLATIONS RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}/po ${CMAKE_CURRENT_SOURCE_DIR}/po/*.po )


# Deal with English target differently, because it doesn't require translation
set( LANGUAGE en )
add_custom_target( cvpcb_html_en ALL
                   ${ASCIIDOC_COMMAND} -b html5 -o ${CMAKE_CURRENT_BINARY_DIR}/CvPcb-${LANGUAGE}.html ${CMAKE_CURRENT_SOURCE_DIR}/CvPcb.adoc )

install( FILES ${CMAKE_CURRENT_BINARY_DIR}/CvPcb-${LANGUAGE}.html DESTINATION ./CvPcb )

add_dependencies( cvpcb cvpcb_html_en )

foreach( LANGUAGE ${TRANSLATIONS} )
    
    string( SUBSTRING "${LANGUAGE}" 0 2 LANGUAGE )

    add_custom_target( cvpcb_translate_${LANGUAGE} ALL
            ${PO4A_TRANSLATE_COMMAND} -f asciidoc -a ${CMAKE_CURRENT_SOURCE_DIR}/po/addendum.${LANGUAGE} -A utf-8 -M utf-8 -m ${CMAKE_CURRENT_SOURCE_DIR}/CvPcb.adoc -p ${CMAKE_CURRENT_SOURCE_DIR}/po/${LANGUAGE}.po -k -0 -l ${CMAKE_CURRENT_BINARY_DIR}/CvPcb-${LANGUAGE}.adoc )

    add_custom_target( cvpcb_html_${LANGUAGE} ALL
                   ${ASCIIDOC_COMMAND} -b html5 -o ${CMAKE_CURRENT_BINARY_DIR}/CvPcb-${LANGUAGE}.html ${CMAKE_CURRENT_BINARY_DIR}/CvPcb-${LANGUAGE}.adoc
                   DEPENDS cvpcb_translate_${LANGUAGE} )

    install( FILES ${CMAKE_CURRENT_BINARY_DIR}/CvPcb-${LANGUAGE}.html DESTINATION ./CvPcb )

    add_dependencies( cvpcb cvpcb_html_${LANGUAGE} )

endforeach()

# Copy the images folder to the binary build directory such that the
# translation can be easily previewed after it's been built
file( COPY ${CMAKE_CURRENT_SOURCE_DIR}/images
      DESTINATION ${CMAKE_CURRENT_BINARY_DIR} )

install( DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/images DESTINATION ./CvPcb )
