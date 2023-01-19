#.rst:
# Findmath
# --------
#
# Find math libraries.
#
# Result Variables
# ^^^^^^^^^^^^^^^^
#
# This module defines the following variables:
#
# ``MATH_LIBRARY``
#
find_library(math_LIBRARY NAMES m DOC "math library" NO_CMAKE_PATH)
find_library(MATH_LIBRARY NAMES m DOC "math library")
mark_as_advanced(MATH_LIBRARY math_LIBRARY)

# https://devblogs.microsoft.com/cppblog/c99-library-support-in-visual-studio-2013
# https://learn.microsoft.com/cpp/overview/visual-cpp-language-conformance
if(NOT MATH_LIBRARY AND WIN32 AND CMAKE_C_COMPILER_ID MATCHES "TinyCC")
  find_file(MATH_LIBRARY NAMES ucrtbase.dll msvcrt.dll)
endif()

if(NOT MATH_LIBRARY AND WIN32)
  unset(MATH_LIBRARY CACHE)
elseif(NOT MATH_LIBRARY)
  set(MATH_LIBRARY m)
endif()
