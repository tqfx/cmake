# The ``OLD`` behavior for this policy is to place MSVC runtime library flags in the default ``CMAKE_<LANG>_FLAGS_<CONFIG>`` cache entries and ignore the ``CMAKE_MSVC_RUNTIME_LIBRARY`` abstraction.
# The ``NEW`` behavior for this policy is to *not* place MSVC runtime library flags in the default cache entries and use the abstraction instead.
if(POLICY CMP0091)
  cmake_policy(SET CMP0091 NEW)
endif()
