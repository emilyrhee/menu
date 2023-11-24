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
		beq 	$t0,3, ohms_law	

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
		
	ohms_law:
		# Read input for V as float
		li $v0, 6
		syscall
		
		mov.s $f1, $f0
		
		# Read input for R1 as float
		li $v0, 6
		syscall
		
		mov.s $f2, $f0
		
		# Read input for R2 as float
		li $v0, 6
		syscall
		
		mov.s $f3, $f0
		
		# Read input for R3 as float
		li $v0, 6
		syscall
		
		mov.s $f4, $f0
		
		# Find total resistance
		add.s $f5, $f2, $f3
		add.s $f5, $f5, $f4
		
		# Find total current in circuit
		div.s $f12, $f1, $f5
		
		# Print total current in circuit
		li $v0, 2
		syscall
		
	exit:
		li  $v0,10
		syscall   
		