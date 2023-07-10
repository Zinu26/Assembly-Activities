#LAB 2
#Rhoss Gerald T. Bisda
#BSCS-2B-NS

##################PROGRAM CODES######################
.data
	str: .space 10		# array of 10 bytes
	.text
.globl main
main:				# main program entry
	la $a0, str		# $a0 = address of str
	li $a1, 10		# $a1 = max string length
	li $v0, 8		# read string
	syscall
		
	li $v0, 4		# Print string str
	syscall
	
	li $v0, 10		# Exit program
	syscall
