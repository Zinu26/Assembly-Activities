#Title: CHP 4 LAB TASK 3
#Author: Bisda, Rhoss Gerald T.
#Date: November 4, 2020
#Description:  enter two integers: n1 and n2 and prints the sum of all numbers from n1 to n2.
#Input: Enter a decimal number to convert: 10
#Output: Hexadecimal value: 000000A

################## DATA SEGMENT ##########################
.data
	str1: 	.asciiz "Enter the decimal number to convert: "
	str2:		.asciiz "\nHexadecimal value: "
	result:		.space 8

################# CODE SEGMENT ##########################	
.text
.globl main

main:				#main function entry
	la $a0, str1		#load the address of str1 into $a0
	li $v0, 4		#service code to print string 	
	syscall			#print string str1
	li $v0, 5		#service code to read integer
	syscall			#read integer input into $v0			
	move $t2, $v0		#save input value to $t2
	
	la $a0, str2		#load the address of str2 into #a0
	li $v0, 4		#service code to print string
	syscall			#print string str2
	
	li $t0, 8 		#counter
	la $t3, result		#answer will be stored
	
loop:				#loop function
	beqz $t0, exit		#branch to exit if counter is equal to zero
	rol $t2, $t2, 4		#rotate bits 4 to the left
	and $t4, $t2, 0xf	#mask with 1111
	ble $t4, 9, sum		#if less than or equal to nine, branch to sum
	addi $t4, $t4 , 55	#if greater than nine, add 55
	
	b end			#branch to end
	
sum:				#sum function
	addi $t4, $t4, 48	#add 48 to result
	
end:				#end function
	sb $t4, 0($t3)		#store hex digit into result
	addi $t3, $t3, 1	#increment address counter
	addi $t0, $t0, -1	#decrement loop counter
	
	j loop			#jump back to loop
	
exit:				#exit function
	la $a0, result		#load the address of result into $a0
	li $v0, 4		#service code to print string
	syscall			#print string result
	
	la $v0, 10		#service code to exit
	syscall			#system call to exit program