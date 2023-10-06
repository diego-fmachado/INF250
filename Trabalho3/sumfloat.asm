addi t0, x0, 0x30 #Primeiro número
addi t1, x0, 0x4e #Segundo número
srli s0, t0, 4 #Separando o primeiro expoente
andi s0, s0, 7 #Separando o primeiro expoente
srli s1, t1, 4 #Separando o segundo expoente
andi s1, s1, 7 #Separando o segundo expoente
andi a0, t0, 15 #Separando a primeira mantissa
addi a0, a0, 0x10 #Separando a primeira mantissa
andi a1, t1, 15 #Separando a segunda mantissa
addi a1, a1, 0x10 #Separando a segunda mantissa
beq s0, s1, Equ #Caso os expoentes sejam iguais...
blt s0, s1, Lss #Caso o primeiro expoente seja menor...
Grt:
    loop2:
        addi s1, s1, 1 #Segundo expoente menor, incrementando para se igualar ao primeiro
        srli a1, a1, 1 #Segundo expoente menor, incrementando para se igualar ao primeiro
        bgt s0, s1, loop2 #Testa se os expoentes se igualaram
    beq x0, x0, Equ #Expoentes iguais...
Lss:
	loop1:
    	addi s0, s0, 1 #Primeiro expoente menor, incrementando para se igualar ao segundo
        srli a0, a0, 1 #Primeiro expoente menor, incrementando para se igualar ao segundo
        blt s0, s1, loop1 #Testa se os expoentes se igualaram
Equ:
    add a2, a0, a1 #Expoentes iguais, Somando as mantissas
    andi a3, a2, 32 #Verificando a necessidade de normalizar
    beq a3, x0, Cont #Verificando a necessidade de normalizar
    srli a2, a2, 1 #Normalizando
    addi s0, s0, 1 #Normalizando
    Cont:
        andi a2, a2, 15 #Já normalizado, isolando a mantissa resultante
        slli s0, s0, 4 #Formando o resultado
        or s2, s0, a2 #Formando o resultado
        sw s2, 0(gp) #Gravando o resultado na posição gp de memória