#Entrada -> Tempo de viagem em Horas (tempo_viagem)
#Entrada -> velocidade média em KM\H (Velocidade_media)

entrada = input().split() 
consumo = 12                          

tempo_viagem = int(entrada[0])
velocidade_media = int(entrada[1])

resultado = (tempo_viagem * velocidade_media) / 12
print (f"Quantidade de litros necessários: {resultado:.3f} litros")