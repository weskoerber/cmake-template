cmake_minimum_required(VERSION 3.22)

target_include_directories(
  ${PROJECT_NAME}
  PRIVATE
  ${CMAKE_CURRENT_SOURCE_DIR}/hello
  INTERFACE
  ${CMAKE_CURRENT_SOURCE_DIR}
)
