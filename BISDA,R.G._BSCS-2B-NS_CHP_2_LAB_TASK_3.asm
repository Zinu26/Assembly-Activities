#Title:PRINT HELLO + USER NAME                        Filename: CHP2Labtask3.asm
#Author: Bisda, Rhoss Gerald T.                       Date: 10/8/20
#Course, Year & Section: BSCS-2B-NS
#Description: asking the user to repeat the program 
#Input: Name of user
#Output: Hello, User

################### DATA SECTION ##########################
.data

name_prompt:		.asciiz	 	"Input your name: "
salute:			.asciiz		"Hello! "
name:			.space		20	

################### CODE SECTION ##########################
.text

main:
	li 	$v0, 4
	la 	$a0, name_prompt
	syscall

	li	 $v0, 8
	la	 $a0, name
	li	 $a1, 40
	syscall

	li	$v0, 4
	la 	$a0, salute
	syscall

	li 	$v0, 4
	la 	$a0, name
	syscall

	li	$v0, 10
	syscall
