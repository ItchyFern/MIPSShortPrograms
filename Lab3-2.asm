.data
 newline: .asciiz "\n"
 .text
 
 main:
 
 addi $s0, $zero, 10 #s0 = 10
 
 jal increasestack #jump to procedure
 
 li $v0, 4 #prepare print string
 la $a0, newline #prepare string to print
 syscall #print prepared string
 #print
 
 li $v0, 1 # prepare print integer
 move $a0, $s0	#prepare s0 (=10) integer to print
 syscall #print prepared $s0 integer
  
 #end of program
 li $v0, 10
 syscall
 
increasestack: 
addi $sp, $sp, -4 #subtract stackpointer by 4 bytes
sw $s0, 0($sp) #save location of $s0 in stack pointer location 0

addi $s0, $s0, 30 #add thirty to variable s0

 li $v0, 1 #prepare print integer
 move $a0, $s0 #prepare new s0 as integer to print
 syscall # print new s0
 
 #this restores the previous state in memory
 lw $s0, 0($sp) #load stackpointer location 0 to variable s0
 addi $sp, $sp, 4 # return stack pointer to original value
 
 jr $ra #jumps back to where you were before