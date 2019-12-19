# Equation: (rownum * totalcol + colnum) * dataSize

.data
# the next two lines define an array
mdArray:
	.word 2,5,1,1
	.word 3,7,1,1
	.word 1,1,1,1
	.word 1,1,1,1

size: 	.word 4  #dimension of the array (2x2 in this case, note this is only for square matrices)
.eqv DATA_SIZE 4 # number of bytes per element, 4 for ints, 1 for chars, 8 for doubles

.text
main:
	la $a0, mdArray # base address
	lw $a1, size # size
	jal sumDiagonal  #sum of diagonals, in our starting example, this is 9.
	move $a0, $v0 # this is because sumDiagonal will return it's last value in $v0
	li $v0, 1
	syscall
	#and done
	li $v0, 10
	syscall

sumDiagonal:
	li $v0,0 #sum =0
	li $t0,0 #t0 as the index

	sumLoop:
		mul $t1, $t0, $a1 #t1 = index * size
		add $t1, $t1, $t0 #t1 = t1 + index
		mul $t1, $t1, DATA_SIZE #t1 = t1 * datasize

		lw $t2, mdArray($t1)  #getting element
		add $v0, $v0, $t2 # sum = sum + mdArray[i][i]

		addi $t0, $t0, 1 # i = i+1
		blt $t0, $a1, sumLoop  #if i < size, loop again

jr $ra
