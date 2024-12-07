	# ECE 445 - Computer Organization
	# Lab 6 MIPS Series
	# Author:  Muhammad H. Ali
	# Date:  12/04/2020
	
	.text			
	.globl main		

main:	
	# load the input from memory address 48
	lw $t1, 48($zero)
	addi $t2, $zero, 1 # previous value
	addi $t3, $zero, 0 # temp register for swapping data
loop:	add $a0, $zero, $t1
	jal EVEN
	bne $v0, $zero, even1
	
odd:	add $t2, $zero, $t1 # update the previous value
	add $t1, $t1, $t1 # update the current value by doubling it
	j next
	
even1:	add $t3, $zero, $t2 # assign $t2's value to the $t3 register to overwrite $t2
	add $t1, $t1, $t2 # update the current value $t1 to $t1 + $t2
	add $t2, $zero, $t3 # update the previous value using the temp register

next:	sw $t1, 52($zero) # store the number back to the memory location for the output
	j loop	

	# The andi operation will and the LSB of $a0 with 1 to see if the LSBits match, if so, the number is odd.
EVEN:	andi $s1, $a0, 1	# If $s1 is 1, then it's odd, otherwise it's even.
	beq $s1, $zero, ret2	# If not, then jump to ret1 to return a 0 * Using Section 2.8 from the Textbook and Dr. Lorie's Lecture 9 slides 14-18.
	
ret1:	add $v0, $zero, $zero	# Set the return value to 0
	j return	# Jump to the end of the function
	
ret2:	add $v0, $zero, $zero	# Clear $v0's value
	addi $v0, $zero, 1	# and set it to 1
	# Since we don't need to keep track of the $s# registers we've used for further function calls,
	# we'll just return back to the previous jal address.
return:	jr $ra	# Return from the function to the caller
		
end: 	nop
	
	.data 0x10010000
	
	
