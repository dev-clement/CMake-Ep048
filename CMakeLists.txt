cmake_minimum_required(VERSION 3.50)

project(CppProjectTemplate
        VERSION 0.0.1
        LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD          17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS       OFF)

option(ENABLE_TESTING "Enable the unit testing build" ON)
option(ENABLE_WARNINGS "Enable warning upon compilation" ON)
option(ENABLE_WARNINGS_AS_ERRORS "Enable warnings as error upon compilation" OFF)

option(ENABLE_ADDRESS_SANITIZER "Enable address sanitizer" ON)
option(ENABLE_UNDEFINED_SANITIZER "Enable undefined sanitier" ON)
option(ENABLE_LTO "Enable Clang LTO" ON)
option(USE_CPM "Whether to use CPM" ON)

set(LIBRARY_NAME Library)
set(EXECUTABLE_NAME Executable)

set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/")

if (USE_CPM)
    include(AddJsonParserCPM)
else()
    include(AddJsonParser)
endif()

if (USE_CPM)
    include(AddSpdLogCPM)
else()
    include(AddSpdLog)
endif()

if (USE_CPM)
    include(AddFmtCPM)
else()
    include(AddFmt)
endif()

if (USE_CPM)
    include(AddCxxOptsCPM)
else()
    include(AddCxxOpts)
endif()

include(Docs)

if (ENABLE_WARNINGS)
    include(Warning)
endif()

if (ENABLE_ADDRESS_SANITIZER OR ENABLE_UNDEFINED_SANITIZER)
    include(Sanitizers)
    add_sanitizer_flags()
endif()

if (ENABLE_LTO)
    include(LTO)
endif()

add_subdirectory(configure/)
add_subdirectory(my_lib/)
add_subdirectory(app/)
if (ENABLE_TESTING)
    enable_testing()
    add_subdirectory(tests/)
endif()
