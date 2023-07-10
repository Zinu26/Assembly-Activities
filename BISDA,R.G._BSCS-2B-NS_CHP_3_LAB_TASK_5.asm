#Title:CHP 3 LAB TASK 4                              Filename: chap3Labtask5.asm
#Author: Bisda, Rhoss Gerald T.                      Date: 10/10/20
#Course, Year & Section: BSCS-2B-NS
#Description: Enter an integer and bit position and display the integer on the bit value
# Input: 250, bit position: 4
# Output: Bit: 1

################### DATA SECTION #############################
.data 
str1: 	.asciiz 	"Enter an integer: "
str2: 	.asciiz 	"Enter bit position (0-31): "
str3: 	.asciiz 	"Bit: "

################## CODE SECTION #############################

.text
.globl main
main:
   	li $v0, 4
   	la $a0, str1
   	syscall
   	li $v0, 5
   	syscall
   	move $t0, $v0
   	li $v0, 4
   	la $a0, str2
   	syscall
   	li $v0, 5
   	syscall
  	move $t7, $v0
   
   	add $t1, $zero, 1
   	sll $t1, $t1, 31
   	addi $t2, $zero, 32
   	li $v0, 4
   	la $a0, str3
   	syscall


     loop: 
   	and $t3,$t0, $t1
   	beq $t3, $zero, centerProc
   	add $t3, $zero, $zero
   	addi $t3, $zero, 1

     centerProc: 
   	beq $t2, $t7, printBit
   	j calc

     printBit:
   	li $v0, 1
   	move $a0, $t3
 	syscall
  
     calc:
   	srl $t1, $t1, 1
   	addi $t2, $t2, -1
   	bne $t2, $zero, loop
   	beq $t2, $zero, exit
  
     exit: 
   	li $v0, 10
   	syscall
