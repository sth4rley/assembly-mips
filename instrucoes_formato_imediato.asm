# Formato imediato
# opcode registrador_destino, registrador_fonte, constante

# Adiciona a constante ao valor zero e armazena o resultado em $t0
addi $t0, $zero, constante

# Realiza a operação lógica "OR" bit a bit entre o valor atual de $s0 e a constante, e armazena o resultado em $s0
ori $s0, $s0, constante

# Carrega a constante imediata nos 16 bits mais significativos de $s0
lui $s0, 0x23B8

#o primeiro eh menor que a constante? se sim $t0 = 1
slti $t0, $t1, constante
