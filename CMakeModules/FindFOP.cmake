#
# (c)2015 KiCad-Developers
# (c)2015 Brian Sidebotham
#
# Part of the KiCad project
#

unset( FOP_FOUND )
unset( _DEBUG )
set( _DBG OFF )

# Attempt to execute the FOP utility
execute_process( COMMAND fop --version
                 RESULT_VARIABLE _FOP_EXE_RESULT
                 OUTPUT_VARIABLE _FOP_EXE_OUTPUT
                 ERROR_VARIABLE _FOP_EXE_ERROR )

set( FOP_COMMAND "fop" )

if( _DBG )
    message( STATUS "FOP result: ${_FOP_EXE_RESULT}" )
    message( STATUS "FOP outut: ${_FOP_EXE_OUTPUT}" )
endif()

if( NOT "${_FOP_EXE_RESULT}" STREQUAL "0" )
    # Attempt to see if a bat file can be run which invokes FOP
    execute_process( COMMAND fop.bat --version
                 RESULT_VARIABLE _FOP_EXE_RESULT
                 OUTPUT_VARIABLE _FOP_EXE_OUTPUT
                 ERROR_VARIABLE _FOP_EXE_ERROR )

    set( FOP_COMMAND "fop.bat" )

    if( NOT "${_ADOC_EXE_RESULT}" STREQUAL "0" )
        set( FOP_FOUND FALSE )
    else()
        set( FOP_FOUND TRUE )
    endif()
else()
    set( FOP_FOUND TRUE )
endif()

if( FOP_FOUND )
    # Get the PO4A version number...
    string( REGEX MATCH "[0-9]+\\.[0-9]+" FOP_VERSION "${_FOP_EXE_OUTPUT}" )
    message( STATUS "FOP Found v${FOP_VERSION}" )
else()
    message( STATUS "FOP NOT FOUND" )
endif()

macro( fop ARGS )

endmacro()
