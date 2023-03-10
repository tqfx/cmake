function(list_append var)
  foreach(arg ${ARGN})
    list(FIND ${var} ${arg} index)
    if(${index} EQUAL -1)
      list(APPEND ${var} ${arg})
    endif()
  endforeach()
  set(${var} ${${var}} PARENT_SCOPE)
endfunction()

function(list_remove var)
  foreach(arg ${ARGN})
    list(FIND ${var} ${arg} index)
    if(${index} GREATER -1)
      list(REMOVE_ITEM ${var} ${arg})
    endif()
  endforeach()
  set(${var} ${${var}} PARENT_SCOPE)
endfunction()
