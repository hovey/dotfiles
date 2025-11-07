# Build automesh on macOS

2025-10-24

error: failed to run custom build command for `netcdf-src v0.4.3`

Caused by:
  process didn't exit successfully: `/Users/chovey/autotwin/automesh/target/debug/build/netcdf-src-06388bea5c46149c/build-script-build` (exit status: 101)
  --- stdout
  cargo::rerun-if-changed=build.rs
  CMAKE_TOOLCHAIN_FILE_aarch64-apple-darwin = None
  CMAKE_TOOLCHAIN_FILE_aarch64_apple_darwin = None
  HOST_CMAKE_TOOLCHAIN_FILE = None
  CMAKE_TOOLCHAIN_FILE = None
  CMAKE_GENERATOR_aarch64-apple-darwin = None
  CMAKE_GENERATOR_aarch64_apple_darwin = None
  HOST_CMAKE_GENERATOR = None
  CMAKE_GENERATOR = None
  CMAKE_PREFIX_PATH_aarch64-apple-darwin = None
  CMAKE_PREFIX_PATH_aarch64_apple_darwin = None
  HOST_CMAKE_PREFIX_PATH = None
  CMAKE_PREFIX_PATH = None
  CMAKE_aarch64-apple-darwin = None
  CMAKE_aarch64_apple_darwin = None
  HOST_CMAKE = None
  CMAKE = None
  running: cd "/Users/chovey/autotwin/automesh/target/debug/build/netcdf-src-ea66a4c622c4aa1e/out/build" && CMAKE_PREFIX_PATH="" LC_ALL="C" "cmake" "/Users/chovey/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/netcdf-src-0.4.3/source" "-DCMAKE_OSX_ARCHITECTURES=arm64" "-DBUILD_SHARED_LIBS=OFF" "-DNETCDF_FIND_SHARED_LIBS=OFF" "-DNETCDF_BUILD_UTILITIES=OFF" "-DNETCDF_ENABLE_EXAMPLES=OFF" "-DNETCDF_ENABLE_DAP_REMOTE_TESTS=OFF" "-DNETCDF_ENABLE_TESTS=OFF" "-DNETCDF_ENABLE_EXTREME_NUMBERS=OFF" "-DNETCDF_ENABLE_FILTER_TESTING=OFF" "-DNETCDF_ENABLE_PARALLEL_TESTS=OFF" "-DNETCDF_ENABLE_FILTER_TESTING=OFF" "-DENABLE_BASH_SCRIPT_TESTING=OFF" "-DNETCDF_NETCDF_ENABLE_PLUGINS=OFF" "-DPLUGIN_INSTALL_DIR=OFF" "-DHDF5_ROOT=/opt/homebrew/opt/hdf5/include/../" "-DHDF5_USE_STATIC_LIBRARIES=ON" "-DNETCDF_ENABLE_LIBXML2=OFF" "-DNETCDF_ENABLE_PARALLEL4=OFF" "-DNETCDF_ENABLE_NCZARR=ON" "-DNETCDF_ENABLE_NCZARR_ZIP=OFF" "-DNETCDF_ENABLE_S3=OFF" "-DNETCDF_ENABLE_DAP=OFF" "-DNETCDF_ENABLE_BYTERANGE=OFF" "-DZLIB_ROOT=/Users/chovey/autotwin/automesh/target/debug/build/libz-sys-ffad6c725bf22168/out/include/.." "-DCMAKE_INSTALL_PREFIX=/Users/chovey/autotwin/automesh/target/debug/build/netcdf-src-ea66a4c622c4aa1e/out" "-DCMAKE_C_FLAGS= -ffunction-sections -fdata-sections -fPIC --target=arm64-apple-macosx -mmacosx-version-min=26.0" "-DCMAKE_C_COMPILER=/usr/bin/cc" "-DCMAKE_CXX_FLAGS= -ffunction-sections -fdata-sections -fPIC --target=arm64-apple-macosx -mmacosx-version-min=26.0" "-DCMAKE_CXX_COMPILER=/usr/bin/c++" "-DCMAKE_ASM_FLAGS= -ffunction-sections -fdata-sections -fPIC --target=arm64-apple-macosx -mmacosx-version-min=26.0" "-DCMAKE_ASM_COMPILER=/usr/bin/cc" "-DCMAKE_BUILD_TYPE=RelWithDebInfo"
  -- The C compiler identification is AppleClang 17.0.0.17000319
  -- The CXX compiler identification is AppleClang 17.0.0.17000319
  -- Detecting C compiler ABI info
  -- Detecting C compiler ABI info - done
  -- Check for working C compiler: /usr/bin/cc - skipped
  -- Detecting C compile features
  -- Detecting C compile features - done
  -- Detecting CXX compiler ABI info
  -- Detecting CXX compiler ABI info - done
  -- Check for working CXX compiler: /usr/bin/c++ - skipped
  -- Detecting CXX compile features
  -- Detecting CXX compile features - done
  -- Checking for Deprecated Options
  -- Performing Test LIBTOOL_HAS_NO_UNDEFINED
  -- Performing Test LIBTOOL_HAS_NO_UNDEFINED - Failed
  -- Performing Test CC_HAS_WCONVERSION
  -- Performing Test CC_HAS_WCONVERSION - Success
  -- Performing Test CC_HAS_SHORTEN_64_32
  -- Performing Test CC_HAS_SHORTEN_64_32 - Success
  -- NETCDF_ENABLE_PLUGINS: OFF
  -- Found HDF5: hdf5-static (found version "1.14.6") found components: C HL
  -- Found HDF5 version: 1.14.6
  -- Using HDF5 include dir: /opt/homebrew/opt/hdf5/include
  -- Performing Test CMAKE_HAVE_LIBC_PTHREAD
  -- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success
  -- Found Threads: TRUE
  -- Checking for HDF5 config header
  -- Looking for H5public.h
  -- Looking for H5public.h - found
  -- Using H5public.h to check for feature macros
  -- Checking for H5_HAVE_ZLIB_H
  -- Performing Test _has_H5_HAVE_ZLIB_H
  -- Performing Test _has_H5_HAVE_ZLIB_H - Success
  -- Found ZLIB: /Users/chovey/autotwin/automesh/target/debug/build/libz-sys-ffad6c725bf22168/out/lib/libz.a (found version "1.3.1")
  -- HDF5 has zlib.
  -- Checking for H5_HAVE_FILTER_SZIP
  -- Performing Test _has_H5_HAVE_FILTER_SZIP
  -- Performing Test _has_H5_HAVE_FILTER_SZIP - Success
  -- -- HDF5_UTF8_PATHS (HDF5 version 1.10.6+): ON
  -- Looking for H5Pset_all_coll_metadata_ops
  -- Configuring incomplete, errors occurred!

  --- stderr
  CMake Error at /Users/chovey/autotwin/automesh/target/debug/build/netcdf-src-ea66a4c622c4aa1e/out/build/CMakeFiles/CMakeScratch/TryCompile-pUZBkW/cmTC_5ed09Targets.cmake:31 (set_target_properties):
    The link interface of target "hdf5-static" contains:

      ZLIB::ZLIB

    but the target was not found.  Possible reasons include:

      * There is a typo in the target name.
      * A find_package call is missing for an IMPORTED target.
      * An ALIAS target is missing.

  Call Stack (most recent call first):
    /Users/chovey/autotwin/automesh/target/debug/build/netcdf-src-ea66a4c622c4aa1e/out/build/CMakeFiles/CMakeScratch/TryCompile-pUZBkW/CMakeLists.txt:16 (include)


  CMake Error at /opt/homebrew/share/cmake/Modules/CheckSymbolExists.cmake:193 (try_compile):
    Failed to generate test project build system.
  Call Stack (most recent call first):
    /opt/homebrew/share/cmake/Modules/CheckSymbolExists.cmake:98 (__CHECK_SYMBOL_EXISTS_IMPL)
    cmake/dependencies.cmake:200 (check_symbol_exists)
    CMakeLists.txt:923 (include)



  thread 'main' panicked at /Users/chovey/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/cmake-0.1.54/src/lib.rs:1119:5:

  command did not execute successfully, got: exit status: 1

  build script failed, must exit now
  note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace


