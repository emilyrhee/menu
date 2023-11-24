.data
	menu: .asciiz "\n\n********************** Main Menu **********************\n (1) Miles to kilometers\n (2) Fahrenheit to Celsius\n (3) Current in circuit\n (0) Exit\nPlease enter an option: "

	mi_prompt: .asciiz "\nEnter miles: "
	mi_const: .float 1.609
	km_result: .asciiz "Distance in km: "
	
	f_prompt: .asciiz "\nEnter temperature in F: "
	thirty_two: .float 32.0
	f_const: .float 1.8
	c_result: .asciiz "Temperature in C: "

	v_prompt: .asciiz "\nEnter voltage: "
	r1_prompt: .asciiz "Enter resistance at R1: "
	r2_prompt: .asciiz "Enter resistance at R2: "
	r3_prompt: .asciiz "Enter resistance at R3: "
	total_current: .asciiz "\nTotal current in circuit: "
	v_at_r1: .asciiz "\nVoltage across R1: "
	v_at_r2: .asciiz "\nVoltage across R2: "
	v_at_r3: .asciiz "\nVoltage across R3: "
	
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
		
		# Print prompt
		la $a0, mi_prompt
		li $v0, 4
		syscall
		
		# Read user input as a float
		li $v0, 6
		syscall
		
		# Convert input in mi to km
		mul.s $f12, $f0, $f1
		
		# Print converted result
		la $a0, km_result
		li $v0, 4
		syscall
		
		li $v0, 2
		syscall
		
		b main
		
	f_to_c:
		l.s $f1, thirty_two
		l.s $f2, f_const
		
		# Print prompt
		la $a0, f_prompt
		li $v0, 4
		syscall
		
		# Read user input as float
		li $v0, 6
		syscall
		
		# Convert user input in F to C
		sub.s $f12, $f0, $f1
		div.s $f12, $f12, $f2
		
		# Print converted result
		la $a0, c_result
		li $v0, 4
		syscall
		
		li $v0, 2
		syscall
		
		b main
		
	ohms_law:
		# Print prompt for V
		la $a0, v_prompt
		li $v0, 4
		syscall
		
		# Read input for V as float
		li $v0, 6
		syscall
		
		mov.s $f1, $f0
		
		# Print prompt for R1
		la $a0, r1_prompt
		li $v0, 4
		syscall
		
		# Read input for R1 as float
		li $v0, 6
		syscall
		
		mov.s $f2, $f0
		
		# Print prompt for R1
		la $a0, r2_prompt
		li $v0, 4
		syscall
		
		# Read input for R2 as float
		li $v0, 6
		syscall
		
		mov.s $f3, $f0

		# Print prompt for R1
		la $a0, r3_prompt
		li $v0, 4
		syscall
		
		# Read input for R3 as float
		li $v0, 6
		syscall
		
		mov.s $f4, $f0
		
		# Find total resistance
		add.s $f5, $f2, $f3
		add.s $f5, $f5, $f4
		
		# Find total current in circuit
		div.s $f12, $f1, $f5
		
		mov.s $f6, $f12
		
		# Print total current in circuit
		la $a0, total_current
		li $v0, 4
		syscall
		
		li $v0, 2
		syscall
		
		# Find voltage at R1
		mul.s $f12, $f6, $f2
		
		# Print voltage at R1
		la $a0, v_at_r1
		li $v0, 4
		syscall
		
		li $v0, 2
		syscall
		
		# Find voltage at R2
		mul.s $f12, $f6, $f3
		
		# Print voltage at R2
		la $a0, v_at_r2
		li $v0, 4
		syscall
		
		li $v0, 2
		syscall
		
		# Find voltage at R3
		mul.s $f12, $f6, $f4
		
		# Print voltage at R3
		la $a0, v_at_r3
		li $v0, 4
		syscall
		
		li $v0, 2
		syscall
		
		b main
		
	exit:
		li  $v0,10
		syscall   
		