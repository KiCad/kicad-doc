#
# (c)2015 KiCad-Developers
# (c)2015 Brian Sidebotham
#
# Part of the KiCad project
#
# The latest po4a can be downloaded from Alioth:
#     https://alioth.debian.org/frs/?group_id=30267
#

set( PO4A_CALL_PERL OFF )
unset( PO4A_FOUND )

# Set to ON to get debug information from this module
set( DBG OFF )

find_program( PO4A_COMMAND po4a )

if( NOT PO4A_COMMAND )

    # Set the vanilla command for PO4a until proven otherwise
    set( PO4A_COMMAND po4a )

    # Attempt to execute the po4a utility
    execute_process( COMMAND ${PO4A_COMMAND} --version
                     RESULT_VARIABLE _PO4A_EXE_RESULT
                     OUTPUT_VARIABLE _PO4A_EXE_OUTPUT
                     ERROR_VARIABLE _PO4A_EXE_ERROR )

    if( DBG )
        message( DEBUG " ${PO4A_COMMAND} ${_PO4A_EXE_RESULT} ${_PO4A_EXE_OUTPUT}" )
    endif()

    if( NOT "${_PO4A_EXE_RESULT}" STREQUAL "0" )
        # If a system version is not found, attempt to use the version we've included in the
        # CMakeSupport folder (mainly for Windows users!)
        set( PO4A_BASE_COMMAND perl -I ${PROJECT_SOURCE_DIR}/CMakeSupport/po4a/lib ${PROJECT_SOURCE_DIR}/CMakeSupport/po4a/ )
        set( PO4A_COMMAND "${PO4A_BASE_COMMAND}po4a" )
        set( PO4A_TRANSLATE_COMMAND "${PO4A_BASE_COMMAND}po4a-translate" )
        set( PO4A_GETTEXTIZE_COMMAND "${PO4A_BASE_COMMAND}po4a-gettextize" )
    
        execute_process( COMMAND ${PO4A_COMMAND} --version
                         RESULT_VARIABLE _PO4A_EXE_RESULT
                         OUTPUT_VARIABLE _PO4A_EXE_OUTPUT
                         ERROR_VARIABLE _PO4A_EXE_ERROR )
    else()
        set( PO4A_FOUND TRUE )
    endif()
else()
    set( PO4A_TRANSLATE_COMMAND "${PO4A_COMMAND}-translate" )
    set( PO4A_GETTEXTIZE_COMMAND "${PO4A_COMMAND}-gettextize" )
    set( PO4A_FOUND TRUE )
endif()

if( PO4A_FOUND )
    # Get the PO4A version number...
    execute_process( COMMAND ${PO4A_COMMAND} --version
                     RESULT_VARIABLE _PO4A_EXE_RESULT
                     OUTPUT_VARIABLE _PO4A_EXE_OUTPUT
                     ERROR_VARIABLE _PO4A_EXE_ERROR )

    string( REGEX MATCH "[0-9]+\\.[0-9]+" PO4A_VERSION "${_PO4A_EXE_OUTPUT}" )
    message( STATUS "PO4A Found ${PO4A_COMMAND} v${PO4A_VERSION}" )
endif()

macro( po4a ARGS )

endmacro()
