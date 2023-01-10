
# Compile and Install of the SystemC Verification Library (SCV)

This repository contains a **make** file for easy compile and install of the [SystemC Verification Library](http://www.accellera.org/downloads/standards/systemc).

This **make** file can build the SCV library on the following systems:
* Linux
* Windows
    * [MSYS2](https://www.msys2.org)/mingw64
    * [MSYS2](https://www.msys2.org)/mingw32

# Get Source Code

## ed_scv

```bash
git clone https://github.com/embed-dsp/ed_scv.git
```

## SCV

```bash
# Enter the ed_scv directory.
cd ed_scv
```

```bash
# Edit the Makefile for selecting the SCV version.
vim Makefile
PACKAGE_VERSION = 2.0.1

# Edit the Makefile for selecting the SystemC version.
vim Makefile
SYSTEMC_VERSION = 2.3.3
```

```bash
# Download SCV source package into src/ directory.
make download
```


# Build

```bash
# Unpack source code into build/ directory.
make prepare
```

```bash
# Configure source code.
# NOTE: We need to use sudo here because configure script tries to create the $(PREFIX) directory!
sudo make configure

# Configure source code for 32-bit compile on a 64-bit system.
# NOTE: We need to use sudo here because configure script tries to create the $(PREFIX) directory!
sudo make configure M=32
```

```bash
# Compile source code using 4 simultaneous jobs (Default).
# NOTE: We need to use sudo here because it was used for configure!
sudo make compile

# Compile source code using 2 simultaneous jobs.
# NOTE: We need to use sudo here because it was used for configure!
sudo make compile J=4
```


# Install

```bash
# Install build products.
sudo make install

# Install 32-bit build products.
sudo make install M=32
```

The SCV package does NOT install correctly according to the
[GNU Coding Standards](https://www.gnu.org/prep/standards/standards.html).
The build products are therefore installed in the following locations in order 
to allow separate installation for different architectures and simple 
interoperability with the SystemC package:

```bash
opt/
└── systemc/
    ├── linux_x86_64/           # 64-bit binaries and libraries for Linux
    │   └── scv-2.0.1/
    │       ├── docs/           # Documentation.
    │       │   ├── ...
    │       │
    │       ├── include/        # Include directory.
    │       │   ├── scv.h
    │       │       ...
    │       ├── lib-linux64/    # Library directory.
    │           ├── libscv.a
    │               ...
    └── linux_x86/              # 32-bit binaries and libraries for Linux
        └── scv-2.0.1/
            ...
```


# Tested System Configurations

System  | M=                | M=32  
--------|-------------------|-------------------
linux   | Fedora-37 64-bit  | 
mingw64 | Windows-11 64-bit |
mingw32 | **FIXME**         |

This has been testes with the following Linux distributions and compilers:
* `Fedora-37 (64-bit)`
    * `gcc-12.2.1`
