# Introduction

This repo contains the all of the source code for FreeType C Library. But the main asset of this repository
is the `build.zig` file, which contains all the necessary instructions to build the FreeType C Library
using the Zig Build System.

The `build.zig` is not fully complete, but it contains all the basic steps to build the library.
In theory, `build.zig` should be equivalent to `CMakeLists.txt` file, which is the official build file used
by the development team, to build the FreeType project using CMake.

In essence, you clone the repository, then cd to the created folder, then, you call the `zig` compiler to build the project:

```bash
git clone https://github.com/pedropark99/freetype-zig.git
cd freetype-zig
zig build
```
