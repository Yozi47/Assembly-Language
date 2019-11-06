# Yogendra Adhikari
# IT 320 Lab Assignment 1
# I certify that this program is entirely my own creation. 
# I have not shared this code with any other person. 

.data
	# The prompt-text to ask for different inputs a, b and c. 
	PrmA:	.asciiz "Enter the Starting Number: "
	PrmB:	.asciiz "Enter the Ending Number: "
	PrmC:	.asciiz "Enter the increment Value: "
	
	# The information to print the values generated from the value we got.
	Str1:	.asciiz "\nThe generated numbers are: "
	comma:	.asciiz ","
	Str2:	.asciiz "\nThe total generated numbers: "
	Str3: 	.asciiz "\nAverage of the generated numbers: "

# The executable part of the program.
.text
	main:
		# Displays the prompt-text of label PrmA.
		li	$v0, 4 
		la	$a0, PrmA
		syscall

		# Asks for the input for the label PrmA.
		li	$v0, 5
		syscall
		move	$t0, $v0

		# Displays the prompt-text of label PrmB.
		li	$v0, 4 
		la	$a0, PrmB
		syscall

		# Asks for the input for the label PrmB.
		li	$v0, 5
		syscall
		move	$t1, $v0

		# Displays the prompt-text of label PrmC.
		li	$v0, 4 
		la	$a0, PrmC
		syscall

		# Asks for the input for the label PrmC.
		li	$v0, 5
		syscall
		move	$t2, $v0

		# Prints the text of label Str1.
		li	$v0, 4 
		la	$a0, Str1
		syscall

		move 	$t3,$t0		# t3 = input of a
		li 		$t4,0		# loop steps-counter t4 = 0
		li		$t5,0		# instantiation of variable to sum all the occurance t5 = 0 initially
	loop:

		# Printing the initial value of t3 at the loop entrance 
		li 		$v0, 1 
		move 	$a0, $t3
		syscall
		
		# Addition of new numbers to respective variable resistors.
		add		$t5,$t5,$t3
		addi	$t4,$t4,1
		add 	$t3, $t3,$t2
		
		# A break-point of the loop if t3 reaches the final value at t1
		bgt 	$t3,$t1,done

		# Prints comma after every number until the last
		li 	$v0, 4
		la 	$a0, comma
		syscall
	
		j	loop		# return to loop

	done:				# The done label whic is called right after the breakpoint on the loop.
		# Prints the texts on  Str2 label
		li	$v0, 4 
		la	$a0, Str2
		syscall

		# Displays the integer counter
		li		$v0, 1 
		move	$a0, $t4
		syscall

		# Prints the texts on  Str3 label
		li	$v0, 4 
		la	$a0, Str3
		syscall
	
		# Displays the average value
		li	$v0,1
		div	$a0,$t5,$t4
		syscall
		jr	$ra