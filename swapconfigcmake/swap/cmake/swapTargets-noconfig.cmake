#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "swap" for configuration ""
set_property(TARGET swap APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(swap PROPERTIES
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/swap/lib/libswap.so"
  IMPORTED_SONAME_NOCONFIG "libswap.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS swap )
list(APPEND _IMPORT_CHECK_FILES_FOR_swap "${_IMPORT_PREFIX}/swap/lib/libswap.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
