.data
	A: .float 0.00000001
	B: .float 0.00000002
	C: .float 0.00000003
	newline: .asciiz "\n"
	
.text
	l.s $f0, A
	l.s $f1, B
	l.s $f2, C
	
	add.s $f12, $f0, $f1 # (a + b)
	add.s $f12, $f12, $f2 # + c
	
	li $v0, 2
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	add.s $f12, $f1, $f2 # (b + c)
	add.s $f12, $f12, $f1 # + a
	
	li $v0, 2
	syscall

