#Title:CHP 2 LAB TASK 2                              Filename: CHP2Labtask2.asm
#Author: Bisda, Rhoss Gerald T.                      Date: 10/8/20
#Course, Year & Section: BSCS-2B-NS
#Description: asking the user to repeat the program 
#Input: 
#Output: 

################### DATA SECTION #############################

.data
str1: 		.asciiz 	"Enter an integer value:  "
str2:		 .asciiz 	"You entered:  "
str3: 		.asciiz 	"\nRepeat [y/n]? "
answer: 	.space 		256


################## CODE SECTION #############################

.text
.globl main

main:
	do:
  		li $v0, 4
  		la $a0, str1
 	 	syscall
  
  		li $v0, 5 
  		syscall
  
  		move $s0, $v0
  		li $v0, 4
  		la $a0, str2
  		syscall
  
  		li $v0, 1
  		move $a0, $s0
  		syscall
  
  		li $v0, 4
  		la $a0, str3
  		syscall
  
  		la  $a0, answer
  		li  $a1, 3
  		li  $v0, 8
  		syscall

	while: 
    		lb  $t4, 0($a0)

    		beq $t4, 'y', main
    		beq $t4, 'Y', do
  
  		li $v0, 10
  		syscall
