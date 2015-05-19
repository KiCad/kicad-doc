#
# (c)2015 KiCad Developers
# (c)2015 Brian Sidebotham <brian.sidebotham@gmail.com>
#
# CMake module to find asciidoc
#
# Variables generatied:
#
# ASCIIDOC_FOUND     true when ASCIIDOC_COMMAND is valid
# ASCIIDOC_COMMAND   The command to run asciidoc (may be a list including an interpreter)
# ASCIIDOC_VERSION   The asciidoc version that has been found
#

# Have a go at finding a asciidoc executable
find_program( ASCIIDOC_PROGRAM asciidoc )

# Found something, attempt to try and use it...
if( ASCIIDOC_PROGRAM )
    execute_process(
        COMMAND ${ASCIIDOC_PROGRAM} --version
        OUTPUT_VARIABLE _OUT
        ERROR_VARIABLE _ERR
        RESULT_VARIABLE _RES
        OUTPUT_STRIP_TRAILING_WHITESPACE )

    # If it worked, set the ASCIIDOC_COMMAND
    if( _RES MATCHES 0 )
        set( ASCIIDOC_COMMAND "${ASCIIDOC_PROGRAM}" )
    endif()
endif()

# If nothing could be found, test to see if we can just find the script file,
# that we'll then run with the python interpreter
if( NOT ASCIIDOC_COMMAND )
    find_file( ASCIIDOC_SCRIPT asciidoc.py )

    if( ASCIIDOC_SCRIPT )
        # Find the python interpreter quietly
        if( NOT PYTHONINTERP_FOUND )
            find_package( PYTHONINTERP QUIET )
        endif()

        if( NOT PYTHONINTERP_FOUND )
            # Python's not available so can't find asciidoc...
            set( ASCIIDOC_COMMAND "" )
        else()
            # Build the python based command
            set( ASCIIDOC_COMMAND "${PYTHON_EXECUTABLE}" "${ASCIIDOC_SCRIPT}" )

            execute_process(
                COMMAND ${ASCIIDOC_COMMAND} --version
                OUTPUT_VARIABLE _OUT
                ERROR_VARIABLE _ERR
                RESULT_VARIABLE _RES
                OUTPUT_STRIP_TRAILING_WHITESPACE )

            # If it still can't be run, then give up
            if( NOT _RES MATCHES 0 )
                set( ASCIIDOC_COMMAND "" )
            endif()
        endif()
    endif()
endif()

# If we've found a command that works, check the version
if( ASCIIDOC_COMMAND )
    string(REGEX REPLACE ".*asciidoc[^0-9.]*\([0-9.]+\).*" "\\1" ASCIIDOC_VERSION "${_OUT}")
endif()

# Generate the *_FOUND as necessary, etc.
include( FindPackageHandleStandardArgs )
find_package_handle_standard_args(
    ASCIIDOC
    REQUIRED_VARS ASCIIDOC_COMMAND
    VERSION_VAR ASCIIDOC_VERSION )
