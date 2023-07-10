#Title:CHP 3 LAB TASK 3                              Filename: chap3Labtask3.asm
#Author: Bisda, Rhoss Gerald T.                      Date: 10/9/20
#Course, Year & Section: BSCS-2B-NS
#Description: asking for the content display of $s3 - $s6
#Input: 
#Output: 

################### DATA SECTION #############################

.data
str1: 		.asciiz 	"The contents of $s2 - $s4 are: \n"
str2: 		.asciiz 	"\n$s2: "
str3: 		.asciiz 	"\n$s3: "
str4: 		.asciiz 	"\n$s4: "				

################## CODE SECTION #############################
.text
.globl main
main: # main program
	li $s1, 0xabcd1234	

	sll $s1, $s1, 16 	
	srl $s3, $s1, 8 		
	sra $s4, $s1, 12 		

	la $a0, str1		#display str1 string
	li $v0, 4
	syscall
	
	la $a0, str2		# write $s2 message
	li $v0, 4
	syscall
	move $a0, $s3		# output $s2
	li $v0, 34
	syscall

	la $a0, str3		# write $s3 message
	li $v0, 4
	syscall
	move $a0, $s4		# output $s3
	li $v0, 34
	syscall

	la $a0, str4		# write $s4 message
	li $v0, 4
	syscall
	move $a0, $s5		# output $s4
	li $v0, 34
	syscall



	li $v0, 10 # Exit program
	syscall 
