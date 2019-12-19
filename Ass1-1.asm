#Program 1: 
#Write a MIPS program that asks the user for two number inputs, 
#then have it ask for a type of operations (add, or multiply), 
#perform the operation and output the result.   Stick to integers. 
.macro print_eq
	li $v0, 4		# prepare print str command
	la $a0, equals		# prepare equals str in arg0
	syscall 		# call print str
.end_macro

.macro print_int
	li $v0, 1		# prepare print int command
	syscall			# call print int
.end_macro

.macro print_formatted
	add $a0, $t1, $zero 	# set arg0 as t1
	print_int		# print t1
	
	li $v0, 4		# prepare print str command
	move $a0, $a1		# prepare added str in arg0
	syscall 		# call print str
	
	add $a0, $t2, $zero 	# set arg0 as t2
	print_int		# print t2
	
	print_eq		# print str equals
.end_macro

.macro get_input
	li $v0, 4		# prepare print str command
	la $a0, req_int		# prepare str req_int an arg0 spot
	syscall 		# call print str
	
	li $v0, 5		# prepare read int command
	syscall			# call read int
	
	
.end_macro

.data
	req_int: .asciiz "Please enter an integer: "
	operand_options: .asciiz "\nSelect an operand (1, 2)\n 1. Add\n 2. Multiply\nChoice #: "
	invalid: .asciiz "Invalid choice, closing program."
	added: .asciiz " + "
	multiplied: .asciiz " * "
	equals: .ascii " = "

.text
main:
	get_input		# get first int val
	move $t1, $v0		# save first int val in t1
	
	get_input		# get second int val
	move $t2, $v0		# save second int val in t2
	
	li $v0, 4		# prepare print str command
	la $a0, operand_options	# prepare str operand_options in arg 0 location
	syscall			# call print str
	
	li $v0, 5		# prepare read int command
	syscall			# call read int
	
	beq $v0, 1, add_funct	# if choice 1, go to add 
	beq $v0, 2, multiply_funct	# if choice 2, go to multiply
	
	li $v0, 4		# prepare print str command
	la $a0, invalid		# prepare str invalid in arg0 location
	syscall			# call print str
	
	j end

add_funct:
	la $a1, added		# prepare str added as arg0
	
	print_formatted		# print formatted answer
	
	add $a0, $t1, $t2	# add t1, and t2
	print_int		# print sum of t1, and t2
	
	j end

multiply_funct:
	la $a1, multiplied	# prepare str multiply as arg0
	
	print_formatted		# print formatted answer
	
	mul $a0, $t1, $t2	# multiply t1, and t2
	print_int		# print sum of t1, and t2
	
	j end
	
end:
	li $v0, 10	# prepare terminate execution command
	syscall		# call terminate execution