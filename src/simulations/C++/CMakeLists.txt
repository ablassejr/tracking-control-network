cmake_minimum_required(VERSION 3.15)
project(Tracking_Control_CSTR_Simulations)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()
include(FetchContent)
include_directories(${CMAKE_CURRENT_SOURCE_DIR})
fetchcontent_declare(eigen
        GIT_REPOSITORY https://gitlab.com/libeigen/eigen.git
        GIT_TAG origin/master)
fetchcontent_makeavailable(eigen)

add_executable(validate_matlab_cpp validate_matlab_cpp.cpp)
target_link_libraries(validate_matlab_cpp PUBLIC eigen)

add_subdirectory(cstr)
