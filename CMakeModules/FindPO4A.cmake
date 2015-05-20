#
# (c)2015 KiCad Developers
# (c)2015 Brian Sidebotham <brian.sidebotham@gmail.com>
#
# CMake module to find po4a (PO for anything).
#
# Variables generated:
#
# PO4A_FOUND     true when PO4A_COMMAND is valid
# PO4A_COMMAND   The command to run po4a (may be a list including an interpreter)
# PO4A_VERSION   The po4a version that has been found
#

# Have a go at finding a po4a executable
find_program( PO4A_COMMAND po4a )

# If nothing could be found, test to see if we can just find the script file, that we'll then run
# with the python interpreter
if( NOT PO4A_COMMAND )
    find_file( PO4A_COMMAND po4a )
endif()

# Try an execute the process if we've found something
unset( _RES )
if( PO4A_COMMAND )
    execute_process(
        COMMAND ${PO4A_COMMAND} --version
        OUTPUT_VARIABLE _OUT
        ERROR_VARIABLE _ERR
        RESULT_VARIABLE _RES
        OUTPUT_STRIP_TRAILING_WHITESPACE )
endif()

if( NOT _RES MATCHES 0 )

    # Find the perl interpreter quietly
    if( NOT PERL_FOUND )
        find_package( PERL QUIET )
    endif()

    if( NOT PERL_FOUND )
        # Perl's not available so can't find po4a...
        set( PO4A_COMMAND "" )
    else()
        # Try running the program with the perl interpreter
        # Assume that PO4A is a source distribution and hasn't been installed,
        # therefore set the include directory relative to the PO4A_COMMAND

        get_filename_component( PO4A_DIR ${PO4A_COMMAND} DIRECTORY )
        set( PO4A_COMMAND ${PERL_EXECUTABLE} -I${PO4A_DIR}/lib ${PO4A_COMMAND} )

        execute_process(
            COMMAND ${PO4A_COMMAND} --version
            OUTPUT_VARIABLE _OUT
            ERROR_VARIABLE _ERR
            RESULT_VARIABLE _RES
            OUTPUT_STRIP_TRAILING_WHITESPACE )

        # If it still can't be run, then give up
        if( NOT _RES MATCHES 0 )
            set( PO4A_COMMAND "" )
        endif()
    endif()
endif()

# If we've found a command that works, check the version
if( PO4A_COMMAND )
    string(REGEX REPLACE ".*version[^0-9.]*\([0-9.]+\)([0-9]+\).*" "\\1\\2" PO4A_VERSION "${_OUT}")
endif()

# Generate the *_FOUND as necessary, etc.
include( FindPackageHandleStandardArgs )
find_package_handle_standard_args(
    PO4A
    REQUIRED_VARS PO4A_COMMAND
    VERSION_VAR PO4A_VERSION )
