
# Compile and Install of the SystemC Verification Library (SCV)

This repository contains a **make** file for easy compile and install of the [SystemC Verification Library](http://www.accellera.org/downloads/standards/systemc).

This **make** file can build the SCV library on the following systems:
* Linux
* Windows
    * [MSYS2](https://www.msys2.org)/mingw64

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
```

```bash
# Compile source code using 8 simultaneous jobs (Default).
# NOTE: We need to use sudo here because it was used for configure!
sudo make compile
```


# Install

The SCV package does NOT install correctly according to the
[GNU Coding Standards](https://www.gnu.org/prep/standards/standards.html).
The build products are therefore installed in the following locations in order 
to allow separate installation for different architectures and simple 
interoperability with the SystemC package:

## Linux

```bash
# Install build products.
sudo make install
```

```bash
/opt/
└── systemc/
    └── linux_x86_64/           # 64-bit binaries and libraries for Linux
        └── scv-2.0.1/
            ├── docs/           # Documentation.
            │   ├── ...
            │
            ├── include/        # Include directory.
            │   ├── scv.h
            │       ...
            ├── lib-linux64/    # Library directory.
                ├── libscv.a
                    ...
```

## Windows: MSYS2/mingw64

```bash
# Install build products.
make install
```

```bash
/c/opt/
└── systemc/
    └── mingw64_x86_64/         # 64-bit binaries and libraries for Windows
        └── scv-2.0.1/
            ├── docs/           # Documentation.
            │   ├── ...
            │
            ├── include/        # Include directory.
            │   ├── scv.h
            │       ...
            ├── lib-linux64/    # Library directory.
                ├── libscv.a
                    ...
```
