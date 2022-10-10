# Dicionario em Python

## Classes

*.copy*

copia = contato.copy()

*.fromkeys*

Cria chaves 

dict.fromkeys (["nome", "telefone"])

Cria chaves sem valor ou com valor padrão.

*.get*

.get("chave")

se não encontrar ele retorna None

.get("chave", {})

se não encontrar ele vai retorno o segundo argumento colocado no get neste caso {}

*.items*

retorna lista de tuplas

*.keys*

retorna todas as chaves do dicionario

*.pop*

remove o valor da chave e retorno o valor da remoção

*.popitem*

remove chaves na sequencia

*.setdefault*

adiciona uma nova chave com o seu respectivo valor, caso a chave não exista

*.update*

atualiza o adicionario existente caso a chave já existe ou adiciona novo valor caso a chave não exista

*.values*

monstra todos os valores do dicionario

*.in*

Verifica se tem alguma chave dentro do dicionario

*.del*

passa o objeto que deve ser removido



## Funções em Python

Função sempre tem entrada e saída

definição da função:

def nome_identificador ():

print("Olá mundo")

*args e kwargs*

*args - valores nume tulpa

**kwargs - valores dicionario

Na definição da função de colocar barra, tudo que vier depois tem que ser por posição

colocando * todos os valores tem que ser passado por nome



### Escopo local e global



