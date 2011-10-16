	.file	"powerR.c"
	.text
	.globl	powerR
	.type	powerR, @function
powerR:
.LFB0:
	.cfi_startproc
	pushl	%ebp	# Push caller's frame pointer
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp	# Set the current frame
	.cfi_def_cfa_register 5
	subl	$24, %esp	# Allocate 24 bytes of space on the stack
	cmpl	$0, 8(%ebp)	# Compare 0 with pow
	jne	.L2	# Jump if not equal
	movl	$1, %eax	# Return 1
	jmp	.L3	#
.L2:
	movl	8(%ebp), %eax	# Move `pow` into eax
	leal	-1(%eax), %edx	# Move eax into edx (?)
	movl	12(%ebp), %eax	# Move `base` into eax
	movl	%eax, 4(%esp)	# Move `base` into 2nd parameter for  call
	movl	%edx, (%esp)	# Move `pow` into 1st paraemter for call
	call	powerR	#
	imull	12(%ebp), %eax	# Multiply the result of the call with eax
.L3:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	powerR, .-powerR
	.ident	"GCC: (Ubuntu/Linaro 4.6.1-9ubuntu3) 4.6.1"
	.section	.note.GNU-stack,"",@progbits
