function(TARGET_SUPPORTS_RELOCATABLE)
  get_cmake_property(ENABLED_LANGUAGES ENABLED_LANGUAGES)
  foreach(lang C ${ENABLED_LANGUAGES})
    if(CMAKE_${lang}_COMPILER)
      set(CMAKE_COMPILER ${CMAKE_${lang}_COMPILER})
      break()
    endif()
  endforeach()
  if(NOT CMAKE_COMPILER)
    return()
  endif()
  file(WRITE ${CMAKE_BINARY_DIR}/CMakeFiles/CMakeTmp/object.c "\n")
  execute_process(COMMAND ${CMAKE_COMPILER} -o object.o -r object.c
    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/CMakeFiles/CMakeTmp
    ERROR_QUIET OUTPUT_QUIET RESULT_VARIABLE result
  )
  file(REMOVE
    ${CMAKE_BINARY_DIR}/CMakeFiles/CMakeTmp/object.o
    ${CMAKE_BINARY_DIR}/CMakeFiles/CMakeTmp/object.c
  )
  if(${result} EQUAL 0)
    set(TARGET_SUPPORTS_RELOCATABLE 1 CACHE INTERNAL "")
  else()
    set(TARGET_SUPPORTS_RELOCATABLE 0 CACHE INTERNAL "")
  endif()
endfunction()
if(NOT DEFINED TARGET_SUPPORTS_RELOCATABLE)
  TARGET_SUPPORTS_RELOCATABLE()
endif()
