#
# Part of the KiCad ASCIIDOC Documentation Project
#
# (c)2015 KiCad Developers
# (c)2015 Brian Sidebotham <brian.sidebotham@gmail.com>
#

# Add the cvpcb documentation target
add_custom_target( cvpcb ALL )

# Get a list of all po translation files so we know what languages can be built
file( GLOB TRANSLATIONS RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}/po ${CMAKE_CURRENT_SOURCE_DIR}/po/*.po )

# Add English to the translations, but we'll have to treat it as a special case
# when generating a translation target
list( APPEND TRANSLATIONS en )

foreach( LANGUAGE ${TRANSLATIONS} )

    string( SUBSTRING "${LANGUAGE}" 0 2 LANGUAGE )

    if( "${LANGUAGE}" MATCHES "en" )
        # No need to translate, so just make a renamed copy of the source instead such
        # that we have the same source target as every other language
        # This is made a target so that changes are reflected on subsequent builds!
        add_custom_target( cvpcb_translate_${LANGUAGE} ALL
            COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/CvPcb.adoc
            ${CMAKE_CURRENT_BINARY_DIR}/CvPcb-${LANGUAGE}.adoc )
    else()
        add_custom_target( cvpcb_translate_${LANGUAGE} ALL
            ${PO4A_COMMAND}-translate -f asciidoc -a ${CMAKE_CURRENT_SOURCE_DIR}/po/addendum.${LANGUAGE} -A utf-8 -M utf-8 -m ${CMAKE_CURRENT_SOURCE_DIR}/CvPcb.adoc -p ${CMAKE_CURRENT_SOURCE_DIR}/po/${LANGUAGE}.po -k -0 -l ${CMAKE_CURRENT_BINARY_DIR}/CvPcb-${LANGUAGE}.adoc )
    endif()

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
