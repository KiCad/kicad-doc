
# Require CMake V2.8 as a minimum. You can experiment with setting this lower if that's all you
# have available, but it's not guaranteed to work or be supported.
cmake_minimum_required( VERSION 2.8 )

project( KiCadDocumentation )

# Add our custom modules to the module path
set( CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/CMakeModules" ${CMAKE_MODULE_PATH} )

# Discover if the PO4A package is available
find_package( PO4A )

# Discover if the Asciidoc toolchain is available
find_package( ASCIIDOC )

# Discover if the AsciiDoctor toolchain is available
find_package( ASCIIDOCTOR )

# Discover if the AsciiDoctor-pdf toolchain is available
find_package( ASCIIDOCTORPDF )

add_subdirectory( src )

# Generate both .tar.gz and .zip package targets
set( CPACK_GENERATOR "TGZ;ZIP" )
set( CPACK_PACKAGE_VERSION "1.0.0" )
set( CPACK_PACKAGE_FILE_NAME "KiCadDocumentation-${CPACK_PACKAGE_VERSION}" )
include( CPack )

