.text
main:
	li $s0, 521438 # numero
	li $s2, 10 # divisor

	while: beq $s0, $zero, exit
		
        # divide
		div $s0, $s2
		mfhi $a0
		mflo $s0
		
		# print
		li $v0, 1
		syscall

	j while	
	
exit: