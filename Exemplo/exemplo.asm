.DATA
I: 	 0
J:   0
A:   0
B:	 0
C:	 0
BASE: 3
EXPOENTE: 4
POTENCIA: 0
.TEXT
LD BASE
STO POTENCIA
LD EXPOENTE
SUBI 1
STO EXPOENTE
LDI  0
STO  J 
WHILE:
LD	 J
SUB	 EXPOENTE
BGE  WHILEEND
LD POTENCIA
STO A
LD BASE
STO B
LDI  0
STO  I 
MULTI:
LD	 I
SUB	 B
BGE  MULTIEND
LD   C
ADD  A
STO  C
LD   I
ADDI 1
STO  I
JMP  MULTI
MULTIEND:
LD C
STO POTENCIA
LDI 0
STO A
LDI 0
STO B
LDI 0
STO C
LD   J
ADDI 1
STO  J
JMP  WHILE
WHILEEND:
LD POTENCIA