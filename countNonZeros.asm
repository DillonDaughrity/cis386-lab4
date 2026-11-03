.data
array: .word 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 0

.text
.globl main

main:
	li $s0, 0
	la $s1, array

while:
	sll $t0, $s0, 2
	add $t1, $s1, $t0
	lw $t2, 0($t1)

	beq $t2, $zero, endWhile

	addi $s0, $s0, 1
	j while

endWhile:
	li $v0, 1
	move $a0, $s0
	syscall

	li $v0, 10
	syscall