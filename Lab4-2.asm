.data
	input1: .float 15.50
	
.text
main:
	l.s $f1, input1 #load input1
	
	li $v0, 6
	syscall
	
	mov.s $f3, $f0

	mul.s $f12, $f1, $f3
	
	li $v0, 2
	syscall
	
	li $v0, 10
	syscall