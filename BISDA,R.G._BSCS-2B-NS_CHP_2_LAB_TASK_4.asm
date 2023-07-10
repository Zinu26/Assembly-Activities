# Title:Minus by 101				Filename:CHP2Labtasl4.asm
# Author: Bisda, Rhoss Gerald T.		Date: 10/8/20
#Course, Year & Section: BSCS-2B-NS
# Description: Reads 3 integers
# Input: Integer
# Output: Integer sum then subtracted

################# DATA SECTION #####################
.data
prompt:		.asciiz     "Please enter three numbers: \n"
sum_msg:	.asciiz     "The answer is: "

################### CODE SECTION ###################
.text
.globl main
main:
   	la    	$a0,prompt	
   	li    	$v0,4
   	syscall
   	li   	$v0,5	
   	syscall
   	move  	$t0,$v0
   	li    	$v0,5	
   	syscall
   	move  	$t1,$v0
   	li    	$v0,5	
   	syscall
   	move  	$t2,$v0
   	addu  	$t0,$t0,$t1		
   	add  	$t2,$t2,101
   	sub 	$t0,$t0,$t2
   	la    	$a0,sum_msg	
   	li    	$v0,4
   	syscall
   	move  	$a0,$t0	
   	li    	$v0,1
   	syscall
   	li    	$v0,10	
   	syscall
