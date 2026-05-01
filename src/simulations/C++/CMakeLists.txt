cmake_minimum_required(VERSION 3.15)
project(Tracking_Control_CSTR_Simulations)
enable_testing()

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

add_test(
  NAME generate_clean_output
  COMMAND $<TARGET_FILE:cstr_state_tracking>
)
set_tests_properties(generate_clean_output PROPERTIES
  WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
)

add_test(
  NAME validate_clean_matlab_cpp
  COMMAND $<TARGET_FILE:validate_matlab_cpp>
          ${CMAKE_CURRENT_SOURCE_DIR}/../matlab/cstr/clean/cstr_state_tracking_reference.csv
          ${CMAKE_BINARY_DIR}/cstr_state_tracking_cpp_output.csv
)
set_tests_properties(validate_clean_matlab_cpp PROPERTIES
  DEPENDS generate_clean_output
)

add_test(
  NAME generate_defended_output
  COMMAND $<TARGET_FILE:cstr_state_tracking_defended>
)
set_tests_properties(generate_defended_output PROPERTIES
  WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
)

add_test(
  NAME validate_defended_reference
  COMMAND $<TARGET_FILE:validate_matlab_cpp>
          ${CMAKE_CURRENT_SOURCE_DIR}/../matlab/cstr/clean/cstr_state_tracking_reference.csv
          ${CMAKE_BINARY_DIR}/cstr_state_tracking_defended_cpp_output.csv
)
set_tests_properties(validate_defended_reference PROPERTIES
  DEPENDS generate_defended_output
)
