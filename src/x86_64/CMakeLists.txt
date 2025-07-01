cmake_minimum_required(VERSION 3.22)
project(untitled C CXX ASM_NASM)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_C_STANDARD 11)

set(SOURCE_ROOT .)

file(GLOB_RECURSE PROJECT_SOURCES
    "${SOURCE_ROOT}/*.c"
    "${SOURCE_ROOT}/*.cpp"
    "${SOURCE_ROOT}/*.asm"
    "${SOURCE_ROOT}/**/*.c"
    "${SOURCE_ROOT}/**/*.cpp"
    "${SOURCE_ROOT}/**/*.asm"
)

list(APPEND PROJECT_SOURCES main.cpp)

IF (WIN32)
    SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /LARGEADDRESSAWARE:NO")
ENDIF()

add_executable(untitled ${PROJECT_SOURCES})