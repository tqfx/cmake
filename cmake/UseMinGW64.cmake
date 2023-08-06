set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_SYSTEM_PROCESSOR x86_64)
set(CMAKE_TOOLCHAIN_PREFIX x86_64-w64-mingw32)
find_program(CMAKE_AR ${CMAKE_TOOLCHAIN_PREFIX}-gcc-ar)
find_program(CMAKE_C_COMPILER ${CMAKE_TOOLCHAIN_PREFIX}-gcc)
find_program(CMAKE_CXX_COMPILER ${CMAKE_TOOLCHAIN_PREFIX}-g++)
find_program(CMAKE_RANLIB ${CMAKE_TOOLCHAIN_PREFIX}-gcc-ranlib)
find_program(CMAKE_RC_COMPILER ${CMAKE_TOOLCHAIN_PREFIX}-windres)
set(CMAKE_ASM_COMPILER ${CMAKE_C_COMPILER} -x assembler-with-cpp)
get_filename_component(CMAKE_FIND_ROOT_PATH "${CMAKE_C_COMPILER}" DIRECTORY)
get_filename_component(CMAKE_FIND_ROOT_PATH "${CMAKE_FIND_ROOT_PATH}" DIRECTORY)
if(UNIX)
  set(CMAKE_FIND_ROOT_PATH "${CMAKE_FIND_ROOT_PATH}/${CMAKE_TOOLCHAIN_PREFIX}")
  find_program(CMAKE_CROSSCOMPILING_EMULATOR wine64)
  if(NOT CMAKE_CROSSCOMPILING_EMULATOR)
    unset(CMAKE_CROSSCOMPILING_EMULATOR CACHE)
  endif()
endif()
set(CMAKE_INSTALL_PREFIX ${CMAKE_FIND_ROOT_PATH} CACHE PATH
  "Install path prefix, prepended onto install directories."
)
if(NOT WIN32)
  set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
  set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
  set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
  set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
endif()
if(CMAKE_TOOLCHAIN_FILE)
endif()
