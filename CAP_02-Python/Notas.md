# Capitulo 2 - Python :snake:



Iniciar modo interativo.

Abrir terminal e digitar python

Para executar programa utilizar: python -y "nome do programa"

dir -> Retorna as lista de nomes no escopo local, que posso utilizar

Help - > Buscar dentro do escopo atual

constante: Em PY para toda constante o nome deve ser todo em maiúsculo

Snake case - Palavras sempre separadas por underline 

- Conversão de váriaveis

​	Toda divisão vai geral um valor float

​	Se eu utilizar na divisão // eu continuo com resultado um numero inteiro

- Função input

  Sempre recebe em String

  \n quebra de linha

  sep"#" - Coloca o simbolo entre chaves entre os caracteres

### Operadores Aritmeticos

"+" Mais

"-" Menos

"*" Multiplicação

"/" Divisão

"//" Divisão inteira

"%" Modulo (resto)

"**" Exponencial 

### Precedência dos Operadores

Parentesis

Expoentes

Multiplicação e divisão (da esquerda para a direita)

Somas e subtrações (da esquerda para a direita)

### Operadores de Comparação

"==" igualdade

"!=" Diferente

">=" Maior ou igual

"<=" Menor ou igual

o Valor de retorno das comparações é sempre boleano

### Operadores de Atribuição

"=" atribuição simples

"+=" atribuição com soma (aplicável com todos operadores aritméticos)



### Operadores Lógicos

"and" Todas as condições tem que ser verdadeira pra retornar verdadeiro 

"or" Precisa que uma condição apenas for verdadeira para retorna verdadeiro, precisa de todas falsas para ser falsa

"not" Sempre inverte a saída 

### Operadores de Identidade

"is" Compara se estão na mesma região de memoria

"is not" Compara se não estão na mesma região de memoria

Retorna falso e verdadeiro

### Operadores de associação

"in" Verificar se há um item em uma sequência 

"in not" Verificar se não esta na sequencia 

é case sensitive

# Estruturas Condicionais e de repetição

### Indentação

4 espaços em branco para indentação

: iniciar bloco

Indentar define onde começa e termina cada bloco

### Estruturas Condicionais

"if" Condicional simples com único desvio

if saldo > saque:

​		print ("mensagem")

"if/else" - Se for verdade executa o IF se for falsa executa o Else

if saldo > saque:

​		print ("mensagem")

else:

​		print ("Mensagem")

"if/elif/else" - Maior numeração de casos

opcao = int (input ("Informae uma opção: [1] Sacar \n [2] Extrato"))

if opcao ==1:

​		valor = float (input("Informe a quantia para saque:"))

elif opcao ==2:

​		print ("Exibir o Extrato")

else:

​		sys.exit ("Opção inválida")

Tipos de IF -> Aninhado e ternario

Ternario é uma instrução de uma unica linha



### Estrutura de Repetição

"for" - utilizado quando sabemos a quantidade de vezes que iremos repetir a ação

Sintaxe:

texto = input ("Informe um texto:")

VOGAIS = "AEIOU"

for letra in texto:

​	if letra.upper() in VOGAIS:

​			print (letra, end="")

else

print ()



"range" - Inicio inclusivo, final exclusivo

Sintaxe:

range (inicio, fim, step)



"while" - Utilizado para repetição quantas vezes será necessária a execução

Sintaxe:

opcao = -1

while opcao !=0:

​		opcao = int (input("[1] Sacar \n [2] Extrato \n [0] Sair \n:"))

​		inf opcao == 1:

​				print ("Sacando ...")

​		elif opcao ==2:

​				print ("Exibindo o extrato ...")

"break" corta o laço da execução se uma opção for atendida

"continue" utilizado para pular alguma situação ou regra

* atenção que break e continue podem gerar loops infinitos



# Manipulação de Strings



Maiúscula, minúscula e Titulo

Metodos:

upper:# tudo para Maiúsculo;

lower: tudo minúsculo

title: Primeira maiúscula 

strip: Exclui espaço em branco dos dois lados

lstrip: exclui espaço em branco da esquerda

