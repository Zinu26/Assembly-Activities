#Title: CHP 4 LAB TASK 2
#Author: Bisda, Rhoss Gerald T.
#Date: November 4, 2020
#Description:  enter two integers: n1 and n2 and prints the sum of all numbers from n1 to n2.
#Input: Enter two integer
#	n1:	3
#	n2:	7
#Output: Sum:	25

################## DATA SEGMENT ##########################
.data

	str1:	.asciiz		"Enter two integer\n"
	n1:	.asciiz		"n1: "
	n2:	.asciiz		"n2: "
	str2:	.asciiz		"Sum: "

################# CODE SEGMENT ##########################
.text

.globl main

main:					#main function entry
	li $v0, 4			#service code to print string
   	la $a0, str1			#load the address of str1 into $a0
   	syscall				#print str1 string
   	
   	li $v0, 4			#service code to print string
   	la $a0, n1			#load the address of n1 into $a0
   	syscall				#print n1 string
   	li $v0, 5			#service code to read integer
   	syscall  			#read integer input into $v0
   	move $t1, $v0			#save input value to $t1 
   	
   	li $v0, 4			#service code to print string
   	la $a0, n2			#load the address of n2 into $a0
   	syscall				#print n2 string
   	li $v0, 5			#service code to read integer
   	syscall  			#read integer input into $v0
   	move $t2, $v0			#save input value to $t2
   	
   	add $t0, $t0, $t1		#initialize $t0 equals to $t1
while:					#while function
	beq $t0, $t2, printSum		#coditional statement if($t0 == $t2) program will go to printSum function
	addi $t0, $t0, 1		#increment the value of $t0 by 1
	add $t1, $t1, $t0		#add $t0 to $t1
	j while				#go back to the while function
	
printSum:				#printSum function
	la $a0, str2			#load the address of str2 into $a0
	li $v0, 4			#service code to print string
	syscall				#print str2 string 
	move $a0, $t1			#save value of $t1 to $a0
	li $v0, 1			#service code to print int
	syscall				#print the value of int
	
	li $v0, 10			#service code to exit
	syscall				#system call to exit program
	
   	
