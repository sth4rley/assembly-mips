# Formato J (Jump):
# opcode(tipo de salto) endereço(pra onde ira saltar)
j label

#Exemplo de instrução de salto condicional:
beq $s0, $s1, label # se $s0 for igual a $s1 pula para salto, se nao segue sequenciamente o codigo
