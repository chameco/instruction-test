section .text
global test
$test:
	mov rbx, 0xdeadbeef12345678
	movq xmm1, rbx
	mov rbx, 0xfeeddeafabcddcba
	movq xmm2, rbx
	pinsrw xmm1, rbx, 1
	movq rax, xmm1
	ret
