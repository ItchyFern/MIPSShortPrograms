# Seth Hannah
# 0656551
# Trent University 2019

.text # assembly language instructions

main: 
	li $v0, 4 # system call code for printing string = 4
	la $a0, hello_msg # load address of string to be printed into $a0
	syscall # call operating system to perform print operation
	li $v0, 10
	syscall

.data # data declaration section
hello_msg:
	.byte 0x48 # hex for ASCII "H"
	.byte 0x65 # hex for ASCII "e"
	.byte 0x6C
	.byte 0x6C
	.byte 0x6F
	.byte 0xA
	.byte 0x0

	bgt $t0, $t1, t0_bigger
	move $t2, $t1
	b endif
	
t0_bigger:
	move $t2, $t0
endif:
