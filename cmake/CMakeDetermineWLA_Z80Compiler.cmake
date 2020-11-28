# Find the assembler
find_program(
    CMAKE_WLA_Z80_COMPILER 
        NAMES "wla-z80"
        HINTS "${CMAKE_SOURCE_DIR}"
        DOC "WLA-DX Z80 assembler" 
)

mark_as_advanced( CMAKE_WLA_Z80_COMPILER )

set( CMAKE_WLA_Z80_SOURCE_FILE_EXTENSIONS asm;s )
set( CMAKE_WLA_Z80_OUTPUT_EXTENSION .o )
set( CMAKE_WLA_Z80_COMPILER_ENV_VAR "FOO" )

# Configure variables set in this file for fast reload later on
configure_file( ${CMAKE_CURRENT_LIST_DIR}/CMakeWLA_Z80Compiler.cmake.in
                ${CMAKE_PLATFORM_INFO_DIR}/CMakeWLA_Z80Compiler.cmake )