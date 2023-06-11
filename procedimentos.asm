# Procedimentos/Funcoes em Assembly

# Registradores específicos que dao suporte a procedimentos:
# Registradores para argumentos ($a0 - $a3): 
# Registradores de retorno ($v0 - $v1)
# Registradores de endereço de retorno ($ra) -> Registrador que guarda o endereço de retorno (return address) para o ponto do programa que chamou o procedimento



# Instrução Jump And Link (jal):
# pula para o endereço inicial do procedimento e salva o
# endereço de retorno ($ra)(endereço da próxima instrução após chamada).

# o jal nos permite pular para uma parte específica do código e,
# ao mesmo tempo, lembrar o endereço de onde pulamos para que possamos
# retornar corretamente após a conclusão do procedimento ou função.

# Salta para o endereço especificado (addr) e 
jal addr
# armazena o endereço de retorno em $ra.
$ra <- PC + 4

# O "+4" é adicionado ao Program Counter (PC) para indicar o endereço
# da próxima instrução após a instrução jal.

#O PC normalmente avança de instrução em instrução, incrementando em
# 4 unidades (cada instrução ocupa 4 bytes na memória).

# Nesse caso, o "+4" é adicionado para que,
# após a chamada do procedimento (salto para o endereço especificado),
# a execução continue na instrução seguinte à instrução jal.
# Isso garante que o fluxo de execução prossiga corretamente e
# evita um loop infinito ao retornar para a própria instrução jal.



# Instrução Jump Register (jr)

# o jr nos permite retornar diretamente ao ponto onde uma função
# ou procedimento foi chamado, usando o endereço armazenado no
# registrador $ra.

# Pula para o endereço armazenado no registrador $ra.
jr $ra


# codigo exemplo verificacao impar/par usando Funcoes

.data
	msg_input: .asciiz "insert a number: "
	msg_even: .asciiz "par\n"
	msg_odd: .asciiz "impar\n"
	
.text
	.main:
		la $s1, msg_input
		
		jal print_str
		jal read_int # le um inteiro e armazena em $v0
		jal even_or_odd 	# se par $s0 = 0 se nao $s0 = 1
		
		beq $v0, $zero, par
		
		la $s1, msg_odd
		j print
		
		par: la $s1, msg_even

		print: jal print_str
		
		j exit	
		
	read_int: li $v0, 5
		syscall
		jr $ra
		
	even_or_odd:
		li $t0, 2
		div $v0, $t0
		mfhi $v0
		jr $ra 
		
	print_str:
		li $v0, 4
		move $a0, $s1
		syscall
		jr $ra

	exit:

