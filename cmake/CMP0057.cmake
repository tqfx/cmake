# The ``OLD`` behavior for this policy is to ignore the IN_LIST operator.
# The ``NEW`` behavior is to interpret the IN_LIST operator.
if(POLICY CMP0057)
  cmake_policy(SET CMP0057 NEW)
endif()
