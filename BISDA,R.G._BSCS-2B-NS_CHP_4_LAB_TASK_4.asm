#Title: CHP 4 LAB TASK 4
#Author: Bisda, Rhoss Gerald T.
#Date: November 4, 2020
#Description: enter a positive integer number n and then prints the nth number in the Fibonacci sequence.
#Input: Enter a positive integer: 8
#Output: n'th Fibonacci number: 21

################## DATA SEGMENT ##########################
.data

	str1:	.asciiz		"Enter a positive integer: "
	str2:	.asciiz		"n'th Fibonacci number: "

################# CODE SEGMENT ##########################
.text

.globl main

main:					#main function entry
	li $v0, 4			#service code to print string
   	la $a0, str1			#load address of str1 to $a0
   	syscall				#print str1 string
   	li $v0, 5			#service code to read integer
   	syscall  			#read integer input to $v0
   	move $s1, $v0			#save input value into $s1
	
	add $t0, $t0, $zero		#initialize $t0 = 0
	add $t1, $t1, 1			#initialize $t1 = 1
	
	beqz $s1, returnA		#branch to returnA function if $s1 is equal to 0
	add $s2, $s2, 2			#initialize $s2 = 2
	
loop:					#loop function
	bgt $s2, $s1, returnB		#branch to returnB function if $s2 is greather than $s1
	add $t2, $t0, $t1		#store the value of the sum of $t0 and $t1 to $t2
	move $t0, $t1			#move the value of $t1 to $t0
	move $t1, $t2			#move the value of $t2 to $t1
	addi $s2, $s2, 1		#increment the value of $s2 by 1
	
	j loop				#jump back to loop function
	
returnA:				#returnA function
	la $a0, str2			#load the address of str2 into $a0
	li $v0, 4			#service code to print string
	syscall				#print str2 string 
	move $a0, $s1			#save value of $t1 to $a0
	li $v0, 1			#service code to print int
	syscall				#print the value of int
	
	j exit				#jump to exit function

returnB:				#returnB function
	la $a0, str2			#load the address of str2 into $a0
	li $v0, 4			#service code to print string
	syscall				#print str2 string 
	move $a0, $t1			#save value of $t1 to $a0
	li $v0, 1			#service code to print int
	syscall				#print the value of int
	
	j exit				#jump to exit function

exit:					#exit function
	li $v0, 10			#service code to exit
	syscall				#system call to exit program
