.DATA
I:           0
J:           0
A:           0
B:           0
C:           0
BASE:        3
EXPOENTE:    4
POTENCIA:    0
.TEXT
LD           BASE     #ACC <- (endereco)
STO          POTENCIA #(endereco) <- ACC
LD           EXPOENTE #ACC <- (endereco)
SUBI         1        #ACC <- ACC - (endereco)
STO          EXPOENTE #(endereco) <- ACC
LDI          0        #ACC <- (endereco)
STO          J        #(endereco) <- ACC
WHILE:                #Rotulo - WHILE
LD           J        #ACC <- (endereco)
SUB          EXPOENTE #ACC <- ACC - (endereco)
BGE          WHILEEND #Se (STATUS.N=0) entao PC <- endereco, Se nao PC <- PC + 1
LD           POTENCIA #ACC <- (endereco)
STO          A        #(endereco) <- ACC
LD           BASE     #ACC <- (endereco)
STO          B        #(endereco) <- ACC
LDI          0        #ACC <- (endereco)
STO          I        #(endereco) <- ACC
MULTI:                #Rotulo - MULTI
LD           I        #ACC <- (endereco)
SUB          B        #ACC <- ACC - (endereco)
BGE          MULTIEND #Se (STATUS.N=0) entao PC <- endereco, Se nao PC <- PC + 1
LD           C        #ACC <- (endereco)
ADD          A        #ACC <- ACC + (endereco)
STO          C        #(endereco) <- ACC
LD           I        #ACC <- (endereco)
ADDI         1        #ACC <- ACC + (endereco)
STO          I        #(endereco) <- ACC
JMP          MULTI    #PC <- endereco
MULTIEND:             #Rotulo - MULTIEND
LD           C        #ACC <- (endereco)
STO          POTENCIA #(endereco) <- ACC
LDI          0        #ACC <- (endereco)
STO          A        #(endereco) <- ACC
LDI          0        #ACC <- (endereco)
STO          B        #(endereco) <- ACC
LDI          0        #ACC <- (endereco)
STO          C        #(endereco) <- ACC
LD           J        #ACC <- (endereco)
ADDI         1        #ACC <- ACC + (endereco)
STO          J        #(endereco) <- ACC
JMP          WHILE    #PC <- endereco
WHILEEND:             #Rotulo - WHILEEND
LD           POTENCIA #ACC <- (endereco)
