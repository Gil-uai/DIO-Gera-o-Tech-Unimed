# Desafio 1
# Calcular um ICM, onde ICM é Interferência de Comunicação Magica
# Formula ICM - Distancia entre 2 Palantirs / diametro Palantir Sauron + diametro do Palantir de Saruman

print ("#####INFORME DOS DADOS ABAIXO#####")
#print ("Digite a distancia entre os Palantirs:")
#entrada = input ()
#distancia_pa = int (entrada)

#print ("Digite o diâmetro do Palantir de Sauron:")
#entrada = input ()
#diametro_sauron = int (entrada)

#print ("Digite o diâmetro do Palantir de Saruman:")
#entrada = input ()
#diametro_saruman = int (entrada)

entrada = input().split()                           

distancia_pa = int(entrada[0])
diametro_saruman = int(entrada[1])
diametro_sauron = int(entrada[2])

if (distancia_pa * diametro_saruman * diametro_sauron) <= 0 or distancia_pa > 10000 or diametro_saruman > 100 or diametro_sauron > 100:
    print ("Valores Invalidos")
else:
    resultado = (distancia_pa / (diametro_saruman + diametro_sauron))
    print (f"Reesultado: {resultado:.2f}")



