while True:
    arquivo = str(input())
    espaco = 12
    f = open( arquivo + ".asm").readlines()
    linhas = []
    nml = 0
    for line in f:
        l = str(line).replace("\n","").upper()
        l = str(l).replace("\t"," ")
        while "  " in l:
            l = str(l).replace("  "," ")
        l = str(l).strip()
        cmd = str(l).split(" ")
        if len(cmd) > 1:
            while len(cmd[0]) <= espaco:
                cmd[0] = cmd[0] + " "
            l = cmd[0] + cmd[1]
        linhas.append(l)
        
        nl = len(str(l))
        if nl > nml:
            nml = nl       

    data = []
    text = []
    textf = []

    d = True
    for linha in linhas:
        if d:
            if str(linha).startswith(".TEXT"):
                d = False
                continue
            if str(linha).startswith(".DATA"):
                continue
            data.append(linha)
        else:
            text.append(linha)

    for l in text:
        if str(l).startswith("STO"):
            textf.append(str(l) + (" "*(nml - len(str(l)))) + " #(endereco) <- ACC")
        elif str(l).startswith("LD"):
            textf.append(str(l) + (" "*(nml - len(str(l)))) + " #ACC <- (endereco)")
        elif str(l).startswith("LDI"):
            textf.append(str(l) + (" "*(nml - len(str(l)))) + " #ACC <- constante")
        elif str(l).startswith("ADD"):
            textf.append(str(l) + (" "*(nml - len(str(l)))) + " #ACC <- ACC + (endereco)")
        elif str(l).startswith("ADDI"):
            textf.append(str(l) + (" "*(nml - len(str(l)))) + " #ACC <- ACC + constante")
        elif str(l).startswith("SUB"):
            textf.append(str(l) + (" "*(nml - len(str(l)))) + " #ACC <- ACC - (endereco)")
        elif str(l).startswith("SUBI"):
            textf.append(str(l) + (" "*(nml - len(str(l)))) + " #ACC <- ACC - constante")
        elif str(l).startswith("JMP"):
            textf.append(str(l) + (" "*(nml - len(str(l)))) + " #PC <- endereco")
        elif str(l).startswith("BGE"):
            textf.append(str(l) + (" "*(nml - len(str(l)))) + " #Se (STATUS.N=0) entao PC <- endereco, Se nao PC <- PC + 1")
        elif str(l).startswith("BEQ"):
            textf.append(str(l) + (" "*(nml - len(str(l)))) + " #Se (STATUS.Z=1) entao PC <- endereco, Se nao PC <- PC + 1")
        elif str(l).startswith("BGT"):
            textf.append(str(l) + (" "*(nml - len(str(l)))) + " #Se (STATUS.Z=0) e (STATUS.N=0) entao  PC <- endereco, Se nao PC <- PC + 1")
        elif str(l).endswith(":"):
            textf.append(str(l) + ((" "*(nml - len(str(l))))) + " #Rotulo - " + str(l)[:-1])
        else:
            textf.append(str(l))

    with open(arquivo + "_comentado.asm", "w") as f:
        f.write(".DATA\n")
        for d in data:
            f.write(str(d) + "\n")
        f.write(".TEXT\n")
        for t in textf:
            f.write(str(t) + "\n")
            
    print("Pronto")

