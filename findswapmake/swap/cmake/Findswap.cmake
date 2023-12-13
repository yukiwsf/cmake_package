set(swap_FOUND TRUE)
# set(swap_ROOT_DIR ${CMAKE_SOURCE_DIR}/swap)  
find_path(swap_INCLUDE_DIRS NAMES swap.h PATHS ${CMAKE_CURRENT_LIST_DIR}/../include)  # find a directory containing the named file
find_library(swap_LIBRARIES NAMES swap PATHS ${CMAKE_CURRENT_LIST_DIR}/../lib) 
message(STATUS "swap_INCLUDE_DIRS=${swap_INCLUDE_DIRS}")
message(STATUS "swap_LIBRARIES=${swap_LIBRARIES}")

