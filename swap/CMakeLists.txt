cmake_minimum_required(VERSION 3.13)
project(swap)
set(PACKAGE_VERSION "1.0.0")
add_library(${PROJECT_NAME} SHARED ${CMAKE_CURRENT_SOURCE_DIR}/src/swap.cpp)
target_include_directories(
    ${PROJECT_NAME} PUBLIC 
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include>
)
add_executable(${PROJECT_NAME}_test test.cpp)
target_include_directories(${PROJECT_NAME}_test PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(${PROJECT_NAME}_test PRIVATE ${PROJECT_NAME})
set_target_properties(swap PROPERTIES PUBLIC_HEADER ${CMAKE_CURRENT_SOURCE_DIR}/include/swap.h)

# ================== 生成目标文件的xxxTarget.cmake ======================
# 会将生成的库libswap.so安装到${CMAKE_INSTALL_PREFIX}/lib下
set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR}/install)
message(STATUS "CMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}")
install(
	TARGETS ${PROJECT_NAME}
	EXPORT ${PROJECT_NAME}Targets
	PUBLIC_HEADER DESTINATION ${PROJECT_NAME}/include
	ARCHIVE DESTINATION ${PROJECT_NAME}/lib
 	LIBRARY DESTINATION ${PROJECT_NAME}/lib
	RUNTIME DESTINATION ${PROJECT_NAME}/bin
)
# 生成 xxxTargets.cmake文件
install(
	EXPORT ${PROJECT_NAME}Targets
	FILE ${PROJECT_NAME}Targets.cmake
	DESTINATION ${PROJECT_NAME}/cmake
)

# ====================== 生成 xxxConfig.cmake =============================
# 该变量会通过xxxConfig.cmake.in用于在生成的xxxConfig.cmake中
set(INCLUDE_DIR ${PROJECT_NAME}/include)
set(LIBS ${PROJECT_NAME})
set(LIBS_DIR ${PROJECT_NAME}/lib)

# 由cmake提供
include(CMakePackageConfigHelpers)

# 生成 xxxConfigVersion.cmake文件
write_basic_package_version_file(
	${PROJECT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake
	VERSION ${PACKAGE_VERSION}
	COMPATIBILITY SameMajorVersion
)

# 用于生成 xxxConfig.cmake文件
configure_package_config_file(
	${PROJECT_SOURCE_DIR}/${PROJECT_NAME}Config.cmake.in
	${PROJECT_BINARY_DIR}/${PROJECT_NAME}Config.cmake
	INSTALL_DESTINATION ${PROJECT_NAME}/cmake
	PATH_VARS INCLUDE_DIR LIBS LIBS_DIR
	INSTALL_PREFIX ${CMAKE_INSTALL_PREFIX}
)

install(
	FILES ${PROJECT_BINARY_DIR}/${PROJECT_NAME}Config.cmake ${PROJECT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake
	DESTINATION ${PROJECT_NAME}/cmake
)
