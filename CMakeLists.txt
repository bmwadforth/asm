cmake_minimum_required(VERSION 3.22)
project(untitled C CXX)
enable_language(ASM_NASM)
set(CMAKE_CXX_STANDARD 14)

file(GLOB SRC_FILES src/*.cpp src/**/*.cpp)
file(GLOB SRC_FILES src/*.c src/**/*.c)
file(GLOB SRC_FILES src/*.asm src/**/*.asm)

IF (WIN32)
    SET(CMAKE_EXE_LINKER_FLAGS /LARGEADDRESSAWARE:NO)
ENDIF()

add_executable(untitled main.cpp ${SRC_FILES})