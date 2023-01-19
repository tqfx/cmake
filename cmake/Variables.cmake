get_cmake_property(variables VARIABLES)
foreach(variable ${variables})
    message("${variable}=${${variable}}")
endforeach()
