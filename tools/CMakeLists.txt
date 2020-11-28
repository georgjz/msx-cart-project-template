cmake_minimum_required( VERSION 3.13 FATAL_ERROR )

# Link file target
add_custom_target( linkfile ALL
    DEPENDS 
        ${LINK_FILE}
    COMMENT 
        "Link file generation dependencies check"
    VERBATIM
)
# Make sure object files are built before generating the link file 
add_dependencies( linkfile ${PROJECT_NAME}_objs )

# Run the Haskell script
add_custom_command( 
    OUTPUT ${LINK_FILE}
    COMMAND 
        runhaskell ${CMAKE_CURRENT_SOURCE_DIR}/generatelinkfile.hs $<TARGET_OBJECTS:${PROJECT_NAME}_objs>
    COMMENT
        "Running Haskell script for generating link file"
    VERBATIM
)
