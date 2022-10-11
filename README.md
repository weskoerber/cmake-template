# C/C++ CMake Project Template

A minimal CMake project template for your next C/C++ project.

## Features

- Build executables and/or static or dynamic libraries
- Testing with [criterion](https://github.com/Snaipe/Criterion)

## Getting Started

Clone this repo and change the remote URL of this repo to point to your target
remote:

```shell
git clone https://github.com/weskoerber/cmake-template
git remote set-url origin <new_url>
```

### Prerequisites

* A C/C++ compiler
* CMake (version 3.22)
    * The minimum required CMake version may be changed in the source files,
    but make sure you know what your doing! Setting the CMake version to an
    older version could introduce issues
* [Criterion](https://github.com/Snaipe/Criterion)

### Building

The default CMake build configuration builds the `cmake-template` binary and
the `hello` library (static, by default). The `cmake-template` binary is placed
in the `bin` directory, and the `hello` library is placed in the `lib`
directory:

```shell
cmake -S . -B build
```

The `hello` library is built as a static library by default. Dynamic libraries
may be built instead by setting the `BUILD_SHARED_LIBS` CMake cache entry. The
library is placed in the `lib` directory:

```shell
cmake -S . -B build -DBUILD_SHARED_LIBS=ON
```

The `cmake-template-test` test binary is not built by default, but may be
built by setting the `BUILD_TEST` CMake cache entry. The `cmake_template_test`
binary is placed in the `bin` directory:

```
cmake -S . -B build -DBUILD_TEST
```

## Project Structure

### Build Artifacts

Build artifact output locations are set in the top-level `CMakeLists.txt`:

```cmake
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/lib)
```

### Directories

#### `cmake`

Additional CMake files live here.

#### `src`

The top-level source directory. Implementations and private headers live here.

#### `include`

The top-level include directory. Public headers live here.

#### `test`

The code for the [criterion](https://github.com/Snaipe/Criterion) test binary
live here.

#### `src/hello`

The code for the sample library lives here. By default it is not linked to
either the main `cmake-template` binary or the `cmake-template-test` binary.
