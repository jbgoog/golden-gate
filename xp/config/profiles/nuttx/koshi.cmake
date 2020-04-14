include(${CMAKE_CURRENT_LIST_DIR}/darkhorse.cmake)

# Platform options
set(GG_PORTS_ENABLE_POSIX_MUTEX FALSE CACHE BOOL "" FORCE)
set(GG_PORTS_ENABLE_POSIX_SEMAPHORE FALSE CACHE BOOL "" FORCE)
set(GG_PORTS_ENABLE_POSIX_SHARED_QUEUE FALSE CACHE BOOL "" FORCE)

