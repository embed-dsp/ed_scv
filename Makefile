
# Copyright (c) 2018 embed-dsp
# All Rights Reserved

# $Author:   Gudmundur Bogason <gb@embed-dsp.com> $
# $Date:     $
# $Revision: $

# Package name and version number
PACKAGE = scv-2.0.1


# Select between 32-bit or 64-bit machine (Default 64-bit)
ifeq ($(M),)
	M = 64
endif


# Set number of simultaneous jobs (Default 4)
ifeq ($(J),)
	J = 4
endif


# SystemC Installation
ifeq ($(SYSTEMC),)
	SYSTEMC = /opt/systemc/systemc-2.3.2
endif


CC = /usr/bin/gcc
CXX = /usr/bin/g++

PREFIX = /opt/systemc/$(PACKAGE)

ifeq ($(M), 64)
	# CFLAGS = "-Wall -O2 -m64"
	# CXXFLAGS = "-Wall -O2 -m64"
	EXEC_PREFIX = $(PREFIX)/linux_x86_64
	CONFIGURE_FLAGS =
else
	# CFLAGS = "-Wall -O2 -m32"
	# CXXFLAGS = "-Wall -O2 -m32"
	EXEC_PREFIX = $(PREFIX)/linux_x86
	CONFIGURE_FLAGS = --host=i686-linux-gnu
endif


all:
	@echo ""
	@echo "## First time"
	@echo "make download"
	@echo "make prepare"
	@echo "make configure [M=...]"
	@echo "make compile [J=...]"
	@echo "sudo make install"
	@echo ""
	@echo "## Any other time"
	@echo "make clean"
	@echo "make prepare"
	@echo "make configure [M=...]"
	@echo "make compile [J=...]"
	@echo "sudo make install"
	@echo ""


.PHONY: download
download:
	-mkdir src
	cd src && wget -nc http://www.accellera.org/images/downloads/standards/systemc/$(PACKAGE).tar.gz


.PHONY: prepare
prepare:
	-mkdir build
	cd build && tar zxf ../src/$(PACKAGE).tar.gz


.PHONY: configure
configure:
	cd build/$(PACKAGE) && ./configure CC=$(CC) CFLAGS=$(CFLAGS) CXX=$(CXX) CXXFLAGS=$(CXXFLAGS) --prefix=$(PREFIX) --exec_prefix=$(EXEC_PREFIX) --disable-shared --with-systemc=$(SYSTEMC) $(CONFIGURE_FLAGS)


.PHONY: compile
compile:
	cd build/$(PACKAGE) && make -j$(J)


.PHONY: install
install:
	-cd build/$(PACKAGE) && make install


.PHONY: clean
clean:
	-rm -rf build
