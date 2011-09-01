# CS 471 Lab 1
# @author J. Andrew Marshall <jmarsha6@binghamton.edu>

	.section	__TEXT,__text,regular,pure_instructions
	.globl	_powerI
	.align	4, 0x90
_powerI:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	12(%ebp), %eax  # Load the function parameters
	movl	8(%ebp), %ecx
	movl	%ecx, -4(%ebp)
	movl	%eax, -8(%ebp)
	movl	$1, -20(%ebp)   # Initial value for for loop
	movl	$0, -24(%ebp)   # Condition value for for loop
	jmp	LBB1_2
LBB1_1:                 # The inside of the for loop block
	movl	-20(%ebp), %eax # Load loop values into register
	movl	-8(%ebp), %ecx
	imull	%ecx, %eax      # The actual math
	movl	%eax, -20(%ebp)
	movl	-24(%ebp), %eax
	addl	$1, %eax        # Increment the loop incrementer
	movl	%eax, -24(%ebp)
LBB1_2:                 # The for loop
	movl	-24(%ebp), %eax
	movl	-4(%ebp), %ecx
	cmpl	%ecx, %eax      # Comparison for the for loop
	jl	LBB1_1
	movl	-20(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	addl	$24, %esp
	popl	%ebp
	ret                   # End of the function!


.subsections_via_symbols
