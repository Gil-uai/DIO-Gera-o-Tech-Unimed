#h numero de cachorro quentes consumidos
#p numero de total de particpantes na competição

entrada = input().split()                           

h = int(entrada[0])
p = int(entrada[1])


if h <= 0 or p >= 1000:
    print ("Valores Invalidos")
else:
    resultado = (h / p)
    print (f"Resultado: {resultado:.2f}")