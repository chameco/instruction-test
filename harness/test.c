#include <stdint.h>
#include <stdio.h>

extern uint64_t test();

int main() {
	uint64_t ret = test();
	printf("Machine value:   %#lx\n", ret);
	return 0;
};