## Claude

This is a CMake/dependency configuration error with the netcdf-src crate. 
The issue is that HDF5 is looking for ZLIB::ZLIB as a CMake target,
but it's not being found properly even though zlib is present.

### Solution 1: Use System NetCDF (Recommended)

```bash
# Install netcdf via Homebrew
brew install netcdf

# Set environment variable to use system netcdf
export NETCDF_STATIC=0
export NETCDF_DIR=/opt/homebrew

# Then build
cargo clean
cargo build
```

This did not work, same error.

### Solution 2: Fix the CMake Configuration

The problem is that the statically-built `zlib` isn't exposing the `ZLIB::ZLIB` target properly:

```bash
# Install zlib via Homebrew (even though macOS has it)
brew install zlib

# Set environment variables to help CMake find it
export ZLIB_ROOT=/opt/homebrew/opt/zlib
export HDF5_ROOT=/opt/homebrew/opt/hdf5

cargo clean
cargo build
```

This did not work, same error.

### Solution 3: Disable NetCDF Features

If you don't need NetCDF support, you might be able to disable it:

```bash
cargo build --no-default-features
```

This did not work, same error.

### Solution 4: Use Dynamic Linking

```bash
export HDF5_DIR=/opt/homebrew/opt/hdf5
export NETCDF_DIR=/opt/homebrew/opt/netcdf
export RUSTFLAGS="-L/opt/homebrew/lib"

cargo build
```

