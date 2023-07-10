#Title: Quiz 2 Chapter 2
#Author: Bisda, Rhoss Gerald T.
#Date: October 20,2020
#Description: Write MIPs program that will read two intergers from the user and compute for the sum and difference of the two intergers. Ask the user whether he wants to repeat the program : "[Y/y] / [N/n] ?"
#Input: 
#Output:

################## DATA SEGMENT ##########################
.data 

	str1: 	.asciiz		"Enter 2 integer: "
	str2: 	.asciiz		"\nRepeat [Y/N][y/n]: "
	sum:	.asciiz		"\nThe sum of two integers: "
	diff:	.asciiz		"\nThe difference of two integers: "
	ans:	.space		256

################# CODE SEGMENT ##########################
.text
.globl main

main:
	do:
		li $v0, 4
  		la $a0, str1
 	 	syscall			#Displays str1 
  
  		li $v0, 5 
  		syscall			#read 1st entered integer
  		move $t1, $v0		#store 1st integer to register $t1
  		li $v0, 5		
  		syscall			#red 2nd entered integer
  		move $t2, $v0		#store 2nd integer to register $t2
  		
  		addu $t3, $t1, $t2	#add 1st and 2nd integer
  		subu $t4, $t1, $t2	#subtract 1st and 2nd integer
  		
  		li $v0, 4
  		la $a0, sum
  		syscall			#Display sum
  		
  		li $v0, 1
  		move $a0, $t3
  		syscall			#Display value of sum
  		
  		li $v0, 4
  		la $a0, diff
  		syscall			#Display diff
  		
  		li $v0, 1
  		move $a0, $t4
  		syscall			#Display value of difference
  		
  		li $v0, 4
  		la $a0, str2
  		syscall			#Display str2
  		
		la  $a0, ans		#Load address of ans
  		li  $a1, 3
  		li  $v0, 8
  		syscall
  		
  	while:
  		lb  $t5, 0($a0)		

    		beq $t5, 'y', main	#if $t5 is equal to 'y' go to main function
    		beq $t5, 'Y', do	#if $t5 is equat to 'Y' go to do function
  		
  		beq $t5, 'n', exit	#if $t5 is equal to 'n' go to exit function
  		beq $t5, 'N', exit	#if $t5 is equal to 'N' go to exit function
  		
  	exit:
  	
  		li $v0, 10
  		syscall			#exit program
  		
  		