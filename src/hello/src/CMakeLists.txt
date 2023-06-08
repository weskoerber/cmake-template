cmake_minimum_required(VERSION 3.22)

target_sources(
  ${PROJECT_NAME}
  PRIVATE
  hello.c
)

target_include_directories(
  ${PROJECT_NAME}
  PRIVATE
  ${CMAKE_CURRENT_SOURCE_DIR}
  ${PROJECT_INCLUDE_DIR}/hello
  INTERFACE
  ${PROJECT_INCLUDE_DIR}
)
