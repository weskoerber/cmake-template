cmake_minimum_required(VERSION 3.22)

add_executable(${PROJECT_NAME})

target_sources(
  ${PROJECT_NAME}
  PRIVATE
  main.c
)

target_include_directories(
  ${PROJECT_NAME}
  PRIVATE
  ${CMAKE_CURRENT_SOURCE_DIR}
)

target_link_libraries(
  ${PROJECT_NAME}
  PRIVATE
  hello
)

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/hello)
