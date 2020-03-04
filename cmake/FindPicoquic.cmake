# - Try to find Picoquic

find_path(Picoquic_INCLUDE_DIR
    NAMES picoquic.h
    HINTS ${CMAKE_SOURCE_DIR}/../picoquic/picoquic
          ${CMAKE_BINARY_DIR}/../picoquic/picoquic
          ../picotls/picoquic/ )

set(Picoquic_HINTS ${CMAKE_BINARY_DIR}/../picoquic ../picoquic)

find_library(Picoquic_CORE_LIBRARY picoquic-core HINTS ${Picoquic_HINTS})

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set Picoquic_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(Picoquic REQUIRED_VARS
    Picoquic_CORE_LIBRARY
    Picoquic_INCLUDE_DIR)

if(Picoquic_FOUND)
    set(Picoquic_LIBRARIES
        ${Picoquic_CORE_LIBRARY} )
    set(Picoquic_INCLUDE_DIRS ${Picoquic_INCLUDE_DIR})
endif()

mark_as_advanced(Picoquic_LIBRARIES Picoquic_INCLUDE_DIRS)