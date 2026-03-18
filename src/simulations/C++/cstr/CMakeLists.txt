add_library(cstr_dynamics_lib OBJECT cstr_dynamics.cpp)
target_link_libraries(cstr_dynamics_lib PUBLIC eigen Matplot++::matplot)
target_include_directories(cstr_dynamics_lib PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/..
)

add_subdirectory(clean)
add_subdirectory(attacked)
