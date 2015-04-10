#
# (c)2015 KiCad-Developers
# (c)2015 Brian Sidebotham
#
# Part of the KiCad project
#

unset( ASCIIDOC_FOUND )
unset( _DEBUG )
set( _DBG OFF )

# Try to use CMake's standard way of finding programs...
find_program( ASCIIDOC_COMMAND asciidoc )

if( NOT ASCIIDOC_COMMAND )

    # Attempt to execute the asciidoc utility
    set( ASCIIDOC_COMMAND "asciidoc" )
    set( A2X_COMMAND "a2x" )
    
    execute_process( COMMAND ${ASCIIDOC_COMMAND} --version
                     RESULT_VARIABLE _ADOC_EXE_RESULT
                     OUTPUT_VARIABLE _ADOC_EXE_OUTPUT
                     ERROR_VARIABLE _ADOC_EXE_ERROR )

    if( _DBG )
        message( STATUS "asciidoc result: ${_ADOC_EXE_RESULT}" )
        message( STATUS "asciidoc outut: ${_ADOC_EXE_OUTPUT}" )
    endif()

    if( NOT "${_ADOC_EXE_RESULT}" STREQUAL "0" )
        # Attempt to see if a bat file can be run which invokes asciidoc
        # A lot of windows users need this "bodge" in order to allow asciidoc
        # to be run with the asciidoc command as python doesn't usually
        # register .py as an executable file type
        set( ASCIIDOC_COMMAND "asciidoc.bat" )
        set( A2X_COMMAND "a2x.bat" )

        execute_process( COMMAND ${ASCIIDOC_COMMAND} --version
                RESULT_VARIABLE _ADOC_EXE_RESULT
                OUTPUT_VARIABLE _ADOC_EXE_OUTPUT
                ERROR_VARIABLE _ADOC_EXE_ERROR )

        if( NOT "${_ADOC_EXE_RESULT}" STREQUAL "0" )
            # Finally, check we can use the supplied asciidoc version
            set( ASCIIDOC_COMMAND python ${PROJECT_SOURCE_DIR}/CMakeSupport/asciidoc/asciidoc.py )
            set( A2X_COMMAND python ${PROJECT_SOURCE_DIR}/CMakeSupport/asciidoc/a2x.py )

            execute_process( COMMAND ${ASCIIDOC_COMMAND} --version
                    RESULT_VARIABLE _ADOC_EXE_RESULT
                    OUTPUT_VARIABLE _ADOC_EXE_OUTPUT
                    ERROR_VARIABLE _ADOC_EXE_ERROR )

            if( NOT "${_ADOC_EXE_RESULT}" STREQUAL "0" )
                set( ASCIIDOC_FOUND FALSE )
            else()
                set( ASCIIDOC_FOUND TRUE )
            endif()
        else()
            set( ASCIIDOC_FOUND TRUE )
        endif()
    else()
        set( ASCIIDOC_FOUND TRUE )
    endif()
else()
    find_program( A2X_COMMAND a2x )
    set( ASCIIDOC_FOUND TRUE )
endif()

if( ASCIIDOC_FOUND )
    # Get the ASCIIDOC version number...
    execute_process( COMMAND ${ASCIIDOC_COMMAND} --version
            RESULT_VARIABLE _ADOC_EXE_RESULT
            OUTPUT_VARIABLE _ADOC_EXE_OUTPUT
            ERROR_VARIABLE _ADOC_EXE_ERROR )

    string( REGEX MATCH "[0-9]+\\.[0-9]+\\.[0-9]+" ADOC_VERSION "${_ADOC_EXE_OUTPUT}" )
    message( STATUS "Asciidoc Found ${ASCIIDOC_COMMAND} v${ADOC_VERSION}" )
else()
    message( STATUS "Asciidoc NOT FOUND" )
endif()

macro( asciidoc ARGS )

endmacro()
