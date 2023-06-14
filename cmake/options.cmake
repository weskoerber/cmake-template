cmake_minimum_required(VERSION 3.22)

option(BUILD_TEST "Build test" OFF)
if (${BUILD_TEST})
    print("Building test binary")
    add_subdirectory(test)
endif()

option(BUILD_SHARED_LIBS "Build shared libs" OFF)
if (${BUILD_SHARED_LIBS})
    message("${PROJECT_NAME}: Building shared library")
else()
    message("${PROJECT_NAME}: Building static library")
endif()
