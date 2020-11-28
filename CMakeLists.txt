cmake_minimum_required( VERSION 3.13 FATAL_ERROR )

# Give the project a name
project( msx-cartridge-template
    VERSION 0.1.0
    DESCRIPTION "Simple template for a cartridge for MSX systems" 
)

# Add the WLAZ80 module to CMake
list( APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake" )

# Tell CMake this is a WLA Z80 project. The target executable will be the final ROM
# that will be built. 
enable_language( WLA_Z80 )

# We're going to compile the sources into an object library first. This will 
# make generating the link file easier.
add_library( ${PROJECT_NAME}_objs OBJECT "" )
add_subdirectory( src )

# Generate the link file
set( LINK_FILE linkfile.cfg )   # Name of the linke file
add_subdirectory( tools )

# This will be the final executable/ROM
add_executable( ${PROJECT_NAME} $<TARGET_OBJECTS:${PROJECT_NAME}_objs> )
add_dependencies( ${PROJECT_NAME} linkfile )
target_link_options( ${PROJECT_NAME}
    PRIVATE -v
            ${CMAKE_CURRENT_BINARY_DIR}/tools/${LINK_FILE}
)

### Use this if you need to copy data that isn't directly built into the ROM.
# Copy game assets
# add_custom_target(
#     copy-assets ALL
#     COMMENT "Copying assets"
#     COMMAND ${CMAKE_COMMAND} -E copy_directory
#     ${CMAKE_CURRENT_SOURCE_DIR}/assets ${CMAKE_BINARY_DIR}/assets )
