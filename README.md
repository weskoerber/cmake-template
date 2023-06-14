# C/C++ CMake Project Template

A minimal CMake project template for your next C/C++ project.

## Features

- Build executables and/or static or dynamic libraries
- Testing with [criterion](https://github.com/Snaipe/Criterion)
- Private/Interface header includes
    - Private includes (from within the library):
        ```cpp
        #include "hello.h"
        ```
    - Public includes (outside the library, e.g `main`):
        ```cpp
        #include "hello/hello.h"
        ```

## Getting Started

Clone this repo and change the remote URL of this repo to point to your target
remote:

```shell
git clone https://github.com/weskoerber/cmake-template
git remote set-url origin <new_url>
```

### Prerequisites

- A C/C++ compiler
- CMake (version 3.22)
    - The minimum required CMake version may be changed in the source files

### Building

The default CMake build configuration builds the `cmake-template` binary and
the `hello` library (static, by default):

```shell
cmake -S . -B build
```

The `hello` library is built as a static library by default. Dynamic libraries
may be built instead by setting the `BUILD_SHARED_LIBS` CMake cache entry:

```shell
cmake -S . -B build -DBUILD_SHARED_LIBS=ON
```

The `cmake-template-test` test binary is not built by default, but may be
built by setting the `BUILD_TESTS` CMake cache entry:

```
cmake -S . -B build -DBUILD_TESTS
```

## Project Structure

### Build Artifacts

Build artifact output locations are set in the top-level `CMakeLists.txt`:

```cmake
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
```

### Directories

#### `cmake`

Additional CMake files live here.

#### `src`

The top-level source directory. Implementations and private headers live here.

#### `include`

The top-level include directory. Public headers for libraries live here.

#### `test`

The code for the [criterion](https://github.com/Snaipe/Criterion) test binary
live here.

#### `src/hello`

The code for the sample library lives here. Implementations and private headers
for the `hello` library live here.
