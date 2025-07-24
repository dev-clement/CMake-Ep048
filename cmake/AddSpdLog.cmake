include(FetchContent)

FetchContent_Declare(
    spdlog
    GIT_REPOSITORY	https://github.com/gabime/spdlog
    GIT_TAG			v1.11.0
    GIT_SHALLOW     TRUE
)

FetchContent_MakeAvailable(spdlog)
