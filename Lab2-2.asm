
.text
main:
	li $v0, 5
	syscall
	move $t0, $v0

	move $a0, $t0
	li $v0, 1
	syscall
	
	