
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
PACKAGE = scv-2.0.1

# Edit the Makefile for selecting the SystemC installation.
vim Makefile
SYSTEMC = /opt/systemc/systemc-2.3.2

# Download SCV source package into src/ directory.
make download
```

Build
=====
```bash
# Unpack source code into build/ directory.
make prepare

# Configure source code for 64-bit compile (Default: M=64).
make configure
make configure M=64

# Configure source code for 32-bit compile.
make configure M=32

# Compile source code using 4 simultaneous jobs (Default: J=4).
make compile
make compile J=4
```

Install
=======
```bash
# Install build products.
sudo make install
```

The build products are installed in the following locations:
```bash
opt
└── systemc
    └── scv-2.0.1
        ├── docs            # Documentation.
        │   ├── ...
        │
        ├── include         # Include files.
        │   ├── scv.h
        │       ...
        ├── lib-linux64     # 64-bit libraries for Linux
        │   ├── libscv.a
        │       ...
        ├── lib-linux       # 32-bit libraries for Linux
        │   ├── libscv.a
        │       ...
```

Notes
=====
