.macro done
	li $v0, 10
	syscall
.end_macro 

.data

	array: .word 3, 10, 5, 8, 7, 1, 12, 6, 4, 2
	newline: .asciiz "\n"
	maxStr: .asciiz "Max value: "
	minStr: .asciiz "Min value: "
	rngStr: .asciiz "Range: "

.text

main:
	la $t0, array
	move $t2, $zero
	lw $t1, 0($t0) # set first value as max
	
	jal findMax
	move $s0, $t1
	
	la $t0, array
	move $t2, $zero
	lw $t1, 0($t0) # set first value as max
	
	jal findMin
	move $s1, $t1
	
	jal findRange
	
	li $v0, 4
	la $a0, maxStr
	syscall 
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	li $v0, 4
	la $a0, minStr
	syscall 
	
	li $v0, 1
	move $a0, $s1
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	li $v0, 4
	la $a0, rngStr
	syscall
	
	li $v0, 1
	move $a0, $s2
	syscall
	
	done

findMax:
	addi $t2, $t2, 1
	
	lw $a0, 0($t0)
	
	bgt $a0, $t1, switchNumMax
	addi $t0, $t0, 4
	
	blt $t2, 10, findMax
	
	jr $ra
	
switchNumMax:
	move $t1, $a0
	j findMax
	
findMin:
	addi $t2, $t2, 1
	
	lw $a0, 0($t0)
	
	blt $a0, $t1, switchNumMin
	addi $t0, $t0, 4
	
	blt $t2, 10, findMin
	
	jr $ra
	
switchNumMin:
	move $t1, $a0
	j findMin

findRange:
	sub $s2, $s0, $s1
	jr $ra
	

	
	
