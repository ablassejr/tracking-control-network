cmake_minimum_required(VERSION 3.15)
project(Simulation)

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

add_executable(simulation simulation.cpp state_space.cpp)
target_link_libraries(simulation PUBLIC eigen PRIVATE cxxplot::cxxplot)
