#Title: Quiz 2 Chapter 3
#Author: Bisda, Rhoss Gerald T.
#Date: October 27,2020
#Description: Write MIPs program that will read two intergers from the user and compute for the sum and difference of the two intergers. Ask the user whether he wants to repeat the program : "[Y/y] / [N/n] ?"
#Input: Please enter the temperature in Fahrenheit: 37
#Output: 2.77777778 Celsius

################## DATA SEGMENT ##########################
.data 

	str1: .asciiz	"Please enter the temperature in Fahrenheit: "
	str2: .asciiz	" Celsius\n"
	cons: .float 	0.555555556
	cons1:.float 	32.0

################# CODE SEGMENT ##########################
.text

.globl main

main:

   li $v0, 4			#funtion of 4 is to display string 
   la $a0, str1			#load the address of str1
   syscall			#Display str1
   li $v0, 6			#Entered value will store to $f0
   syscall			#read float

   lwc1 $f1, cons		#set $f1 to 32 - bit value from effective word memory address
   lwc1 $f2, cons1		#set $f2 to 32 - bit value from effective word memory address
   sub.s $f0, $f0, $f2		#subtract 32 from entered fahrenheit 	
   mul.s $f12, $f0, $f1		#multiply floating point to single precision
   
   li $v0, 2			#the function of 2 is to display float
   syscall			#Display the value 
   
   li $v0, 4			#the function of 4 is to display string
   la $a0, str2			#load the address of str2
   syscall			#Display str2
   
   li $v0, 10			#the function of 10 is to exit the program
   syscall			#Program ends
   
   