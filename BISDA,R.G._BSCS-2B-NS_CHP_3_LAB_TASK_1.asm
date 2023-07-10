# Title: Two integers A and B			Filename:CHP2Labtasl4.asm
# Author: Bisda, Rhoss Gerald T.		Date: 10/9/20
#Course, Year & Section: BSCS-2B-NS
# Description: Read integer A and B that computes A + 2B - 5
# Input:
# Output: 

################# DATA SECTION #####################
.data 
str1: 	.asciiz 	"Enter A integer: "
str2: 	.asciiz 	"Enter B integer: "
str3: 	.asciiz 	"Result: "
   

################### CODE SECTION ###################
.text
.globl main
main:
   	la    	$a0,num1	
   	li    	$v0,4
   	
   	syscall 
   	move  	$t0,$v0
   	li    	$v0,5	
   	
   	syscall
   	la	$a1,num2
   	li	$v1,4
   	syscall
   	
