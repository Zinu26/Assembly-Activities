#Title:Upper case to Lower case & Vice Versa          Filename: CHP3Labtask4.asm
#Author: Bisda, Rhoss Gerald T.                       Date: 10/8/20
#Course, Year & Section: BSCS-2B-NS
#Description: converting string from upper to lower and lower to upper
#Input: RoS
#Output: rOs

################### DATA SECTION ##########################

.data 
   buffer: .space 20 
   str1: .asciiz "Enter a letter: "

################### CODE SECTION ##########################
.text
.globl main
main:

   li $v0, 4
   la $a0, str1
   syscall
   la $a0, buffer
   li $a1, 20
   li $v0, 8
   syscall
   
   li $t0, 0

loop:
   lb $t1, buffer($t0)      
   beq $t1, 0, final     
   blt $t1, 'a', toLower     
   bgt $t1, 'z', toLower      
   sub $t1, $t1, 32      
   sb $t1, buffer($t0)
   j not_lower
   
toLower: 
   blt $t1, 'A', toUpper      
   bgt $t1, 'Z', toUpper      
   add $t1, $t1, 32     
   sb $t1, buffer($t0)
   
toUpper:
   add $t5, $t5, 32   
   
not_lower:
      addi $t0, $t0, 1
      j loop

   
final:
   li $v0, 4
   la $a0, buffer
   syscall
   
   li $v0, 10
   syscall
