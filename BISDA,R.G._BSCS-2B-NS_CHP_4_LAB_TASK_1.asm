#Title: Quiz 2 Chapter 3
#Author: Bisda, Rhoss Gerald T.
#Date: November 4, 2020
#Description:  enter an integer and then displays the number of 1's in the binary representation of that integer.
#Input: Please enter an integer: 9
#Output: The number set of bits are: 2

################## DATA SEGMENT ##########################
.data

	str1:	.asciiz		"Please enter an integer: "
	str2:	.asciiz		"The number set of bits are: "

################# CODE SEGMENT ##########################
.text

.globl main

main:					#main function entry
	li $v0, 4			#service code to print string
   	la $a0, str1			#load the address of str1 into $a0
   	syscall				#print str1 string
   	li $v0, 5			#service code to read integer
   	syscall  			#read integer input into $v0
   	move $t1, $v0			#save input value to $t1
 
   	addu $t0, $t0, $zero		#initialize $t0 as 0 value
while:					#while function
	beqz $t1, print			#conditional statement if($t1 == 0) program will go to print function
	and $t2, $t1, 1			#Bitwise AND n & 1
	bne $t2, 1, rightShift		#conditional statement if($t2 != 1) program will go to rightShift function
	addi $t0, $t0, 1		#increment the value of $t0 by 1
	j rightShift			#jump to rightShift function

rightShift:
	srl $t1, $t1, 1			#right shift value of $t1 by 1
	j while				#jump to while function
	
print:					#print function
	la $a0, str2			#load the address of str2 into $a0
	li $v0, 4			#service code to print string
	syscall				#print str2 string 
	move $a0, $t0			#save value of $t0 to $a0
	li $v0, 1			#service code to print int
	syscall				#print the value of int
	
	li $v0, 10			#service code to exit
	syscall				#system call to exit program
