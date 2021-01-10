SAW ?= saw

.PHONY: all

all:
	echo "Usage: make <test> when test.S exists"

harness/test.bc: harness/test.c
	@clang -c -emit-llvm harness/test.c -o harness/test.bc

%: %.S harness/test.bc
	@mkdir -p build
	@yasm -felf64 $< -o build/test.o
	@ld build/test.o -o build/test &>/dev/null
	@clang harness/test.c build/test.o -o build/test_c
	$(eval SIM=$(shell $(SAW) harness/test.saw | grep "^Actual term" | cut - -d' ' -f7))
	@printf "Simulator value: %#x\n" $(SIM)
	@./build/test_c
