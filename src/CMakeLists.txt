#
# Part of the KiCad ASCIIDOC Documentation Project
#
# (c)2015 KiCad Developers
# (c)2015 Brian Sidebotham <brian.sidebotham@gmail.com>
#

add_custom_target( updatepo_all )

file( GLOB ALLPO RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/*/po/*.po )

foreach( PO ${ALLPO} )
    string( REGEX REPLACE ".*/+po/+([a-z][a-z]).po" "\\1" LANG "${PO}" )
    list( APPEND LANGS "${LANG}" )
endforeach()

list( REMOVE_DUPLICATES LANGS )
list( SORT LANGS )

foreach( LANG ${LANGS} )
    add_custom_target( updatepo_${LANG} )
endforeach()

add_subdirectory( cvpcb )
add_subdirectory( eeschema )
add_subdirectory( gerbview )
add_subdirectory( getting_started_in_kicad )
add_subdirectory( idf_exporter )
add_subdirectory( kicad )
add_subdirectory( pcbnew )
add_subdirectory( plugins )
add_subdirectory( pl_editor )
add_subdirectory( gui_translation_howto )

