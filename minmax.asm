.data
length: .word 8
array:  .word 5, -3, 12, -40, 7, 0, 33, -8

minMsg: .asciiz "Min: "
maxMsg: .asciiz "\nMax: "

.text
.globl main

main:
	lw $s1, length
	la $s2, array

	li $s0, 1
	lw $s3, 0($s2)
	lw $s4, 0($s2)

for:
	beq $s0, $s1, endFor

	sll $t0, $s0, 2
	add $t1, $s2, $t0
	lw $t2, 0($t1)

	slt $t3, $t2, $s3
	bne $t3, $zero, updateMin

	slt $t3, $s4, $t2
	bne $t3, $zero, updateMax

	j next

updateMin:
	move $s3, $t2
	j next

updateMax:
	move $s4, $t2

next:
	addi $s0, $s0, 1
	j for

endFor:
	li $v0, 4
	la $a0, minMsg
	syscall

	li $v0, 1
	move $a0, $s3
	syscall

	li $v0, 4
	la $a0, maxMsg
	syscall

	li $v0, 1
	move $a0, $s4
	syscall

	li $v0, 10
	syscall