This did not work, same error.

### Most likely fix

On a macOS with homebrew, try

```bash
# Ensure dependencies are installed
brew install hdf5 netcdf zlib

# Set environment to prefer system libraries
export NETCDF_STATIC=0
export HDF5_DIR=/opt/homebrew/opt/hdf5
export NETCDF_DIR=/opt/homebrew/opt/netcdf

# Clean and rebuild
cargo clean
cargo build
```

The core issues is that the build script is trying to compile netcdf statically but
the CMake configuration for HDF5 isn't properly exposing its ZLIB dependency.  Using
system libraries avoids this problem entirely.

This did not work, same error.


### Solution: Patch the CMake Configuration

Let's try a more targeted approach. The issue is that the CMake build for
netcdf-src can't properly link the statically-built zlib with HDF5's CMake targets.

Try setting these environment variables to force CMake to find ZLIB properly:

```bash
cargo clean

# Point to Homebrew's zlib and create the ZLIB::ZLIB target
export ZLIB_ROOT=/opt/homebrew/opt/zlib
export ZLIB_LIBRARY=/opt/homebrew/opt/zlib/lib/libz.dylib
export ZLIB_INCLUDE_DIR=/opt/homebrew/opt/zlib/include

# Also set HDF5 to use shared libraries instead of static
export HDF5_DIR=/opt/homebrew/opt/hdf5
export HDF5_USE_STATIC_LIBRARIES=OFF

cargo build
```

Didn't work.

### Alternative: Patch the Cargo.toml

THIS WORKED!! 2025-10-24 begin

If the above doesn't work, you might need to fork/patch the dependency.
Edit Cargo.toml and try to use a different version of netcdf or disable it:

```toml
[dependencies]
# Comment out or modify netcdf dependency
# netcdf = "..."
```

The `automesh` Cargo.toml has this line:

netcdf = { version = "=0.11.1", features = ["ndarray", "static"] }

which Claude says is a problem since it is forcing static linking with `features = ["static"]`.
Let's try removing that feature:

Updated line:
netcdf = { version = "=0.11.1", features = ["ndarray"] }

Then,

```bash
# Make sure netcdf is installed via Homebrew
brew install netcdf

# Set the environment variable to use system netcdf
export NETCDF_DIR=/opt/homebrew

# Clean and build
cargo clean
cargo build
```

This will use the dynamically-linked netcdf from Homebrew instead of trying to
build it statically, which should avoid the CMake ZLIB::ZLIB target issue entirely.

THIS FINALLY WORKED!!
THIS WORKED!! 2025-10-24 end

If you still get errors about netcdf not being found, also try:

```bash
export PKG_CONFIG_PATH=/opt/homebrew/lib/pkgconfig
export DYLD_LIBRARY_PATH=/opt/homebrew/lib
```

