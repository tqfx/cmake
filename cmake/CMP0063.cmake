# The ``OLD`` behavior for this policy is to ignore the visibility properties for static libraries, object libraries, and executables without exports.
# The ``NEW`` behavior for this policy is to honor the visibility properties for all target types.
if(POLICY CMP0063)
  cmake_policy(SET CMP0063 NEW)
endif()
