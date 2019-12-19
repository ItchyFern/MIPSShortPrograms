.macro done
	li $v0, 10
	syscall
.end_macro 

.data

	array: .float 3.0, 10.0, 5.0, 8.0, 7.0, 1.0, 12.0, 6.0, 4.0, 2.0
	newline: .asciiz "\n"
	maxStr: .asciiz "Max value: "
	minStr: .asciiz "Min value: "
	rngStr: .asciiz "Range: "

.text

main:
	la $t0, array
	move $t2, $zero
	l.s $f0 ($t0) # set first value as max
	
	jal findMax
	mov.s $f2, $f0
	
	la $t0, array
	move $t2, $zero
	l.s $f0 ($t0) # set first value as max
	
	jal findMin
	mov.s $f3, $f0
	
	jal findRange
	
	li $v0, 4
	la $a0, maxStr
	syscall 
	
	li $v0, 2
	mov.s $f12, $f2
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	li $v0, 4
	la $a0, minStr
	syscall
	
	li $v0, 2
	mov.s $f12, $f3
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	li $v0, 4
	la $a0, rngStr
	syscall
	
	li $v0, 2
	mov.s $f12, $f4
	syscall
	
	done

findMax:
	addi $t2, $t2, 1
	
	l.s $f1 ($t0)
	
	c.lt.s $f0, $f1
	bc1t switchNumMax
	
	addi $t0, $t0, 4
	
	blt $t2, 10, findMax
	
	jr $ra
	
switchNumMax:
	mov.s $f0, $f1
	j findMax
	
findMin:
	addi $t2, $t2, 1
	
	l.s $f1 ($t0)
	
	c.lt.s $f1, $f0
	bc1t switchNumMin
	
	addi $t0, $t0, 4
	
	blt $t2, 10, findMin
	
	jr $ra
	
switchNumMin:
	mov.s $f0, $f1
	j findMin

findRange:
	sub.s $f4, $f2, $f3
	jr $ra
	

	
	
