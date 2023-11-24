.data
	menu: .asciiz "\n\n********************** Main Menu **********************\n (1) Option 1\n (2) Option 2\n (3) Option 3\n (0) Exit\nPlease enter an option: "

	mi_const: .float 1.609
	
	thirty_two: .float 32.0
	f_const: .float 1.8

.text
.globl main

	main:
		# Print menu text
		li $v0, 4
		la $a0, menu
		syscall	
		
		# User chooses option
		li $v0,5
    	syscall   
    			
		move $t0, $v0

		beq 	$t0,0, exit				
		beq 	$t0,1, mi_to_km
		beq 	$t0,2, f_to_c
		#beq 	$t0,3, case3	

	mi_to_km:
		l.s $f1, mi_const
		
		# Read user input as a float
		li $v0, 6
		syscall
		
		# Convert input in mi to km
		mul.s $f12, $f0, $f1
		
		# Print converted result
		li $v0, 2
		syscall
		
	f_to_c:
		l.s $f1, thirty_two
		l.s $f2, f_const
		
		# Read user input as float
		li $v0, 6
		syscall
		
		# Convert user input in F to C
		sub.s $f12, $f0, $f1
		div.s $f12, $f12, $f2
		
		# Print converted result
		li $v0, 2
		syscall
		
	exit:
		li  $v0,10
		syscall   
		