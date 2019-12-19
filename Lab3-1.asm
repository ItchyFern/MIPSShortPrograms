.data
	newline: .asciiz "\n"
	
.text
main:
	addi $s0, $zero, 10  #add the 0 and 10 and store in $s0
	
	jal procedure
	
	#print value
	li $v0, 1
	move $a0, $s0  
	syscall
	
	#end of program
	li $v0, 10
	syscall 


procedure:
	sw $s0, 0($sp)
	
	li $v0, 4
	la $a0, newline
	syscall
	
	addi $s0, $s0, 30
	
	lw $s0, 0($sp)
	
	jr $ra