#
# Part of the KiCad ASCIIDOC Documentation Project
#
# (c)2015 KiCad Developers
# (c)2015 Brian Sidebotham <brian.sidebotham@gmail.com>
#

# Everything without leading / is relative to CMAKE_INSTALL_PREFIX.
if( APPLE )
     set( _KICAD_DOC_PATH help)
else()
     set( _KICAD_DOC_PATH share/doc/kicad/help)
endif()
set( KICAD_DOC_PATH ${_KICAD_DOC_PATH}
     CACHE PATH "Install path of KiCad documentation files (absolute, or relative to CMAKE_INSTALL_PREFIX)." )

macro( INTERSECTION out_list list1 list2)
# Store the intersection between the two given lists in var_name.
    foreach( L ${list1} )
        if( "${list2}" MATCHES "(^|;)${L}(;|$)" )
            list( APPEND intersect_tmp ${L} )
        endif()
    endforeach()
    set( ${out_list} ${intersect_tmp})
endmacro(INTERSECTION)

macro( KiCadDocumentation DOCNAME )

    # Add the cvpcb documentation targets
    add_custom_target( ${DOCNAME} ALL )
    add_custom_target( ${DOCNAME}_updatepo_all )

    # Get a list of all the doc chapters
    file( GLOB DOCCHAPTERFILES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/${DOCNAME}_*.adoc )

    foreach( DOC ${DOCCHAPTERFILES} )
        # Generate only the chapter name rather than the complete filename
        string( REGEX REPLACE "${DOCNAME}_(.+)\\.adoc" "\\1" CNAME "${DOC}" )
        list( APPEND DOCCHAPTERS "${CNAME}" )
    endforeach()

    foreach( DOC ${DOCCHAPTERFILES} )
        set( DOCCHAPTERMASTERS "${DOCCHAPTERMASTERS} -m ${DOC}" )
    endforeach()
    separate_arguments( DOCCHAPTERMASTERS )

    # Get a list of all po translation files so we know what languages can be built
    file( GLOB AVAILABLE_PO RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}/po ${CMAKE_CURRENT_SOURCE_DIR}/po/*.po )
    foreach( L ${AVAILABLE_PO} )
        string( REGEX REPLACE "^(.*).po" "\\1" stem ${L})
        list( APPEND AVAILABLE "${stem}" )
    endforeach()
    list( APPEND AVAILABLE en )

    # Backwards compatibility
    if( NOT "${SINGLE_LANGUAGE}" STREQUAL "" AND "${LANGUAGES}" STREQUAL "")
       set( LANGUAGES "${SINGLE_LANGUAGE}" )
    endif()

    # If we're not building a specific language, default to all languages
    if( "${LANGUAGES}" STREQUAL "" )
        set( TRANSLATIONS ${AVAILABLE} )
    else()
        intersection( TRANSLATIONS "${AVAILABLE}" "${LANGUAGES}")
    endif()

    foreach( LANGUAGE ${TRANSLATIONS} )

        string( SUBSTRING "${LANGUAGE}" 0 2 LANGUAGE )

        if(EXISTS "${CMAKE_SOURCE_DIR}/CMakeSupport/lang-${LANGUAGE}.conf")
            set( LANGUAGE_OPTIONS "-f${CMAKE_SOURCE_DIR}/CMakeSupport/lang-${LANGUAGE}.conf" )
        else()
            set( LANGUAGE_OPTIONS "-a lang=${LANGUAGE}" ) # Fall back to the default config file for this language.
        endif()

        # Add targets for parallel builds, otherwise generation is run in parallel from multiple toplevel targets
        set (TRANSLATED_CHAPTERS "")
        foreach( CHAPTER ${DOCCHAPTERS} )
            list (APPEND TRANSLATED_CHAPTERS ${CMAKE_CURRENT_BINARY_DIR}/${LANGUAGE}/${DOCNAME}_${CHAPTER}.adoc )
        endforeach()
        add_custom_target( ${DOCNAME}_translate_${LANGUAGE}
                           DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/${LANGUAGE}/${DOCNAME}.adoc
                           DEPENDS ${TRANSLATED_CHAPTERS} )

        if( "${LANGUAGE}" MATCHES "en" )
            # No need to translate, so just make a renamed copy of the source instead such
            # that we have the same source target as every other language
            # This is made a target so that changes are reflected on subsequent builds!
            add_custom_command( OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${LANGUAGE}/${DOCNAME}.adoc
                COMMAND ${CMAKE_COMMAND} -E make_directory "${CMAKE_CURRENT_BINARY_DIR}/${LANGUAGE}"
                COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_CURRENT_SOURCE_DIR}/images ${CMAKE_CURRENT_BINARY_DIR}/${LANGUAGE}/images
                COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/${DOCNAME}.adoc ${CMAKE_CURRENT_BINARY_DIR}/${LANGUAGE}/${DOCNAME}.adoc
                DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${DOCNAME}.adoc )

            # Deal with chapters for English only (simple copy)
            foreach( CHAPTER ${DOCCHAPTERS} )
                add_custom_command( OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${LANGUAGE}/${DOCNAME}_${CHAPTER}.adoc
                    COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/${DOCNAME}_${CHAPTER}.adoc
                    ${CMAKE_CURRENT_BINARY_DIR}/${LANGUAGE}/${DOCNAME}_${CHAPTER}.adoc
                    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${DOCNAME}_${CHAPTER}.adoc )
            endforeach()
        else()
            # Targets to update the translation files - include individual language targets
            # as well as an "all" target. Do not include updating the translations in the
            # default all target
            add_custom_target( ${DOCNAME}_updatepo_${LANGUAGE}
                COMMAND cd ${CMAKE_CURRENT_SOURCE_DIR} &&
                        ${PO4A_COMMAND}-updatepo -f asciidoc -v -M utf-8
                            -m ${DOCNAME}.adoc ${DOCCHAPTERMASTERS}
                            -p po/${LANGUAGE}.po )

            add_dependencies( ${DOCNAME}_updatepo_all ${DOCNAME}_updatepo_${LANGUAGE} )

            add_dependencies( updatepo_${LANGUAGE} ${DOCNAME}_updatepo_${LANGUAGE} )
            add_dependencies( updatepo_all ${DOCNAME}_updatepo_${LANGUAGE} )

            add_custom_command( OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${LANGUAGE}/${DOCNAME}.adoc
                COMMAND ${CMAKE_COMMAND} -E make_directory "${CMAKE_CURRENT_BINARY_DIR}/${LANGUAGE}"
                COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_CURRENT_SOURCE_DIR}/images ${CMAKE_CURRENT_BINARY_DIR}/${LANGUAGE}/images
                COMMAND ${PO4A_COMMAND}-translate -f asciidoc -a ${CMAKE_CURRENT_SOURCE_DIR}/po/addendum.${LANGUAGE} -A utf-8 -M utf-8 -m ${CMAKE_CURRENT_SOURCE_DIR}/${DOCNAME}.adoc -p ${CMAKE_CURRENT_SOURCE_DIR}/po/${LANGUAGE}.po -k -0 -l ${CMAKE_CURRENT_BINARY_DIR}/${LANGUAGE}/${DOCNAME}.adoc
                DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${DOCNAME}.adoc
                DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/po/${LANGUAGE}.po )

            # Non-ascii languages needs some special treatments
            if( "${LANGUAGE}" MATCHES "ja" )
                set(DBLATEX_OPTIONS "")
                set_dblatex_common_options()
                add_dblatex_option( -b xetex -p ${CMAKE_CURRENT_SOURCE_DIR}/../../xsl/dblatex-pdf-ja.xsl )
            elseif( "${LANGUAGE}" MATCHES "ru" )
                set(DBLATEX_OPTIONS "")
                set_dblatex_common_options()
                add_dblatex_option( -b xetex -p ${CMAKE_CURRENT_SOURCE_DIR}/../../xsl/dblatex-pdf-ru.xsl )
            elseif( "${LANGUAGE}" MATCHES "zh" )
                set(DBLATEX_OPTIONS "")
                set_dblatex_common_options()
                add_dblatex_option( -b xetex -p ${CMAKE_CURRENT_SOURCE_DIR}/../../xsl/dblatex-pdf-zh.xsl )
            endif()

            # Deal with chapters for all languages...
            foreach( CHAPTER ${DOCCHAPTERS} )
                add_custom_command( OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${LANGUAGE}/${DOCNAME}_${CHAPTER}.adoc
                                    COMMAND ${PO4A_COMMAND}-translate -f asciidoc -A utf-8 -M utf-8
                                        -m ${CMAKE_CURRENT_SOURCE_DIR}/${DOCNAME}_${CHAPTER}.adoc
                                        -p ${CMAKE_CURRENT_SOURCE_DIR}/po/${LANGUAGE}.po -k -0
                                        -l ${CMAKE_CURRENT_BINARY_DIR}/${LANGUAGE}/${DOCNAME}_${CHAPTER}.adoc
                                    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/po/${LANGUAGE}.po
                                    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${DOCNAME}_${CHAPTER}.adoc )
            endforeach()
        endif()

        # HTML Generation
        list( FIND BUILD_FORMATS "html" HTML_BUILD )
        if( NOT "${HTML_BUILD}" EQUAL "-1" )
            add_adoc_html_target( ${DOCNAME}_html_${LANGUAGE}
                    ${CMAKE_CURRENT_BINARY_DIR}/${LANGUAGE}/${DOCNAME}.adoc
                    ${CMAKE_CURRENT_BINARY_DIR}/${LANGUAGE}/${DOCNAME}.html
                    ${LANGUAGE} )

            add_dependencies( ${DOCNAME}_html_${LANGUAGE} ${DOCNAME}_translate_${LANGUAGE} )
            add_dependencies( ${DOCNAME} ${DOCNAME}_html_${LANGUAGE} )

            install( FILES ${CMAKE_CURRENT_BINARY_DIR}/${LANGUAGE}/${DOCNAME}.html DESTINATION ${KICAD_DOC_PATH}/${LANGUAGE} COMPONENT html-${LANGUAGE} )

            # It seems to be necessary to use different install commands to
            # install the images properly without having other languages
            # polluting the images folder
            install( DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/images/${LANGUAGE} DESTINATION ${KICAD_DOC_PATH}/${LANGUAGE}/images COMPONENT html-${LANGUAGE} OPTIONAL PATTERN "*.png")
            install( DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/images/icons DESTINATION ${KICAD_DOC_PATH}/${LANGUAGE}/images COMPONENT html-${LANGUAGE} OPTIONAL PATTERN "*.png")

            # And we try to detect the non-localized images here to be
            # able to only install the images that are not already
            # covered by the localized version
            file(GLOB UNIVERSAL_IMAGES "${CMAKE_CURRENT_SOURCE_DIR}/images/*.png")
            file(GLOB KICAD_DOC_LANG_IMAGES "${CMAKE_CURRENT_SOURCE_DIR}/images/${LANGUAGE}/*.png")

            # Get filename of localized images
            string(REGEX REPLACE
              "${CMAKE_CURRENT_SOURCE_DIR}/images/${LANGUAGE}/" ""
              KICAD_DOC_LANG_IMAGES_NAME "${KICAD_DOC_LANG_IMAGES}")

            set (_image "")
            set (KICAD_DOC_ENG_IMAGES "")
            # Test if a localized image exist, if not save it
            foreach (_image ${UNIVERSAL_IMAGES})
                get_filename_component(_name ${_image} NAME)
                list(FIND KICAD_DOC_LANG_IMAGES_NAME ${_name} _add_this)
                if(_add_this EQUAL -1)
                  list (APPEND KICAD_DOC_ENG_IMAGES ${_name})
                endif()
            endforeach()

            # Finally add the images to the install location
            if ( NOT "${KICAD_DOC_ENG_IMAGES}" STREQUAL "" )
                string(REGEX REPLACE
                  "([^;]+)"
                  "${CMAKE_CURRENT_SOURCE_DIR}/images/\\1"
                  install_this "${KICAD_DOC_ENG_IMAGES}")

                foreach( _f ${install_this} )
                  install( FILES "${_f}" DESTINATION ${KICAD_DOC_PATH}/${LANGUAGE}/images COMPONENT html-${LANGUAGE} )
                endforeach()
            endif()
        endif()


        # PDF Generation
        list( FIND BUILD_FORMATS "pdf" PDF_BUILD )
        if( NOT "${PDF_BUILD}" EQUAL "-1" )
            add_adoc_pdf_target( ${DOCNAME}_pdf_${LANGUAGE}
                    ${CMAKE_CURRENT_BINARY_DIR}/${LANGUAGE}/${DOCNAME}.adoc
                    ${CMAKE_CURRENT_BINARY_DIR}/${LANGUAGE}/${DOCNAME}.pdf
                    ${LANGUAGE} )

            add_dependencies( ${DOCNAME}_pdf_${LANGUAGE} ${DOCNAME}_translate_${LANGUAGE} )
            add_dependencies( ${DOCNAME} ${DOCNAME}_pdf_${LANGUAGE} )

            install( FILES ${CMAKE_CURRENT_BINARY_DIR}/${LANGUAGE}/${DOCNAME}.pdf DESTINATION ${KICAD_DOC_PATH}/${LANGUAGE} COMPONENT pdf-${LANGUAGE})
        endif()


        # EPUB Generation
        list( FIND BUILD_FORMATS "epub" EPUB_BUILD )
        if( NOT "${EPUB_BUILD}" EQUAL "-1" )
            add_adoc_epub_target( ${DOCNAME}_epub_${LANGUAGE}
                    ${CMAKE_CURRENT_BINARY_DIR}/${LANGUAGE}/${DOCNAME}.adoc
                    ${CMAKE_CURRENT_BINARY_DIR}/${LANGUAGE}/${DOCNAME}.epub
                    ${LANGUAGE} )

            add_dependencies( ${DOCNAME}_epub_${LANGUAGE} ${DOCNAME}_translate_${LANGUAGE} )
            add_dependencies( ${DOCNAME} ${DOCNAME}_epub_${LANGUAGE} )

            # Make the epub target depend on the PDF build as the targets have a race
            # condition, a2x creates the intermediate docbook output directly in the output
            # directory.
            if( NOT "${PDF_BUILD}" EQUAL "-1" )
                add_dependencies( ${DOCNAME}_epub_${LANGUAGE} ${DOCNAME}_pdf_${LANGUAGE} )
            endif()

            install( FILES ${CMAKE_CURRENT_BINARY_DIR}/${LANGUAGE}/${DOCNAME}.epub DESTINATION ${KICAD_DOC_PATH}/${LANGUAGE} COMPONENT epub-${LANGUAGE})
        endif()
    endforeach()

endmacro()
