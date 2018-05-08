
# Compile and Install of the SystemC Verification Library (SCV)

This repository contains make file for easy compile and install of the [SystemC Verification Library](http://www.accellera.org/downloads/standards/systemc).


# Get Source Code

## ed_scv

```bash
git clone https://github.com/embed-dsp/ed_scv.git
```

## SCV

```bash
# Enter the ed_scv directory.
cd ed_scv

# Edit the Makefile for selecting the SCV source version.
vim Makefile
PACKAGE_VERSION = 2.0.1

# Edit the Makefile for selecting the SystemC installation.
vim Makefile
SYSTEMC = /opt/systemc/$(ARCH)/systemc-2.3.2
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
# Configure source code for 64-bit compile (Default: M=64).
# NOTE: We need to use sudo here because configure script tries to create the $(PREFIX) directory!
sudo make configure
sudo make configure M=64

# Configure source code for 32-bit compile.
# NOTE: We need to use sudo here because configure script tries to create the $(PREFIX) directory!
sudo make configure M=32
```

```bash
# Compile source code using 4 simultaneous jobs (Default: J=4).
# NOTE: We need to use sudo here because it was used for configure!
sudo make compile
sudo make compile J=4
```


# Install

```bash
# Install 64-bit build products (Default: M=64).
sudo make install
sudo make install M=64

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


# Notes

This has been testes with the following Linux distributions and compilers:
* `Fedora-27 (64-bit)`
    * `gcc-7.2.1`
    * `gcc-7.3.1`
