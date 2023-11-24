.data
	menu: .asciiz "\n\n********************** Main Menu **********************\n (1) Option 1\n (2) Option 2\n (3) Option 3\n (0) Exit\nPlease enter an option: "

	constant: .float 1.609

.text
.globl main

	main:
		li $v0, 4 		# Print String
		la $a0, menu
		syscall	
		
		li $v0,5  		# User choose option
    	syscall   
    			
		move $t0, $v0

		beq 	$t0,0, exit				
		beq 	$t0,1, mi_to_km
		#beq 	$t0,2, case2
		#beq 	$t0,3, case3	

	mi_to_km:
		l.s $f1, constant
		
		li $v0, 6
		syscall
		
		mul.s $f12, $f0, $f1
		
		li $v0, 2
		syscall
		
	exit:
		li  $v0,10
		syscall   
		