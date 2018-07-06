#
# Part of the KiCad ASCIIDOC Documentation Project
#
# (c)2015 KiCad Developers
# (c)2015 Brian Sidebotham <brian.sidebotham@gmail.com>
#

# Require CMake V2.8 as a minimum. You can experiment with setting this lower if that's all you
# have available, but it's not guaranteed to work or be supported.
cmake_minimum_required( VERSION 2.8 )

project( KiCadDocumentation NONE )

# Provide an option for deciding which PDF generation scheme to use
# Desired targets are DBLATEX,FOP and ASCIIDOCTOR-PDF
set( PDF_GENERATOR "DBLATEX" CACHE STRING "Specify which PDF generator to use: DBLATEX|FOP" )

# Provide an option for a single language build. If nothing else, this will at
# least help developers to speed up a build they're working on
set( SINGLE_LANGUAGE "" CACHE STRING "Specify a single language to build: en|fr|it|ja|nl|pl" )

# Provide an option to decide which documentation formats to build.
set( BUILD_FORMATS "html;pdf;epub" CACHE LIST "Specify which output formats to build html/pdf/epub" )

# Add our custom modules to the module path
set( CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/CMakeModules" ${CMAKE_MODULE_PATH} )

# Include the Asciidoc target helpers
include( AsciidocHelpers )

# Add the common asciidoc options
add_adoc_option( -b html5 )
add_adoc_option( -a toc2 )
add_adoc_option( --section-numbers )
add_adoc_option( --theme flask )

# Add the common a2x options
add_a2x_option( --xsltproc-opts=--nonet )
add_a2x_option( --no-xmllint )
add_a2x_option( -f pdf )
#add_a2x_option( --verbose )

# Add a2x options depending on which PDF generator we're using
if( ${PDF_GENERATOR} MATCHES DBLATEX )
    set_dblatex_common_options()
    find_package( DBLATEX REQUIRED )
endif()

if( ${PDF_GENERATOR} MATCHES FOP )
    add_a2x_option( --fop )
    add_a2x_option( --xsl-file ${PROJECT_SOURCE_DIR}/xsl/kicad.xsl )
    find_package( FOP REQUIRED )
endif()

if( ${PDF_GENERATOR} MATCHES ASCIIDOCTORPDF )
    message( FATAL_ERROR "AsciiDoctor-pdf is not currently supported!" )

    # Discover if the AsciiDoctor toolchain is available
    # find_package( ASCIIDOCTOR )
    # find_package( ASCIIDOCTORPDF )

endif()

# Discover if the PO4A package is available
find_package( PO4A REQUIRED )

# Discover if the Asciidoc toolchain is available
find_package( ASCIIDOC REQUIRED )
find_package( A2X REQUIRED )

include( KiCadDocumentation )
add_subdirectory( src )

# Start with the package version being unknown, then prove otherwise
set( CPACK_PACKAGE_VERSION "unknown" )

# Use Git to determine parts of the package name
find_package( Git )

if( GIT_FOUND )

    # Discover information about the build (AT CONFIGURE TIME, not as a target that updates in
    # subsequent builds)
    execute_process( COMMAND "${GIT_EXECUTABLE}" describe --tags
        WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
        OUTPUT_VARIABLE git_tags_output
        RESULT_VARIABLE git_tags_result
        ERROR_VARIABLE git_tags_error
        OUTPUT_STRIP_TRAILING_WHITESPACE )

    execute_process( COMMAND "${GIT_EXECUTABLE}" rev-parse --abbrev-ref HEAD
        WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
        OUTPUT_VARIABLE git_branch_output
        RESULT_VARIABLE git_branch_result
        ERROR_VARIABLE git_branch_error
        OUTPUT_STRIP_TRAILING_WHITESPACE )

    message (STATUS "On branch ${git_branch_output} with tag ${git_tags_output}" )
    # Due to how tags work in Git it's necessary for us to ensure a few things. For a start, if we
    # create a new branch, switch to it and create a tag, that tag becomes visible in the master
    # branch. Make sure if we're on the master branch that we use that in the
    if( "${git_branch_output}" STREQUAL "master" )
        # TODO: Should we include a 6-digit hash here too?
        set( CPACK_PACKAGE_VERSION "HEAD" )
    else()
        if( NOT "${git_tags_output}" STREQUAL "" )
            set( CPACK_PACKAGE_VERSION ${git_tags_output} )
        endif()
    endif()
    message (STATUS "Setting package version to ${CPACK_PACKAGE_VERSION}")
endif()

# Everything without leading / is relative to CMAKE_INSTALL_PREFIX.
set( KICAD_DOC_INSTALL_PATH share/doc/kicad
     CACHE PATH "Install path of KiCad documentation files relative to CMAKE_INSTALL_PREFIX." )

# Set the language in the package name if the package only contains a single
# language
if( "${SINGLE_LANGUAGE}" STREQUAL "" )
    set( PACKAGE_LANGUAGE "" )
else()
    set( PACKAGE_LANGUAGE "-${SINGLE_LANGUAGE}" )
endif()

# If there is more than one build format, do not bother transforming the
# package name, otherwise if there's only one, add it to the package name
list( LENGTH BUILD_FORMATS BUILD_FORMATS_LENGTH )
if( ${BUILD_FORMATS_LENGTH} GREATER 1 )
    set( PACKAGE_BUILD_FORMAT "" )
else()
    set( PACKAGE_BUILD_FORMAT "-${BUILD_FORMATS}" )
endif()

# Generate both .tar.gz package target
set( CPACK_GENERATOR "TGZ" )
set( CPACK_PACKAGE_FILE_NAME "kicad-doc${PACKAGE_BUILD_FORMAT}${PACKAGE_LANGUAGE}-${CPACK_PACKAGE_VERSION}" )
include( CPack )


