#
# (c)2015 KiCad-Developers
# (c)2015 Brian Sidebotham
#
# Part of the KiCad project
#

unset( ASCIIDOCTORPDF_FOUND )
unset( _DEBUG )
set( _DBG OFF )

# Attempt to execute the ASCIIDOCTORPDF utility
execute_process( COMMAND asciidoctor-pdf --version
                 RESULT_VARIABLE _ADOC_EXE_RESULT
                 OUTPUT_VARIABLE _ADOC_EXE_OUTPUT
                 ERROR_VARIABLE _ADOC_EXE_ERROR )

set( ASCIIDOCTORPDF_COMMAND "ASCIIDOCTORPDF" )

if( _DBG )
    message( STATUS "ASCIIDOCTORPDF result: ${_ADOC_EXE_RESULT}" )
    message( STATUS "ASCIIDOCTORPDF outut: ${_ADOC_EXE_OUTPUT}" )
endif()

if( NOT "${_ADOC_EXE_RESULT}" STREQUAL "0" )
    # Attempt to see if a bat file can be run which invokes ASCIIDOCTORPDF
    execute_process( COMMAND asciidoctor-pdf.bat --version
                 RESULT_VARIABLE _ADOC_EXE_RESULT
                 OUTPUT_VARIABLE _ADOC_EXE_OUTPUT
                 ERROR_VARIABLE _ADOC_EXE_ERROR )

    set( ASCIIDOCTORPDF_COMMAND "asciidoctor-pdf.bat" )

    if( NOT "${_ADOC_EXE_RESULT}" STREQUAL "0" )
        set( ASCIIDOCTORPDF_FOUND FALSE )
    else()
        set( ASCIIDOCTORPDF_FOUND TRUE )
    endif()
else()
    set( ASCIIDOCTORPDF_FOUND TRUE )
endif()

if( ASCIIDOCTORPDF_FOUND )
    # Get the asciidoctor-pdf version number...
    string( REGEX MATCH "[0-9]+\\.[0-9]+\\.[0-9]+" ADOC_VERSION "${_ADOC_EXE_OUTPUT}" )
    message( STATUS "ASCIIDOCTORPDF Found v${ADOC_VERSION}" )
else()
    message( STATUS "ASCIIDOCTORPDF NOT FOUND" )
endif()

macro( asciidoctor_pdf ARGS )

endmacro()
