#Title:CHP 2 LAB TASK 1                             Filename: CHP2Labtask1.asm
#Author: Bisda, Rhoss Gerald T.                     Date: 10/8/20
#Course, Year & Section: BSCS-2B-NS
#Description:  doubling the input
#Input: integer
#Output: double the input

################# DATA SECTION ################################

.data
str1: 		.asciiz 	"PLEASE ENTER AN INTEGER VALUE:  "
str2: 		.asciiz 	"Total:  "

num1: 		.word 0
sum: 		.word 0


##################CODE SECTION ###############################

.text
.globl main

main:
  	li $v0, 4 
  	la $a0, str1
  	syscall
  
  	li $v0, 5 
  	syscall

  	sw $v0, num1
  
  	lw $t1, num1   
  	lw $t2, num1
  	add $t3, $t1, $t2  
  	sw $t3, sum   
  
  	li $v0, 4
  	la $a0, str2              
  	syscall
 
  	lw $a0, sum
  	li $v0, 1
  	syscall
  
  
  
  
  
  
  
  
  