rstrip: exclui  espaço em branco da direita

center: 2 argumentos (10,#) quantidade total de carateres que vc quer ocupar, segundo o caracter que quer utilizar se não colocar nada fica espaço em branco

.join - vai passar en todos itens da string e colocar o carater que vc definiu



### interpolar variáveis

1º metodo (%)

%s/d/f - onde a letra é o tipo de dados

Sintaxe:



2º Metodo (Fomat)

{ }

Sintaxe:

.format (linguagem, profissão...."variaveis")

Dentro das chaves posso colocar o indice da variavel que quero colocar em cada posição.



3º Metodo (f-string)

Sintaxe:

print (f"olá, me chamo {nome})

### Fatiamento de Strings

base 0

[inicio, end, step]

Espelhamento string - [::-1] faz ela ao inverso

### String de Multiplas linhas

""" três aspas duplas



# Analise de dados com Python e Pandas

variavel.count ("dados") conta quantas vezes aparece o argumento passado

variavel.replace ("Python", "frases")



### Estrutura de Dados

**lista** - entre couxetes

metodo remove - remove uma posição da lista

metodo len - tamanho da lista

in também pode ser utilizado para verificar existencia de item na lista

medoto max - maior numero da lista

metodo min - menor numero da lista

metodo append - acrescenta 1 elemento na lista

metodo extend - acrescenta mais de 1 elemento a lista

metodo sort - ordena do menor para o maior



**tuplas** - usa parenteses

as tuplas não imutaveis - não pode alterar o seu valor

**Dicionarios** - Usa Chaves

dc: ({"chave":10})

metodos keys - retorna as chaves

metodo ,values - retorno os valores do dicionario

metodo setdefault - procura se não encontra inseri

### Biblioteca Pandas

Retorna o nome das colunas : .collumns

tipo de dados da coluna: .dtypes

retorna os primeiros dados: .head

retorna as ultimas: .tail

retorna estatistica dos dados: .describe

df. ["nome da coluna"].unique : retorna os valores unicos de uma coluna

*filtrar*

oceania = df.loc[df["continente"] == "Oceania"]

*Agrupamento*

df.groupby ("continente") [""]

Ler os arquivos excel

df1 = pd.read_excel ("nome planilha.xlsx")

concat - juntar  planilhas

.sample (N) = Pega uma amostra de linhas

*alterar tipo de dados de um coluna*

df ["lojaID"] = df["LojaID"].astype ("object")

*verificar valores faltantes*

df.isnull  ().sum ()

substituindo valores nulos pela média

df["Vendas"].fillna (df["Vendas"].mean (), inplace=True), inplace é para substituir o valor em memoria

Substituindo o Valor por zero

df["Vendas"].fillna (0, inplace=True), 

Remover as linhas

df.dropna (inplace=True)

Remover linha sem valores na coluna vendas

df.dropna (subset=["Vendas"], inplace=True)

Remover linha que esteja com valores faltante em todas as colunas

df.dropna (how="all", inplace=true)

Inserindo coluna

df.["receita"] = df["Vendas"].mul(df["qte"])



Retorna os 3 maiores receitas

df.nlargest (3, "receita")

df.nsmallest (3, "receita")

*Agrupar e retorna os valores de uma coluna*

df.groupby ("Cidade")["Receita"].sum()

*Ordenar conjunto de dados*

df.sort_values ("receita", ascending=False).head(10)



df.shape - Informa tamanho da planilha

Configurar numeros.

pd.options.display.float_format = '{:20,.2f}'.format

sumarizar a base:.reset_index

### Trabalhando com datas

df["Data"] = pd.to_datetime (df["Data"])

agrupar por ano

groupby(df["data"].dt.year)



### Visualização de dados



**Biblioteca grafico**

import matplotlib.pyplot as plt

df ["Cidade"].value_count().plot.bar(title="Titulo do Grafico")

plt.xlabe ("Cidade") - Titulo do eixo X

plt.ylabe ("Total de Vendas") - Titulo do eixo Y

Alterar estilo

plt.style.use ("ggplot")



