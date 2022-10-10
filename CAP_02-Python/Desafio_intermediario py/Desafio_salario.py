#A empresa que você trabalha resolveu conceder um aumento salarial a todos funcionários, de acordo com a tabela abaixo:

#Salário	Percentual de Reajuste
#0 - 600.00
#600.01 - 900.00
#900.01 - 1500.00
#1500.01 - 2000.00
#Acima de 2000.00

#17%
#13%
#12%
#10%
#5%

#Leia o salário do funcionário e calcule e mostre o novo salário, bem como o valor de reajuste ganho e o índice reajustado, em percentual.

#A entrada contém apenas um valor de ponto flutuante, que pode ser maior ou igual a zero, com duas casas decimais, conforme exemplos abaixo.

from re import S

#Função salario recebe o salario nominal e o valor do rejuste conforme condições
class Salario:
    def __init__(self, salario, reajuste):
        self.salario = (salario)
        self.reajuste =(reajuste)

    def  calc_salario(self):
        novo_salario = self.salario * self.reajuste
        reajuste_2 = novo_salario - self.salario
        percentual = int ((self.reajuste - 1)*100)
        print("Novo salario:", f"{novo_salario:.2f}")
        print("Reajuste ganho:", f"{reajuste_2:.2f}")
        print("Em percentual:", percentual, "%")


salario = int(input())

#inserida váriaveis com os reajuste para facilitar manutenção dos valores
reajuste_01 = 1.17 # 17%
reajuste_02 = 1.13 # 13%
reajuste_03 = 1.12 # 12%
reajuste_04 = 1.10 # 10%
reajuste_05 = 1.05 # 5%


if salario > 0 and salario <= 600:
    calculo = Salario(salario,reajuste_01)
    calculo.calc_salario()

elif salario > 600 and salario <= 900:
     calculo = Salario(salario,reajuste_02)
     calculo.calc_salario()

elif salario > 900 and salario <=1500:
     calculo = Salario(salario,reajuste_03)
     calculo.calc_salario()

elif salario > 1500 and salario <=2000:
     calculo = Salario(salario,reajuste_04)
     calculo.calc_salario()

else:

     calculo = Salario(salario,reajuste_05)
     calculo.calc_salario()







        

