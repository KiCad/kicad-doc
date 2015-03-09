
set( CVPCB_ADOC_SOURCES
     CvPcb.adoc )

add_custom_target( cvpcb_translate_it ALL
            ${PO4A_TRANSLATE_COMMAND} -f asciidoc -a ${CMAKE_CURRENT_SOURCE_DIR}/po/addendum.it -A utf-8 -M utf-8 -m ${CMAKE_CURRENT_SOURCE_DIR}/CvPcb.adoc -p ${CMAKE_CURRENT_SOURCE_DIR}/po/it.po -k -0 -l ${CMAKE_CURRENT_BINARY_DIR}/CvPcb.adoc )

add_custom_target( cvpcb_html ALL
                   ${ASCIIDOC_COMMAND} -b html5 ${CMAKE_CURRENT_BINARY_DIR}/CvPcb.adoc
                   DEPENDS cvpcb_translate_it )

add_custom_target( cvpcb ALL
                   DEPENDS cvpcb_html )
