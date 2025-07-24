message(STATUS "Using CPM for retrieving SpdLog")

include(CPM)

CPMAddPackage("gh:gabime/spdlog#v1.11.0")
