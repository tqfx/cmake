function(TARGET_SUPPORTS_RELOCATABLE)
  string(RANDOM RANDOM)
  set(CMAKETMP ${CMAKE_CURRENT_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/${RANDOM})
  get_cmake_property(ENABLED_LANGUAGES ENABLED_LANGUAGES)
  foreach(LANG C ${ENABLED_LANGUAGES})
    if(CMAKE_${LANG}_COMPILER)
      set(CMAKE_COMPILER ${CMAKE_${LANG}_COMPILER})
      break()
    endif()
  endforeach()
  if(NOT CMAKE_COMPILER)
    return()
  endif()
  file(WRITE ${CMAKETMP}/${RANDOM}.c "")
  execute_process(COMMAND ${CMAKE_COMPILER} -nostdlib -o ${RANDOM}.o -r ${RANDOM}.c
    WORKING_DIRECTORY ${CMAKETMP} ERROR_QUIET OUTPUT_QUIET RESULT_VARIABLE result
  )
  if(${result} EQUAL 0)
    set(TARGET_SUPPORTS_RELOCATABLE 1 CACHE INTERNAL "Test TARGET_SUPPORTS_RELOCATABLE")
  else()
    set(TARGET_SUPPORTS_RELOCATABLE 0 CACHE INTERNAL "Test TARGET_SUPPORTS_RELOCATABLE")
  endif()
  file(REMOVE_RECURSE ${CMAKETMP})
endfunction()
if(NOT DEFINED TARGET_SUPPORTS_RELOCATABLE)
  TARGET_SUPPORTS_RELOCATABLE()
endif()
