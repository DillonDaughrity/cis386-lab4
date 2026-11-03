.data
x: .word 5

.text
.globl main

main:
	lw $s0, x
	
	nor $s0, $s0, $zero
	addi $s0, $s0, 1
	
	li $v0, 10
	syscall
