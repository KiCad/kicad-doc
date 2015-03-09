
set( EESCHEMA_ADOC_SOURCES Eeschema.adoc )

add_custom_target( eeschema_translate_it ALL
            ${PO4A_TRANSLATE_COMMAND} -f asciidoc -a ${CMAKE_CURRENT_SOURCE_DIR}/po/addendum.it -A utf-8 -M utf-8 -m ${CMAKE_CURRENT_SOURCE_DIR}/Eeschema.adoc -p ${CMAKE_CURRENT_SOURCE_DIR}/po/it.po -k -0 -l ${CMAKE_CURRENT_BINARY_DIR}/Eeschema.adoc )

add_custom_target( eeschema_html ALL
                   ${ASCIIDOC_COMMAND} -b html5 ${CMAKE_CURRENT_BINARY_DIR}/Eeschema.adoc
                   DEPENDS eeschema_translate_it
                   WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} )

add_custom_target( eeschema ALL
                   DEPENDS eeschema_html )
