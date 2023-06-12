.data
str_antes: .asciiz "array antes: "
str_depois: .asciiz "array depois: "
endl: .asciiz "\n"
espaco: .asciiz " "
array: .word 4, 2, 12, 3, 8, 11, 5, 6, 19, 7, 10, 9

.text
main:
	# Imprime o array desordenado
	la $a0, str_antes
	jal print
	jal print_array
	
	# Imprime uma nova linha
	la $a0, endl
	jal print
	
	# Ordena a array usando o algoritmo quicksort
	la $a0, array			
	addi $a1, $zero, 0			
	li $a2, 10				
	jal quicksort				
	
	# Imprime o array ordenado
	la $a0, str_depois
	jal print
	jal print_array
	
	# Imprime uma nova linha
	la $a0, endl
	jal print
	
	j exit
	
print:
	li $v0, 4
	syscall
	jr $ra

swap:
	addi $sp, $sp, -12			# Cria uma pilha de 3 bytes
	sw $a0, 0($sp)				# Armazena $a0
	sw $a1, 4($sp)				# Armazena $a1
	sw $a2, 8($sp)				# Armazena $a2
	
	lw $t6, 0($a1)				# $t6 = array[left]
	lw $t7, 0($a2)				# $t7 = array[right]
	sw $t6, 0($a2)				# array[right] = $t6
	sw $t7, 0($a1)				# array[left] = $t7
	
	addi $sp,$sp,12				# Restaura a pilha
	jr $ra					# Retorna para $ra

partition:
	addi $sp, $sp, -16
	sw $a0, 0($sp)				# Endereço da array
	sw $a1, 4($sp)				# Baixo
	sw $a2, 8($sp)				# Alto
	sw $ra, 12($sp)				# Endereço de retorno
	mul $t0, $a1, 4				# $t0 = 4 * baixo
	add $t1, $t0, $a0			# $t1 = endereço da array + $t0
	move $s0, $a1				# esquerda = baixo
	move $s1, $a2				# direita = alto
	lw $s3, 0($t1)				# pivot = array[baixo]
	lw $t3, 0($sp)				# $t3 = endereço da array

	while:
		bge $s0, $s1, endwhile
		while1:
			mul $t2, $s1, 4			# $t2 = direita * 4
			add $s6, $t2, $t3		# $t3 = $t2 + endereço da array
			lw $s4, 0($s6)			# $s4 = array[direita]
			ble $s4, $s3, endwhile1		# Termina while1 se array[direita] <= pivot
			subi $s1, $s1, 1		# direita = direita - 1
			j while1
		endwhile1:
		
		while2:
			mul $t4, $s0, 4			# $t4 = esquerda * 4
			add $s7, $t4, $t3		# $t5 = $t4 + endereço da array
			lw $s5, 0($s7)			# $s5 = array[esquerda]
			bge $s0, $s1, endwhile2		# Desvia se esquerda >= direita para endwhile2
			bgt $s5, $s3, endwhile2		# Desvia se array[esquerda] > pivot para endwhile2
			addi $s0, $s0, 1		# esquerda = esquerda + 1
			j while2
		endwhile2:
		
		if:
			bge $s0, $s1, end_if		# Se esquerda >= direita, desvia para end_if
			move $a0, $t3			# Move $t3 para $a0
			move $a1, $s7			# Move array[esquerda] para $a1
			move $a2, $s6			# Move array[direita] para $a2
			jal swap			# Salta e linka swap
			
			
		end_if:
		
		j while
		
	endwhile:	
	
		lw $s5, 0($s7)				# Define $s5 como array[esquerda]
		lw $s4, 0($s6)				# Define $s4 como array[direita]
		sw $s4 0($t1)

		sw $s3, 0($s6)				# array[direita] = pivot
		
		
		move $v0, $s1				# Define $v0 como direita
		
	lw $ra 12($sp)					# Restaura $ra
	addi $sp, $sp, 16				# Restaura a pilha
	jr $ra						# Retorna para $ra

quicksort:				

	addi $sp, $sp, -16			# Cria espaço na pilha para 4 bytes

	sw $a0, 0($sp)				# Armazena endereço na pilha
	sw $a1, 4($sp)				# Armazena baixo na pilha	
	sw $a2, 8($sp)				# Armazena alto na pilha
	sw $ra, 12($sp)				# Armazena endereço de retorno na pilha

	move $t0, $a2				# Salva alto em t0
	
	checkCond:
		slt $t1, $a1, $t0			# t1 = 1 se baixo < alto, caso contrário, 0
		beq $t1, $zero, end_check		# Se baixo >= alto, termina a verificação

		jal partition				# Chama a função partition
		move $s0, $v0				# Salva o pivô em s0

		lw $a1, 4($sp)				# a1 = baixo
		addi $a2, $s0, -1			# a2 = pi - 1
		jal quicksort				# Chama a função quicksort

		addi $a1, $s0, 1			# a1 = pi + 1
		lw $a2, 8($sp)				# a2 = alto
		jal quicksort				# Chama a função quicksort
		
	end_check:
	lw $a0, 0($sp)				# Restaura a0
 	lw $a1, 4($sp)				# Restaura a1
 	lw $a2, 8($sp)				# Restaura a2
	lw $ra 12($sp)				# Carrega o endereço de retorno em ra
	addi $sp, $sp, 16			# Restaura a pilha
	jr $ra					# Retorna para $ra

	print_array:
	# Imprime os elementos da array depois de ordenar
	li $s0, 0
	li $s1, 44 # 11(elementos) x 4(bytes) = 44
	for_pd:
		bge $s0, $s1, end_pa

		# Imprime um número
		li $v0, 1
		lw $a0, array($s0)
		syscall

		# Imprime um espaço
		li $v0, 4
		la $a0, espaco
		syscall

		addi $s0, $s0, 4
		j for_pd
	end_pa:
	jr $ra

exit:
