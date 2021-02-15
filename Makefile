.SUFFIXES:
.DEFAULT_GOAL := all

GUARD=@mkdir -p $(@D)

CC=arm-none-eabi-gcc
LD=arm-none-eabi-ld

SRCDIR=$(shell pwd)/src
BINDIR=$(shell pwd)/bin

WARNINGS= \
	-Wall \
	-Wextra \
	-Werror

INCLUDES= \
	-Isrc/

TARGET = \
	-march=armv6-m \
	-mcpu=cortex-m0plus \
	-mthumb

include $(wildcard src/*/.build.mk)

.PHONY: all
all: $(KERNEL_BIN)

.PHONY: book
book:
	mdbook build -o

.PHONY: clean
clean:
	rm -rf bin
	rm -rf book

-include $(shell find bin/ -name '*.d')
