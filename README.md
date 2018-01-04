
Compile and Install of the SystemC Verification Library
=======================================================

This repository contains make file for easy compile and install of the SystemC Verification Library.

Get tool and source code
========================

## ed_scv
```bash
git clone https://github.com/embed-dsp/ed_scv.git
```

## SCV Source
```bash
# Enter the ed_scv directory.
cd ed_scv

# Edit the Makefile for selecting the SCV source version.
vim Makefile
PACKAGE_VERSION = 2.0.1

# Edit the Makefile for selecting the SystemC installation.
vim Makefile
SYSTEMC = /opt/systemc/$(ARCH)/systemc-2.3.2

# Download SCV source package into src/ directory.
make download
```

Build
=====
```bash
# Unpack source code into build/ directory.
make prepare

# Configure source code.
# NOTE: We need to use sudo here because configure tries to create the $(PREFIX) directory!
sudo make configure

# Compile source code using 4 simultaneous jobs (Default: J=4).
# NOTE: We need to use sudo here because it was used for configure!
sudo make compile
sudo make compile J=4
```

Install
=======
```bash
# Install build products.
sudo make install
```

The build products are installed in the following locations:

FIXME: Why this particular directory structure ...
```bash
opt
└── systemc
    ├── linux_x86_64            # 64-bit binaries and libraries for Linux
    │   └── scv-2.0.1
    │       ├── docs            # Documentation.
    │       │   ├── ...
    │       │
    │       ├── include         # Include directory.
    │       │   ├── scv.h
    │       │       ...
    │       ├── lib-linux64     # Library directory.
    │           ├── libscv.a
    │               ...
    └── linux_x86               # 32-bit binaries and libraries for Linux
        └── scv-2.0.1
            ...
```

Notes
=====

This has been testes with the following Linux distributions and compilers:
* `Fedora-27 (64-bit)` and `gcc-7.2.1`
