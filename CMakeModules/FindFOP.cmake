#
# (c)2015 KiCad Developers
# (c)2015 Brian Sidebotham <brian.sidebotham@gmail.com>
#
# CMake module to find Apache FOP.
#
# Variables generated:
#
# FOP_FOUND     true when FOP_COMMAND is valid
# FOP_COMMAND   The command to run fop
# FOP_VERSION   The fop version that has been found
#

# Have a go at finding a fop executable
find_program( FOP_PROGRAM fop )

# Found something, attempt to try and use it...
if( FOP_PROGRAM )
    execute_process(
        COMMAND ${FOP_PROGRAM} -version
        OUTPUT_VARIABLE _OUT
        ERROR_VARIABLE _ERR
        RESULT_VARIABLE _RES
        OUTPUT_STRIP_TRAILING_WHITESPACE )

    # If it didn't work, remove the result
    if( _RES MATCHES 0 )
        set( FOP_COMMAND "${FOP_PROGRAM}" )
    endif()
endif()

# If nothing could be found, test to see if we can just find the script file, that we'll then run
# with the python interpreter
if( NOT FOP_COMMAND )

    # Try an execute the windows .cmd file...
    find_file( FOP_COMMAND fop.cmd )

    if( FOP_COMMAND )
        execute_process(
            COMMAND ${FOP_COMMAND} -version
            OUTPUT_VARIABLE _OUT
            ERROR_VARIABLE _ERR
            RESULT_VARIABLE _RES
            OUTPUT_STRIP_TRAILING_WHITESPACE )

        # If it didn't work, remove the result
        if( NOT _RES MATCHES 0 )
            set( FOP_COMMAND "" )
        endif()
    endif()
endif()

# If we've found a command that works, check the version
if( FOP_COMMAND )
    string(REGEX REPLACE ".*Version[^0-9.]*\([0-9.]+\)([0-9]+\).*" "\\1\\2" FOP_VERSION "${_OUT}")
endif()

# Generate the *_FOUND as necessary, etc.
include( FindPackageHandleStandardArgs )
find_package_handle_standard_args(
    FOP
    REQUIRED_VARS FOP_COMMAND
    VERSION_VAR FOP_VERSION )
