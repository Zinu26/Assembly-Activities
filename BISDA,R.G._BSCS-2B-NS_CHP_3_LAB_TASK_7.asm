#Title:CHP 3 LAB TASK 7                              Filename: chap3Labtask7.asm
#Author: Bisda, Rhoss Gerald T.                      Date: 10/10/20
#Course, Year & Section: BSCS-2B-NS
#Description: Swap the bits at odd with those even position 
# Input: 9 Input binary: 1001
# Output: 0110

################### DATA SECTION #############################
.data
str1: 		.asciiz "Enter an integer please: "
str2:		.asciiz "Bits before swap: "
str3:		.asciiz "Swapped Bits: "
str4: 		.asciiz "Swapped Odd Even Binary Position of bits results in a new decimal number: "
newline:	.asciiz "\n"

.align 2
################## CODE SECTION #############################
.text
.globl main

main:
# ask and store the first number
   li $v0, 4
   la $a0, str1
   syscall
   li $v0, 5
   syscall
   move $a1, $v0

   li $v0, 4
   la $a0, str2
   syscall 

print_bin:
   add $t0, $zero, $a1 # put our input ($a0) into $t0
   add $t1, $zero, $zero # Zero out $t1
   addi $t3, $zero, 1 # load 1 as a mask
   sll $t3, $t3, 31 # move the mask to appropriate position
   addi $t4, $zero, 32 # loop counter
   j loopOne

loopOne:
   and $t1, $t0, $t3 # and the input with the mask
   beq $t1, $zero, print # Branch to print if its 0

   add $t1, $zero, $zero # Zero out $t1
   addi $t1, $zero, 1 # Put a 1 in $t1
   j print


print: 
   li $v0, 1
   move $a0, $t1
   syscall

   srl $t3, $t3, 1
   addi $t4, $t4, -1
   bne $t4, $zero, loopOne
   j exit  

exit:
   add $s5, $zero, 64 
   add $s6, $zero, $zero
   add $t1, $zero, 1
   sll $t1, $t1, 31
   addi $t2, $zero, 32
   
loop: 

   blt $t2, 7, addt5register
   j secLoop
   
addt5register:
   div $s5, $s5, 2
   
secLoop:
   and $t3,$t0, $t1
   beq $t3, $zero, centerProc
   add $t3, $zero, $zero
   addi $t3, $zero, 1
   
centerProc: 
   blt $t2, 7, centerProcMain
   bgt $t2, 6, cProcTwo
   
   
centerProcMain:
   and $t7, $t2, 0x01 
   beq $t7, 1, checkBit
   bne $t7, 1, equatePrevBit 
   
equatePrevBit:
   move $t6, $t3
   j cProcTwo
   
checkBit: 
   bne $t3, $t6, checkBitTrue
   beq $t3, $t6, cProcTwo
   
checkBitTrue:
   beq $t3, 0, checkBitTrueManipulateOne
   beq $t3, 1, checkBitTrueManipulateTwo
   
checkBitTrueManipulateOne:
   li $s7, 1
   move $t3, $s7
   mul $s4, $s5, 2
   sub $s6, $s6, $s4
   j cProcTwo
 
checkBitTrueManipulateTwo:
   li $s7, 0
   move $t3, $s7
   mul $s4, $s5, 2
   add $s6, $s6, $s4
   j cProcTwo
   
cProcTwo:
   bnez $t3, addt6register
   j calc
   
addt6register:
   add $s6, $s6, $s5
  
calc:
   srl $t1, $t1, 1
   addi $t2, $t2, -1
   bne $t2, $zero, loop
   
   li $v0, 4
   la $a0, newline
   syscall
   
   beq $t2, $zero, exitTwo
  
exitTwo: 
   li $v0, 4
   la $a0, str4
   syscall
   
   move $a0, $s6
   li $v0, 1
   syscall
   
   li $v0, 4
   la $a0, newline
   syscall
   
   li $v0, 4
   la $a0, str3
   syscall
   
   
print_binOne:

   add $t0, $zero, $s6 # put our input ($a0) into $t0
   add $t1, $zero, $zero # Zero out $t1
   addi $t3, $zero, 1 # load 1 as a mask
   sll $t3, $t3, 31 # move the mask to appropriate position
   addi $t4, $zero, 32 # loop counter
   j loopTwo

loopTwo:

   and $t1, $t0, $t3 # and the input with the mask
   beq $t1, $zero, printOne # Branch to print if its 0

   add $t1, $zero, $zero # Zero out $t1
   addi $t1, $zero, 1 # Put a 1 in $t1
   j printOne


printOne: 
   li $v0, 1
   move $a0, $t1
   syscall

   srl $t3, $t3, 1
   addi $t4, $t4, -1
   bne $t4, $zero, loopTwo
