# The ``OLD`` behavior for this policy is to leave ``VERSION`` variables untouched.
# The ``NEW`` behavior for this policy is to set ``VERSION`` as documented by the ``project()`` command.
if(POLICY CMP0048)
  cmake_policy(SET CMP0048 NEW)
endif()
