# Desafio 1/3
#Dada a letra N do alfabeto, nos diga qual a sua posição.

#Entrada
#Um único caracter N, uma letra maiúscula ('A'-'Z') do alfabeto (que contém 26 letras).

#Saída
#Um único inteiro, que representa a posição da letra no alfabeto.

def Cria_alfabeto():
  return [chr(i) for i in range(ord('A'),ord('Z')+1)] # Cria um lista com todas as letras do alfabeto
#print(Cria_alfabeto())

lista = Cria_alfabeto() 
letra = input() ("Digite a Letra (A-Z): ") # Recebe a entrada da letra que deseja saber a posição / para desafio deixado a saida em branco para o sistema inserir entrada
letra_2= letra.upper() # converte a entrada para letra maíscula
print(lista.index(letra_2)+1) # procura o indice da letra na lista e soma mais 1 visto que a lista começa de zero
 