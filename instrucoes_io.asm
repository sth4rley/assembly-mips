# ENTRADA E SAÍDA DE DADOS

# Syscalls são chamadas de sistema que permitem que programas Assembly MIPS interajam com o sistema operacional.
# Elas possibilitam operações de entrada e saída de dados, como a impressão de mensagens na tela.

# Ao utilizar uma syscall, o sistema operacional analisa o valor em $v0 (código da syscall) para identificar
# o serviço solicitado e verifica os argumentos nos registradores correspondentes ($a0, $a1, $a2).

# A instrução "li" é usada para carregar um valor constante imediato em um registrador.
li $v0, 1 # Carregar o código da syscall para imprimir um inteiro
li $a0, 42 # Carregar o valor 42 como argumento para imprimir
syscall # Chamar a syscall para imprimir o valor

# A instrução "la" é utilizada para carregar o endereço de um rótulo ou variável na memória em um registrador.
la $a0, mensagem # Carregar o endereço da string "mensagem" no registrador $a0
li $v0, 4 # Carregar o código da syscall para imprimir uma string
syscall # Chamar a syscall para imprimir a string


# Codigos do syscall:

# Código 1: print_int - Imprime um inteiro na saída padrão.
li $v0, 1 # Carregar o código da syscall para imprimir um inteiro
li $a0, 123 # Carregar o valor inteiro a ser impresso
syscall # Chamar a syscall para imprimir o valor inteiro

# Código 4: print_string - Imprime uma string na saída padrão.
la $a0, mensagem # Carregar o endereço da string "mensagem" no registrador $a0
li $v0, 4 # Carregar o código da syscall para imprimir uma string
syscall # Chamar a syscall para imprimir a string

# Código 5: read_int - Lê um inteiro da entrada padrão.
li $v0, 5 # Carregar o código da syscall para ler um inteiro
syscall # Chamar a syscall para ler o inteiro
move $t0, $v0 # Mover o valor lido para o registrador $t0

# Código 8: read_string - Lê uma string da entrada padrão.
la $a0, buffer # Carregar o endereço do buffer na memória no registrador $a0
li $a1, 100 # Carregar o tamanho máximo da string a ser lida
li $v0, 8 # Carregar o código da syscall para ler uma string
syscall # Chamar a syscall para ler a string

#Código 10: exit - Encerra a execução do programa.
li $v0, 10 # Carregar o código da syscall para encerrar o programa
syscall # Chamar a syscall para encerrar a execução do programa

