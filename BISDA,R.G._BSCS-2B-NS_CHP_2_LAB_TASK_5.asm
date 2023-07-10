 #Title:CHP 2 LAB TASK 1                             Filename: CHP2Labtask5.asm
#Author: Bisda, Rhoss Gerald T.                      Date: 10/8/20
#Course, Year & Section: BSCS-2B-NS
#Description: The program should output equal if the two integers are equal
#Input: 
#Output:   

###################### DATA SECTION ########################                   
.data  
p1: 	.asciiz 	"Please enter the first number: "  
p2: 	.asciiz 	" Please enter the second number: "  
ans1: 	.asciiz 	" \nEQUAL "  
ans2: 	.asciiz 	" \nNOT EQUAL "  

##################### CODE SECTION ########################
.text
.globl main

main:    
    li 		$v0, 4     
    la 		$a0, p1  
    syscall   

    li 		$v0, 5   
    syscall    
    move 	$t1, $v0 

    li 		$v0, 4 
    la 		$a0, p2 
    syscall    

    li 		$v0, 5 
    syscall   
    move 	$t2, $v0

    beq  	$t1, $t2, numbersEqual 
    bne  	$t1, $t2, notEqual
    
    li 		$v0,10
    syscall
    
    numbersEqual:
    	li 	$v0, 4
    	la 	$a0, ans1
    	syscall
    	li 	$v0,10
        syscall
        
    notEqual:
    	li 	$v0, 4
    	la 	$a0, ans2
    	syscall
