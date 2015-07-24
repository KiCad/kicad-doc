#
# Part of the KiCad ASCIIDOC Documentation Project
#
# (c)2015 KiCad Developers
# (c)2015 Brian Sidebotham <brian.sidebotham@gmail.com>
#

add_subdirectory( CvPcb )
add_subdirectory( Eeschema )
add_subdirectory( GerbView )
add_subdirectory( Getting_Started_in_KiCad )
add_subdirectory( IDF_Exporter )
add_subdirectory( KiCad )
add_subdirectory( Pcbnew )
add_subdirectory( Pl_Editor )
add_subdirectory( GUI_Translation_HOWTO )

KiCadDocumentation( webdocindex ) # PDF output won't be as useful as HTML
