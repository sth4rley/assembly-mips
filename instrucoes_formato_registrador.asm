# As instruções no formato R geralmente têm a seguinte estrutura básica:
#opcode registrador_destino, registrador_fonte1, registrador_fonte2

# Adiciona o valor de $s1 ao valor de $s2 e armazena o resultado em $s0
add $s0, $s1, $s2

# Subtrai o valor de $s2 do valor de $s1 e armazena o resultado em $s0
sub $s0, $s1, $s2

# Realiza uma operação lógica "AND" bit a bit entre os valores de $s1 e $s2 e armazena o resultado em $s3
and $s3, $s1, $s2

# Realiza uma operação lógica "OR" bit a bit entre os valores de $t1 e $t2 e armazena o resultado em $t0
or $t0, $t1, $t2

# Realiza uma operação lógica "XOR" (ou exclusivo) bit a bit entre os valores de $t1 e $t2 e armazena o resultado em $t0
xor $t0, $t1, $t2

# Realiza n deslocamentos lógicos para a esquerda (Shift Left Logical) do valor de $s0 em uma posição e armazena o resultado em $s0
sll $s0, $s0, n 

# o primeiro eh menor que o segundo? se sim $t2 = 1 se nao, = 0
slt $t2, $t0, $t1


