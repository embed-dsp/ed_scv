
# Copyright (c) 2018-2024 embed-dsp, All Rights Reserved.
# Author: Gudmundur Bogason <gb@embed-dsp.com>


PACKAGE_NAME = scv

PACKAGE_VERSION = 2.0.1

PACKAGE = $(PACKAGE_NAME)-$(PACKAGE_VERSION)

SYSTEMC_VERSION = 2.3.3

# ==============================================================================

# Determine system.
SYSTEM = unknown
ifeq ($(findstring Linux, $(shell uname -s)), Linux)
	SYSTEM = linux
endif
ifeq ($(findstring MINGW64, $(shell uname -s)), MINGW64)
	SYSTEM = mingw64
endif

# Determine machine.
MACHINE = $(shell uname -m)

# ==============================================================================

# Set number of simultaneous jobs (Default 4)
ifeq ($(J),)
	J = 8
endif

# System configuration.
CONFIGURE_FLAGS =

# NOTE: We use this C++ compiler flag to match the one used in SystemC.
CXXFLAGS = -std=gnu++17

# Configuration for linux system.
ifeq ($(SYSTEM),linux)
	# Compiler.
	CC = /usr/bin/gcc
	CXX = /usr/bin/g++

	# Installation directory.
	INSTALL_DIR = /opt
endif

# Configuration for mingw64 system.
ifeq ($(SYSTEM),mingw64)
	# Compiler.
	CC = /mingw64/bin/gcc
	CXX = /mingw64/bin/g++

	# Installation directory.
	INSTALL_DIR = /c/opt
endif

# Architecture.
ARCH = $(SYSTEM)_$(MACHINE)

SYSTEMC = $(INSTALL_DIR)/systemc/$(ARCH)/systemc-$(SYSTEMC_VERSION)
PREFIX = $(INSTALL_DIR)/systemc/$(ARCH)/$(PACKAGE)

# ==============================================================================

all:
	@echo "ARCH   = $(ARCH)"
	@echo "PREFIX = $(PREFIX)"
	@echo ""
	@echo "## Get Source Code"
	@echo "make download"
	@echo ""
	@echo "## Build"
	@echo "make prepare"
	@echo "[sudo] make configure"
	@echo "[sudo] make compile [J=...]"
	@echo ""
	@echo "## Install"
	@echo "[sudo] make install"
	@echo ""
	@echo "## Cleanup"
	@echo "make clean"
	@echo "make distclean"
	@echo ""


.PHONY: download
download:
	-mkdir src
	cd src && wget -nc http://www.accellera.org/images/downloads/standards/systemc/$(PACKAGE).tar.gz


.PHONY: prepare
prepare:
	-mkdir build
	cd build && tar zxf ../src/$(PACKAGE).tar.gz
	# We need to patch this file so that it compiles with mingw64
	patch build/$(PACKAGE)/src/scv/scv_random.cpp src/scv_random.cpp.patch


.PHONY: configure
configure:
	cd build/$(PACKAGE) && ./configure CC=$(CC) CXX=$(CXX) CXXFLAGS=$(CXXFLAGS) --prefix=$(PREFIX) --disable-shared --with-systemc=$(SYSTEMC) $(CONFIGURE_FLAGS)


.PHONY: compile
compile:
	cd build/$(PACKAGE) && make -j$(J)


.PHONY: install
install:
	-cd build/$(PACKAGE) && make install


.PHONY: clean
clean:
	# -rm -rf build
	cd build/$(PACKAGE) && make clean


.PHONY: distclean
distclean:
	cd build/$(PACKAGE) && make distclean
