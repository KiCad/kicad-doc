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
add_a2x_option( --no-xmllint )
add_a2x_option( -f pdf )
#add_a2x_option( --verbose )

# Add a2x options depending on which PDF generator we're using
if( ${PDF_GENERATOR} MATCHES DBLATEX )
    # When the a2x target macro knows we're using dblatex, it adds in the
    # --dblatex-opts command and uses the following options for that
    add_dblatex_option( -P latex.output.revhistory=0 )
    add_dblatex_option( -P doc.publisher.show=0 )
    add_dblatex_option( -s ${PROJECT_SOURCE_DIR}/src/pdf-cover-dblatex.sty )

    find_package( DBLATEX REQUIRED )
endif()

if( ${PDF_GENERATOR} MATCHES FOP )
    add_a2x_option( --fop )
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

add_subdirectory( src )

# Generate both .tar.gz and .zip package targets
set( CPACK_GENERATOR "TGZ;ZIP" )
set( CPACK_PACKAGE_VERSION "1.0.0" )
set( CPACK_PACKAGE_FILE_NAME "KiCadDocumentation-${CPACK_PACKAGE_VERSION}" )
include( CPack )


