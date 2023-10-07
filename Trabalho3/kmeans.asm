.data
    # Declaração dos valores
    .word 3
    .word 3
    .word 10
    .word 10
    .word 1
    .word 1
    .word 2
    .word 2
    .word 3
    .word 3
    .word 4
    .word 4
    .word 5
    .word 5
    .word 6
    .word 6
    .word 7
    .word 7
    .word 8
    .word 8
    .word 9
    .word 9
    .word 10
    .word 10
    .word 11
    .word 11
    .word 12
    .word 12
    .word 13
    .word 13
    .word 14
    .word 14
    .word 15
    .word 15
    .word 16
    .word 16
    .word 17
    .word 17
    .word 18
    .word 18
    .word 19
    .word 19
    .word 20
    .word 20
    .word -1
.text
addi t0,gp,16 #Ponteiro do vetor
lw s0, 0(gp) #Carregue componente x da coordenada C1
lw s1, 4(gp) #Carregue componente y da coordenada C1
lw s2, 8(gp) #Carregue componente x da coordenada C2
lw s3, 12(gp) #Carregue componente y da coordenada C2
Loop1:
    lw s4, 0(t0) #Carregue o componente x do ponto
    blt s4, x0, End1 #Se chegou no fim do vetor, termine
    lw s5, 4(t0) #Carregue o componente y do ponto
    
    sub a2, s0, s4 #Calcula diferença de C1 na coordenada x
    mul a0, a2, a2 #Calcula diferença de C1 na coordenada x
    sub a3, s1, s5 #Calcula diferença de C1 na coordenada y
    mul a1, a3, a3 #Calcula diferença de C1 na coordenada y
    add a6, a0, a1 #Calcula d1
    
    sub a2, s2, s4 #Calcula diferença de C2 na coordenada x
    mul a0, a2, a2 #Calcula diferença de C2 na coordenada x
    sub a3, s3, s5 #Calcula diferença de C2 na coordenada y
    mul a1, a3, a3 #Calcula diferença de C2 na coordenada y
    add a7, a0, a1 #Calcula d2
    
    blt a6, a7, Lss #Caso d1 menor que d2...
    add s10, s10, s4 #Incrementando o acumulador x de C2
    add s11, s11, s5 #Incrementando o acumulador y de C2
    addi t5, t5, 1 #Incrementando variável que conta numero de pontos no acumulador
    beq x0, x0, Cont1 #Continua o algoritmo...

    Lss:
        add s8, s8, s4 #Incrementando o acumulador x de C1
        add s9, s9, s5 #Incrementando o acumulador y de C1
        addi t4, t4, 1 #Incrementando variável que conta numero de pontos no acumulador
    Cont1:
    addi t0, t0, 8 #Anda com ponteiro de pontos
    beq x0, x0, Loop1 #Repete o loop para processar proximo ponto
End1:
addi s0, x0, 0 #Reseta coordenada x de C1
addi s1, x0, 0 #Reseta coordenada y de C1
addi s2, x0, 0 #Reseta coordenada x de C2
addi s3, x0, 0 #Reseta coordenada y de C2
Loop2:
	blt s8, t4, Cont2 #Se não for mais possível dividir acc1x por n pontos, continue...
    sub s8, s8, t4 #Realizando iteração de divisão
    addi s0, s0, 1 #Realizando iteração de divisão
    beq x0, x0, Loop2 #Repete o loop até não poder mais dividir
Cont2:

Loop3:
	blt s9, t4, Cont3 #Se não for mais possível dividir acc1y por n pontos, continue...
    sub s9, s9, t4 #Realizando iteração de divisão
    addi s1, s1, 1 #Realizando iteração de divisão
    beq x0, x0, Loop3 #Repete o loop até não poder mais dividir
Cont3:

Loop4:
	blt s10, t5, Cont4 #Se não for mais possível dividir acc2x por n pontos, continue...
    sub s10, s10, t5 #Realizando iteração de divisão
    addi s2, s2, 1 #Realizando iteração de divisão
    beq x0, x0, Loop4 #Repete o loop até não poder mais dividir
Cont4:

Loop5:
	blt s11, t5, Cont5 #Se não for mais possível dividir acc2y por n pontos, continue...
    sub s11, s11, t5 #Realizando iteração de divisão
    addi s3, s3, 1 #Realizando iteração de divisão
    beq x0, x0, Loop5 #Repete o loop até não poder mais dividir
Cont5:
sw s0, 0(gp) #Grava coordenada x de C1
sw s1, 4(gp) #Grava coordenada y de C1
sw s2, 8(gp) #Grava coordenada x de C2
sw s3, 12(gp) #Grava coordenada y de C2