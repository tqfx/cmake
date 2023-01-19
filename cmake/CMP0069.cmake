# The ``OLD`` behavior for this policy is to add IPO flags only for Intel compiler on Linux.
# The ``NEW`` behavior for this policy is to add IPO flags for the current compiler or produce an error if CMake does not know the flags.
if(POLICY CMP0069)
  cmake_policy(SET CMP0069 NEW)
endif()
