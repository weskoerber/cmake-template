cmake_minimum_required(VERSION 3.22)

project(cmake-template-test)

include(FindCriterion)

add_executable(${PROJECT_NAME})

add_subdirectory(src)

if (${CRITERION_FOUND})
  target_include_directories(
    ${PROJECT_NAME}
    PRIVATE
    ${CRITERION_INCLUDE_DIRS}
  )
  target_link_libraries(
    ${PROJECT_NAME}
    PRIVATE
    ${CRITERION_LIBRARIES}
  )
else()
  message(
    FATAL_ERROR
    "Criterion is required to build
    ${PROJECT_NAME}"
  )
endif()

target_link_libraries(
  ${PROJECT_NAME}
  PRIVATE
  hello
)
