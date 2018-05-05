#
# Part of the KiCad ASCIIDOC Documentation Project
#
# (c)2015 KiCad Developers
# (c)2015 Brian Sidebotham <brian.sidebotham@gmail.com>
#

# Variables used to keep lists of program arguments
set( ASCIIDOC_OPTIONS "" )
set( A2X_OPTIONS "" )

set( DBLATEX_OPTIONS "" )
set( FOP_OPTIONS "" )

# Add an asciidoc to PDF conversion target
macro( add_adoc_pdf_target TARGET INFILE OUTFILE LANGUAGE )
    # Make a local copy of the list so we can add the output file to the end of the option list
    set( _A2X_OPTIONS ${A2X_OPTIONS} )

    # When using DBLATEX, pass the output file on to dblatex
    if( "${PDF_GENERATOR}" MATCHES "DBLATEX" )
        # Convert semi-colon separated list to space separated string
        string( REPLACE ";" " " DBLATEX_OPTIONS_STRING "${DBLATEX_OPTIONS}" )
        set( DBLATEX_OPTIONS_STRING "${DBLATEX_OPTIONS_STRING} -o ${OUTFILE}" )
        list( APPEND _A2X_OPTIONS -a lang=${LANGUAGE} --dblatex-opts "${DBLATEX_OPTIONS_STRING}" )
    endif()

    # When using FOP, pass the -D option to pass the output directory
    if( "${PDF_GENERATOR}" MATCHES "FOP" )

        # a2x uses the -pdf option of fop already so there's no use in
        # trying to change the output filename, see:
        # https://groups.google.com/forum/#!topic/asciidoc/CXU_XnDlM5w

        #string( REPLACE ";" " " FOP_OPTIONS_STRING "${FOP_OPTIONS}" )
        #set( FOP_OPTIONS_STRING "${FOP_OPTIONS_STRING} -pdf ${OUTFILE}" )
        #list( APPEND _A2X_OPTIONS --fop-opts "${FOP_OPTIONS_STRING}" )

        list( APPEND _A2X_OPTIONS -a lang=${LANGUAGE} )


        # No need to add the -D option to A2X because the translated "source"
        # now ends up in the same directory as the PDF output

        #get_filename_component( _OUTPUT_DIR "${OUTFILE}" DIRECTORY )
        #list( APPEND _A2X_OPTIONS -D "${_OUTPUT_DIR}" )
    endif()

    add_custom_target( ${TARGET} DEPENDS ${OUTFILE} )
    add_custom_command( OUTPUT ${OUTFILE}
                        COMMAND ${A2X_COMMAND} ${_A2X_OPTIONS} ${INFILE}
                        DEPENDS ${INFILE} )
endmacro()

# Add an asciidoc to HTML conversion target
macro( add_adoc_html_target TARGET INFILE OUTFILE LANGUAGE )
    add_custom_target( ${TARGET} DEPENDS ${OUTFILE} )
    add_custom_command( OUTPUT ${OUTFILE}
                        COMMAND ${ASCIIDOC_COMMAND} ${ASCIIDOC_OPTIONS} ${LANGUAGE_OPTIONS} -o ${OUTFILE} ${INFILE}
                        DEPENDS ${INFILE} )
endmacro()

# Add an asciidoc to EPUB conversion target
macro( add_adoc_epub_target TARGET INFILE OUTFILE LANGUAGE )
    set( TITLE "${TARGET}" )
    string(REGEX REPLACE "_epub_.." "" DOCINFO_OUT "${LANGUAGE}/${TARGET}-docinfo.xml" )
    configure_file( ${CMAKE_SOURCE_DIR}/CMakeSupport/epub-cover-docinfo-template.xml # Prepare cover docinfo
                    ${DOCINFO_OUT} )
    set( _A2X_OPTIONS ${A2X_OPTIONS} )
    list( APPEND _A2X_OPTIONS -f epub -a docinfo -a lang=${LANGUAGE} )
    add_custom_target( ${TARGET} DEPENDS ${OUTFILE} )
    add_custom_command( OUTPUT ${OUTFILE}
                        COMMAND ${A2X_COMMAND} ${_A2X_OPTIONS} ${INFILE}
                        DEPENDS ${INFILE} )
endmacro()

# Pass an option to asciidoc
macro( add_adoc_option )
    foreach( OPT ${ARGN} )
        list( APPEND ASCIIDOC_OPTIONS ${OPT} )
    endforeach()
endmacro()

# Pass an option to a2x
macro( add_a2x_option )
    foreach( OPT ${ARGN} )
        list( APPEND A2X_OPTIONS ${OPT} )
    endforeach()
endmacro()

# Pass an option to DBLATEX through a2x
macro( add_dblatex_option )
    foreach( OPT ${ARGN} )
        list( APPEND DBLATEX_OPTIONS ${OPT} )
    endforeach()
endmacro()

# Pass an option to FOP through a2x
macro( add_fop_option )
    message( WARNING "TODO: Support --fop-opts when fop options are required!" )
    foreach( OPT ${ARGN} )
        list( APPEND FOP_OPTIONS ${OPT} )
    endforeach()
endmacro()
