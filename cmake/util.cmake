cmake_minimum_required(VERSION 3.22)

macro(print msg)
    message("${PROJECT_NAME}: ${msg}")
endmacro()

macro(print_var var)
    message("${PROJECT_NAME}: ${var} = ${${var}}")
endmacro()
