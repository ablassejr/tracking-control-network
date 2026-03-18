cmake_minimum_required(VERSION 3.15)
project(Simulation)
enable_testing()

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()
include(FetchContent)
include_directories(${CMAKE_CURRENT_SOURCE_DIR})
FetchContent_Declare(eigen
        GIT_REPOSITORY https://gitlab.com/libeigen/eigen.git

        GIT_TAG origin/master)
FetchContent_MakeAvailable(eigen)

FetchContent_Declare(
  matplotplusplus
  GIT_REPOSITORY https://github.com/alandefreitas/matplotplusplus.git
  GIT_TAG        v1.2.1
)
FetchContent_MakeAvailable(matplotplusplus)

add_executable(validate_matlab_cpp validate_matlab_cpp.cpp)
target_link_libraries(validate_matlab_cpp PUBLIC eigen)

add_subdirectory(cstr)
