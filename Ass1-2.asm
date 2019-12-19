# Program 2: 
# Write a MIPS program that will ask the user for a positive integer (we will call this n ), 
# check if it is positive, if not throw an error.  Iteratively calculate the factorial of 
# that number (assume n is less than 15, there are some issues with factorial calculations 
# with big numbers which we will discuss in class… don’t sign yourself up for those).  
# Recursion is a problem for future assignments. 
	
.data
	req_int: .asciiz "Please enter a positive integer: "
	err_msg: .asciiz "Error: Positive integers only.\n"
	
.text
main:	
	li $v0, 4
	la $a0, req_int
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	blt $t0, 1, error
	
	add $t1, $t0, -1

	j loop

error:
 	li $v0, 4
	la $a0, err_msg
	syscall
	
	j main

loop:
	beq $t1, $zero, endloop 
	
	mul $t0, $t1, $t0
	
	add $t1, $t1, -1
	
	j loop
		
endloop:
	li $v0, 1
	move $a0, $t0
	syscall
	
	j end

end:
	li $v0, 10
	syscall
	
