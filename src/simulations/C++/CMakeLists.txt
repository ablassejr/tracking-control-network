cmake_minimum_required(VERSION 3.15)
project(Simulation)
enable_testing()

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()
include(FetchContent)
include_directories(PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
FetchContent_Declare(eigen
        GIT_REPOSITORY https://gitlab.com/libeigen/eigen.git

        GIT_TAG origin/master)
FetchContent_MakeAvailable(eigen)

FetchContent_Declare(
  cxxplot
  GIT_REPOSITORY https://github.com/USNavalResearchLaboratory/cxxplot.git
  GIT_TAG        v0.4.1
)

FetchContent_MakeAvailable( cxxplot )

# cxxplot is a third-party library; suppress all warnings to avoid upstream issues with newer compilers.
target_compile_options(cxxplot PRIVATE -w)

add_executable(fig2a fig2a.cpp state_space.cpp)
target_link_libraries(fig2a PUBLIC eigen PRIVATE cxxplot::cxxplot)

add_executable(fig2b fig2b.cpp state_space.cpp)
target_link_libraries(fig2b PUBLIC eigen PRIVATE cxxplot::cxxplot)

add_executable(fig2c fig2c.cpp state_space.cpp)
target_link_libraries(fig2c PUBLIC eigen PRIVATE cxxplot::cxxplot)

add_executable(validate_output validate_output.cpp)
target_link_libraries(validate_output PUBLIC eigen)

add_executable(fig2a_attacked fig2a_attacked.cpp state_space.cpp)
target_link_libraries(fig2a_attacked PUBLIC eigen PRIVATE cxxplot::cxxplot)

add_executable(test_attacked_simulation test_attacked_simulation.cpp state_space.cpp)
target_link_libraries(test_attacked_simulation PUBLIC eigen PRIVATE cxxplot::cxxplot)
add_test(NAME test_attacked_simulation COMMAND test_attacked_simulation)
