.macro get_vals
	li $v0, 5
	syscall
	move $t1, $v0
	
	li $v0, 5
	syscall
	move $t2, $v0
.end_macro
	
.data
	loop_msg: .asciiz "Loop number "
	loop_msg_end: .asciiz "\n"
	greater_msg: .asciiz " is the greater number.\n"



.text
main:
	li $t0, 1
	j loop
loop:
	beq $t0, 6, endloop 
	
	li $v0, 4
	la $a0, loop_msg
	syscall
	
	li $v0, 1
	add $a0, $t0, $zero
	syscall
	
	li $v0, 4
	la $a0, loop_msg_end
	syscall
	
	add $t0, $t0, 1
	
	get_vals
	
	bgt $t1, $t2, gt
	
	move $t1, $t2
	
	
	
gt:
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 4
	la $a0, greater_msg
	syscall
	
	j loop

endloop:
	li $v0, 10
	syscall
