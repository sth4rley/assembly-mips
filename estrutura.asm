# .globl (Indica que um ponto [label] é visível globalmente
# .data (Indica o início da declaração de variáveis)
# .asciiz (Indica uma string com \o)
# .text (Indica o início das instruções do programa)

.data  
	nome: .asciiz "Stharley"
	
.text
main:
	li $v0, 4
	la $a0, nome
	syscall
