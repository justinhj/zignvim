# Gemini Context: zignvim

## Project Overview

This project, `zignvim`, is a Zig implementation of the `pynvim` library, which is used for interacting with Neovim. The project is in its very early stages of development. It uses `msgpack.zig` for message packing and unpacking, which is a core part of the Neovim API communication.

The project is structured as both a library and an executable. The core logic is in `src/root.zig`, and the executable entry point is `src/main.zig`.

## Building and Running

The project is built using the Zig build system.

*   **Build the project:**
    ```bash
    zig build
    ```
*   **Run the executable:**
    ```bash
    zig build run
    ```
*   **Run the tests:**
    ```bash
    zig build test
    ```

## Development Conventions

*   The project follows standard Zig coding conventions.
*   The build system is defined in `build.zig`.
*   Dependencies are managed in `build.zig.zon`.
*   Tests are included in the source files and can be run with `zig build test`.
