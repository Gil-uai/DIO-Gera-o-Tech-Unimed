# Narrativa Escopo E-Commerce :bank:

## Narrativa - Produto :gift:

- Os produtos são vendidos por uma única plataforma online.

Contudo, estes podem ter vendedores distintos (terceiros)

- Cada produto possui um fornecedor
- Um ou mais produtos podem compor um pedido

## Narrativa - Cliente :man:

- O Cliente pode se cadastrar no site com seu CPF ou CNPJ;
- o Endereço do cliente ira´determinar o valor do frete;
- Um Cliente pode comprar mais de um pedido. Este tem um periodo de carência para devolução;

## Narrativa - Pedido :moneybag:

- Os pedidos são criados por clientes e possuem informação de compra, endereço e status de entrega
- Um produto ou mais compoem o pedido
- O pedido pode ser cancelado



# Refinamento e Premissas :hammer_and_wrench::star:



## Narrativa - Fornecedor :arrow_down:

Um fornecedor pode fornecer mais de um produto

Todo fornecedor deve ter um CNPJ

Um fornecedor pode ter mais de um endereço com CNPJ diferente

## Narrativa Pagamento  :money_with_wings:

Pode ter cadastrado mais de um forma de pagamento por cliente

## Narrativa entrega :truck:

Cada entrega deve conter o status da mesma

Cada entega deve conter o codigo de rasterio



## * Narrativas definidas para elaboração* :pushpin:

Realizada especialização da entidade Cliente, sendo que a mesma pode ser Fisica (CPF) ou Juridica (CNPJ)



### Inserida a entidade login :abcd:

A entidade login tem tem que validar os dados de entrada e recuperar os dados do cliente

Cada CPF ou CNPJ pode ter somente 1 login



### Inserida a entidade Pessoa :person_frowning:

A entidade pessoa faz generaliza a entidade Pessoa Fisica, Pessoa Juridica, Fornecedor e Revendedor

Par esta Entidade foi criada a especialização endereço e telefone

A entidade pessoa deve definir qual tipo de pessoa



### Entidade Telefone :phone:

Cada pessoa pode ter um ou varios tipos de telefone 

Cada pessoa deve ter  pelo menos um telefone cadastrado

### Entidade Endereço :round_pushpin:

Uma pessoa pode ter mais de um endereço

Os endereço de entrega e cobrança podem ser diferentes

Cada pessoa precisa ter pelo menos um endereço cadastrado

### Entidade Entrega e Transportadora :truck:

Para cada pedido a um processo de entrega

Um pedido so pode ser entregue com todos os itens do mesmo

A entidade entrega deve informar o status da entrega e codigo para rastreio

Uma entrega so pode ser realizada por uma transportadora

Uma transportadora pode realizar várias entregas



### Entidade Forma de Pagamento :credit_card:

Um Cliente pode ter várias formas de pagamento

Um cliente pode ter mais de um cartão cadastrado

Um pedido so pode ter uma forma de pagamento



# COMENTARIOS GERAIS :

Para implementação do projeto do E-COMMERCE temos as condições gerais abaixo:

Cliente ao acessar o sistema tem que fazer um login, após esta etapa já conseguimos definir o tipo de cliente CPF ou CNPJ e com isso recuperar os dados do mesmo. O Cliente pode fazer um ou vários PEDIDOS sendo que cada pedido pode ter um ou vários PRODUTOS, produtos este que pode ser fornecido por um ou vários FORNECEDORES, todos os fornecedores devem ter um CNPJ. Após fechamento do pedido o PAGAMENTO  poderá ser realizado atraves de um unica forma de pagamento, porém um CLIENTE pode ter cadastrado varias formas de pagamento, sendo que a forma de pgamento CARTÃO DE CREDITO  o cliente pode ter mais de um cartão cadastrado.

Após o pagamento o cliente pode escolher o endereço de entrega do PEDIDO. A ENTREGA de um pedido do pode ser realizada por uma TRANSPORTADOR, sendo que esta deve informar a previsão de entrega, codigo de rastreio e status da entrega de cada pedido. Uma TRANSPORTADora pode entregar vários pedidos.

Os PRODUTOS, so podem ser vendidos se o mesmo constar no estoque, sendo que no estoque deve identificar onde o mesmo esta alocado e sua quantidade.

Algumas premissas não foram consideradas para o projeto uma vez que utilizamos o mesmo com intuito didatico.

**GILCIMAR GOMES**:man_farmer:























