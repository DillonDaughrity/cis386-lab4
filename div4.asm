.data
length: .word 10
array: .word 1, 2, 4, 8, 9, 11, 12, 16, 21, 24

.text
.globl main

main:
	li $s0, 0
	lw $s1, length
	li $s2, 0
	la $t0, array

for:
	beq $s0, $s1, endFor

	sll $t1, $s0, 2
	add $t2, $t0, $t1
	lw $t3, 0($t2)

	andi $t4, $t3, 3
	bne $t4, $zero, skip

	addi $s2, $s2, 1

skip:
	addi $s0, $s0, 1
	j for

endFor:
	li $v0, 1
	move $a0, $s2
	syscall

	li $v0, 10
	syscall