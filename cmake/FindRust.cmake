#.rst:
# FindRust
# --------
#
# Find rust toolchain.
#
# Result Variables
# ^^^^^^^^^^^^^^^^
#
# This module defines the following variables:
#
# ``RUST_FOUND``
#
# ``CARGO_EXECUTABLE``
#
# ``RUSTC_EXECUTABLE``
#
# ``RUSTUP_EXECUTABLE``
#
# ``RUSTDOC_EXECUTABLE``
#
# ``RUST_VERSION``
#
include(${CMAKE_ROOT}/Modules/FindPackageHandleStandardArgs.cmake)

if(CMAKE_HOST_WIN32)
  set(USER_HOME "$ENV{USERPROFILE}")
else()
  set(USER_HOME "$ENV{HOME}")
endif()
file(TO_CMAKE_PATH "${USER_HOME}" USER_HOME)

if(NOT DEFINED CARGO_HOME)
  if("$ENV{CARGO_HOME}" STREQUAL "")
    set(CARGO_HOME "${USER_HOME}/.cargo")
  else()
    set(CARGO_HOME "$ENV{CARGO_HOME}")
  endif()
endif()
file(TO_CMAKE_PATH "${CARGO_HOME}" CARGO_HOME)

find_program(CARGO_EXECUTABLE cargo HINTS ${CARGO_HOME})
mark_as_advanced(CARGO_EXECUTABLE)
find_program(RUSTC_EXECUTABLE rustc HINTS ${CARGO_HOME})
mark_as_advanced(RUSTC_EXECUTABLE)
find_program(RUSTUP_EXECUTABLE rustup HINTS ${CARGO_HOME})
mark_as_advanced(RUSTUP_EXECUTABLE)
find_program(RUSTDOC_EXECUTABLE rustdoc HINTS ${CARGO_HOME})
mark_as_advanced(RUSTDOC_EXECUTABLE)

if(NOT RUST_VERSION AND EXISTS "${CARGO_EXECUTABLE}")
  execute_process(COMMAND ${CARGO_EXECUTABLE} --version OUTPUT_VARIABLE RUST_VERSION)
endif()
if(NOT RUST_VERSION AND EXISTS "${RUSTC_EXECUTABLE}")
  execute_process(COMMAND ${RUSTC_EXECUTABLE} --version OUTPUT_VARIABLE RUST_VERSION)
endif()
string(REGEX REPLACE "[^0-9]+([^\n ]+).*" "\\1" RUST_VERSION "${RUST_VERSION}")

find_package_handle_standard_args(Rust
  FOUND_VAR
    RUST_FOUND
  REQUIRED_VARS
    CARGO_HOME
    CARGO_EXECUTABLE
    RUSTC_EXECUTABLE
  VERSION_VAR
    RUST_VERSION
)
