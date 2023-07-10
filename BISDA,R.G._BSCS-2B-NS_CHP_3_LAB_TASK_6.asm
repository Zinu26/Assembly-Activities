#Title:CHP 3 LAB TASK 6                              Filename: CHP3Labtask6.asm
#Author: Bisda, Rhoss Gerald T.                      Date: 10/8/20
#Course, Year & Section: BSCS-2B-NS
#Description: multiplying the user input to 24.5 
#Input: 
#Output: 

###################### DATA SECTION #####################

.data
str1: .asciiz "PLEASE ENTER A NUMBER:  "
str2: .asciiz "Result:  "

num1: .word 0
product: .word 0

###################### CODE SECTION #####################

.text
.globl main

main:  
  	li	$v0, 4
	la 	$a0, str1
	syscall
  
  	li	$v0, 5 
  	syscall
  
  	move 	$t0, $v0
  
  	li $t1, .double 24.5
  
  	mul $t3, $t0, $t1
  
  	li $v0, 1