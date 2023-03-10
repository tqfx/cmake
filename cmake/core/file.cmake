function(file_source var)
  cmake_parse_arguments(FILE "RECURSE" "RELATIVE" "OPTIONS;DIR;EXT" ${ARGN})
  get_cmake_property(ENABLED_LANGUAGES ENABLED_LANGUAGES)

  string(REPLACE ";." ";" FILE_EXT ";${FILE_EXT};")
  foreach(lang ${ENABLED_LANGUAGES})
    list(APPEND FILE_EXT ${CMAKE_${lang}_SOURCE_FILE_EXTENSIONS})
  endforeach()
  list(REMOVE_DUPLICATES FILE_EXT)

  if(FILE_RELATIVE)
    list(APPEND FILE_OPTIONS RELATIVE ${FILE_RELATIVE})
  endif()

  foreach(dir ${FILE_DIR} ${FILE_UNPARSED_ARGUMENTS})
    foreach(ext ${FILE_EXT})
      list(APPEND FILE_OPTIONS "${dir}/*.${ext}")
    endforeach()
  endforeach()

  if(FILE_RECURSE)
    file(GLOB_RECURSE FILES ${FILE_OPTIONS})
  else()
    file(GLOB FILES ${FILE_OPTIONS})
  endif()

  set(${var} ${FILES} PARENT_SCOPE)
endfunction()

function(file_header var)
  cmake_parse_arguments(FILE "RECURSE" "RELATIVE" "OPTIONS;DIR;EXT" ${ARGN})
  get_cmake_property(ENABLED_LANGUAGES ENABLED_LANGUAGES)

  string(REPLACE ";." ";" FILE_EXT ";${FILE_EXT};")
  list(FIND ENABLED_LANGUAGES C index)
  if(${index} GREATER -1)
    list(APPEND FILE_EXT h)
  endif()
  list(FIND ENABLED_LANGUAGES CXX index)
  if(${index} GREATER -1)
    list(APPEND FILE_EXT H h++ hh hpp hxx ipp tpp)
  endif()
  list(REMOVE_DUPLICATES FILE_EXT)

  if(FILE_RELATIVE)
    list(APPEND FILE_OPTIONS RELATIVE ${FILE_RELATIVE})
  endif()

  foreach(dir ${FILE_DIR} ${FILE_UNPARSED_ARGUMENTS})
    foreach(ext ${FILE_EXT})
      list(APPEND FILE_OPTIONS "${dir}/*.${ext}")
    endforeach()
  endforeach()

  if(FILE_RECURSE)
    file(GLOB_RECURSE FILES ${FILE_OPTIONS})
  else()
    file(GLOB FILES ${FILE_OPTIONS})
  endif()

  set(${var} ${FILES} PARENT_SCOPE)
endfunction()

function(file_scaner var)
  cmake_parse_arguments(FILE "RECURSE" "RELATIVE" "OPTIONS;DIR;EXT" ${ARGN})
  get_cmake_property(ENABLED_LANGUAGES ENABLED_LANGUAGES)

  string(REPLACE ";." ";" FILE_EXT ";${FILE_EXT};")
  list(FIND ENABLED_LANGUAGES C index)
  if(${index} GREATER -1)
    list(APPEND FILE_EXT h)
  endif()
  list(FIND ENABLED_LANGUAGES CXX index)
  if(${index} GREATER -1)
    list(APPEND FILE_EXT H h++ hh hpp hxx ipp tpp)
  endif()
  foreach(lang ${ENABLED_LANGUAGES})
    list(APPEND FILE_EXT ${CMAKE_${lang}_SOURCE_FILE_EXTENSIONS})
  endforeach()
  list(REMOVE_DUPLICATES FILE_EXT)

  if(FILE_RELATIVE)
    list(APPEND FILE_OPTIONS RELATIVE ${FILE_RELATIVE})
  endif()

  foreach(dir ${FILE_DIR} ${FILE_UNPARSED_ARGUMENTS})
    foreach(ext ${FILE_EXT})
      list(APPEND FILE_OPTIONS "${dir}/*.${ext}")
    endforeach()
  endforeach()

  if(FILE_RECURSE)
    file(GLOB_RECURSE FILES ${FILE_OPTIONS})
  else()
    file(GLOB FILES ${FILE_OPTIONS})
  endif()

  set(${var} ${FILES} PARENT_SCOPE)
endfunction()

function(file_filter var)
  cmake_parse_arguments(FILE "" "VAR" "EXT" ${ARGN})
  string(REPLACE ";." ";" FILE_EXT ";${FILE_EXT};")

  set(FILES)
  foreach(arg ${${FILE_VAR}} ${FILE_UNPARSED_ARGUMENTS})
    get_filename_component(ext ${arg} EXT)
    string(REGEX REPLACE "^\\." "" ext "${ext}")
    list(FIND FILE_EXT "${ext}" index)
    if(${index} GREATER -1)
      list(APPEND FILES ${arg})
    endif()
  endforeach()

  set(${var} ${FILES} PARENT_SCOPE)
endfunction()
