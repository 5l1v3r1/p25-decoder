INCLUDE(FindPkgConfig)

if(NOT LIBOP25_REPEATER_FOUND)
  pkg_check_modules (LIBOP25_REPEATER_PKG libop25_repeater)
  FIND_PATH(LIBOP25_REPEATER_INCLUDE_DIR
    NAMES op25_repeater/api.h
    HINTS $ENV{GNURADIO_RUNTIME_DIR}/include
          ${PC_GNURADIO_RUNTIME_INCLUDE_DIRS}
          ${CMAKE_INSTALL_PREFIX}/include
    PATHS /usr/local/include
          /usr/include
  )

  find_library(LIBOP25_REPEATER_LIBRARIES
    NAMES gnuradio-op25_repeater
    HINTS $ENV{GNURADIO_RUNTIME_DIR}/lib
          ${PC_GNURADIO_RUNTIME_LIBDIR}
          ${CMAKE_INSTALL_PREFIX}/lib/
          ${CMAKE_INSTALL_PREFIX}/lib64/
    PATHS /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
  )
  
message(STATUS "Pkg: ${LIBOP25_REPEATER_PKG}, ${LIBOP25_REPEATER_PKG_INCLUDE_DIRS}, ${LIBOP25_REPEATER_PKG_LIBRARY_DIRS}")
message(STATUS "Vars: ${LIBOP25_REPEATER_INCLUDE_DIR}, ${LIBOP25_REPEATER_LIBRARIES}")
if(LIBOP25_REPEATER_INCLUDE_DIR AND LIBOP25_REPEATER_LIBRARIES)
  set(LIBOP25_REPEATER_FOUND TRUE CACHE INTERNAL "libop25 repeater found")
  message(STATUS "Found libop25 repeater: ${LIBOP25_REPEATER_INCLUDE_DIR}, ${LIBOP25_REPEATER_LIBRARIES}")
else(LIBOP25_REPEATER_INCLUDE_DIR AND LIBOP25_REPEATER_LIBRARIES)
  set(LIBOP25_REPEATER_FOUND FALSE CACHE INTERNAL "libop25 repeater found")
  message(STATUS "libop25 repeater not found.")
endif(LIBOP25_REPEATER_INCLUDE_DIR AND LIBOP25_REPEATER_LIBRARIES)

mark_as_advanced(LIBOP25_REPEATER_INCLUDE_DIR LIBOP25_REPEATER_LIBRARIES)

endif(NOT LIBOP25_REPEATER_FOUND)
