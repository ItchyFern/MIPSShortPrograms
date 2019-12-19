.data
textout: .asciiz "The program requests an input:"

.text

main:
addi $s0, $zero, 1
addi $s1, $zero, 2
addi $s2, $zero, 3
jal inputNum


#print values
li $v0, 1
move $a0, $s0
syscall
li $v0, 1
move $a0, $s1
syscall
li $v0, 1
move $a0, $s2
syscall
#done
li $v0 10
syscall

inputNum:
sw $s0, 0($sp)
sw $s1, 4($sp)
sw $s2, 8($sp)
# this is the start of the bit you're going to make into a called procedure
# print text, get an input
la $a0 textout
li $v0 4
syscall
li $v0 5
syscall
move $s0, $v0 #copy the first value to $s0
#print out some more text, read in another value
li $v0 4
syscall
li $v0 5
syscall
move $s1, $v0# move result into $s1
add $s2 $s0, $s1 #add $s1 and $s2

#print values
li $v0, 1
move $a0, $s0
syscall
li $v0, 1
move $a0, $s1
syscall
li $v0, 1
move $a0, $s2
syscall
#end of bit you need to make into a called procedure
lw $s0, 0($sp)
lw $s1, 4($sp)
lw $s2, 8($sp)
jr $ra