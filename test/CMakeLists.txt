cmake_minimum_required(VERSION 3.22)

project(cmake-template-test)

add_executable(${PROJECT_NAME})

find_library(CRITERION_LIB criterion)

if(NOT CRITERION_LIB)
  message("criterion not found; building from source")

  set(THIRD_PARTY_DIR ${CMAKE_BINARY_DIR}/third_party)
  set(CRITERION_DEP criterion-dl)
  set(CRITERION_DIR ${THIRD_PARTY_DIR}/criterion)
  set(CRITERION_LIB_DIR ${CRITERION_DIR}/lib)
  set(CRITERION_INCLUDE_DIRS ${CRITERION_DIR}/include)

  include(ExternalProject)
  add_dependencies(cmake-template-test ${CRITERION_DEP})

  find_program(MESON meson REQUIRED)

  if(${BUILD_SHARED_LIBS})
    set(CRITERION_LIB ${CRITERION_LIB_DIR}/${CMAKE_SHARED_LIBRARY_PREFIX}criterion${CMAKE_SHARED_LIBRARY_SUFFIX})
    add_library(criterion SHARED IMPORTED)
    message("criterion SHARED library: ${CRITERION_LIB}")
  else()
    set(CRITERION_LIB ${CRITERION_LIB_DIR}/${CMAKE_STATIC_LIBRARY_PREFIX}criterion${CMAKE_STATIC_LIBRARY_SUFFIX})
    add_library(criterion STATIC IMPORTED)
    message("criterion STATIC library: ${CRITERION_LIB}")
  endif()

  set_target_properties(criterion PROPERTIES IMPORTED_LOCATION ${CRITERION_LIB})

  ExternalProject_Add(
    ${CRITERION_DEP}
    PREFIX third_party
    GIT_REPOSITORY https://github.com/Snaipe/Criterion.git
    GIT_TAG bleeding
    CONFIGURE_COMMAND ${MESON} setup <SOURCE_DIR> -Dprefix=${CRITERION_DIR}
    BUILD_COMMAND ${MESON} compile
    UPDATE_COMMAND ""
    INSTALL_COMMAND ${MESON} install
    BUILD_BYPRODUCTS ${CRITERION_LIB}
  )
endif()

add_subdirectory(src)

target_include_directories(
  ${PROJECT_NAME}
  PRIVATE
  ${CRITERION_INCLUDE_DIRS}
)
target_link_libraries(
  ${PROJECT_NAME}
  PUBLIC
  ${CRITERION_LIB}
)

target_link_libraries(
  ${PROJECT_NAME}
  PRIVATE
  hello
)

add_custom_target(
  test
  COMMAND
  ${PROJECT_NAME}
  WORKING_DIRECTORY
  $<TARGET_FILE_DIR:${PROJECT_NAME}>
  DEPENDS
  $<TARGET_FILE:${PROJECT_NAME}>
)
