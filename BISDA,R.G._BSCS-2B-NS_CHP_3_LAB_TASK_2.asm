#Title:CHP 3 LAB TASK 2                              Filename: chap3Labtask2.asm
#Author: Bisda, Rhoss Gerald T.                      Date: 10/9/20
#Course, Year & Section: BSCS-2B-NS
#Description: asking for the content display of $s3 - $s6
#Input: 
#Output: 

################### DATA SECTION #############################

.data
str1: 		.asciiz 	"The contents of $s3 - $s6 are: \n"
str2: 		.asciiz 	"\n$s3: "
str3: 		.asciiz 	"\n$s4: "
str4: 		.asciiz 	"\n$s5: "
str5: 		.asciiz 	"\n$s6: "				

################## CODE SECTION #############################
.text
.globl main
main: # main program
	li $s1, 0xabcd1234	
	li $s2, 0xffff0000

	and $s3,$s1,$s2 	
	or $s4,$s1,$s2 		
	xor $s5,$s1,$s2 	
	nor $s6,$s1,$s2		

	la $a0, str1		#display str1 string
	li $v0, 4
	syscall
	
	la $a0, str2		# write $s3 message
	li $v0, 4
	syscall
	move $a0, $s3		# output $s3
	li $v0, 34
	syscall

	la $a0, str3		# write $s4 message
	li $v0, 4
	syscall
	move $a0, $s4		# output $s4
	li $v0, 34
	syscall

	la $a0, str4		# write $s5 message
	li $v0, 4
	syscall
	move $a0, $s5		# output $s5
	li $v0, 34
	syscall

	la $a0, str5		# write $s6 message
	li $v0, 4
	syscall
	move $a0, $s6		# output $s6
	li $v0, 34
	syscall


	li $v0, 10 # Exit program
	syscall 
