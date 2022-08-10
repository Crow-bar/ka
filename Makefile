TARGET = ka

PSP_FW_VERSION = 660

USE_KERNEL_LIBC = 1
USE_KERNEL_LIBS = 1

INSTALL_DIR ?= $(TARGET)

PRX_EXPORTS = exports.exp
HEADER = ka.h
STUBS = KernelAccess.S KernelAccess_driver.S
OBJS = main.o exports.o sceGe_driver.o

LIBS = -lpspge_driver
CFLAGS = -Os -G0 -Wall -fshort-wchar -fno-pic -mno-check-zero-division -DF_sceGe_driver_0013 -DF_sceGe_driver_0030
CXXFLAGS = $(CFLAGS) -fno-exceptions -fno-rtti
ASFLAGS = $(CFLAGS)

EXTRA_CLEAN = clean_stubs clean_install_dir

PSPSDK=$(shell psp-config --pspsdk-path)
include $(PSPSDK)/lib/build_prx.mak

build_stubs:
	psp-build-exports --build-stubs $(PRX_EXPORTS)

clean_stubs:
	rm -f $(STUBS)

clean_install_dir:
	rm -rf $(INSTALL_DIR)

install:
	mkdir -p $(INSTALL_DIR)
	cp -f $(HEADER) $(FINAL_TARGET) $(STUBS) $(INSTALL_DIR)

all: $(FINAL_TARGET) build_stubs install
