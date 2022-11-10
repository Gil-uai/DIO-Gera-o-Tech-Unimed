# Script E-Commerce :bookmark_tabs:

## Script Criação :building_construction:

-- CRIAÇÃO DE BANCO DE DADOS PARA CENÁRIO DE E-COMMERCE

-- Autor: Gilcimar Gomes

create database ecommerce;

use ecommerce;

 -- PRIMEIRAMENTE IREMOS CRIAR TODAS AS TABELAS

 

 -- -----------------------------------------------------

-- Table `Ecommerce.`Login`

-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Ecommerce.Login (

 idLogin INT NOT NULL AUTO_INCREMENT,

 Nome VARCHAR(45) NOT NULL,

 senha VARCHAR(45) NOT NULL,

 email VARCHAR(70) NOT NULL,

 Pessoa_Fisica_CPF VARCHAR(11) NOT NULL,

  Pessoa_Juridica_CNPJ VARCHAR(45) NOT NULL,

 PRIMARY KEY (`idLogin`, `Pessoa_Fisica_CPF`, `Pessoa_Juridica_CNPJ`),

 UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,

 INDEX `fk_Login_Pessoa_Fisica1_idx` (`Pessoa_Fisica_CPF` ASC) VISIBLE,

 INDEX `fk_Login_Pessoa_Juridica1_idx` (`Pessoa_Juridica_CNPJ` ASC) VISIBLE,

 CONSTRAINT `fk_Login_Pessoa_Fisica1`

  FOREIGN KEY (`Pessoa_Fisica_CPF`)

  REFERENCES `Ecommerce`.`Pessoa_Fisica` (`CPF`)

  ON DELETE NO ACTION

  ON UPDATE NO ACTION,

 CONSTRAINT `fk_Login_Pessoa_Juridica1`

  FOREIGN KEY (`Pessoa_Juridica_CNPJ`)

  REFERENCES `Ecommerce`.`Pessoa_Juridica` (`CNPJ`)

  ON DELETE NO ACTION

  ON UPDATE NO ACTION)

ENGINE = InnoDB;





-- -----------------------------------------------------

-- Table `Ecommerce`.`Pessoa Fisica`

-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Ecommerce.Pessoa_Fisica (

 idPessoa_Fisica INT NOT NULL AUTO_INCREMENT,

 CPF VARCHAR(11) NOT NULL,

 Nome VARCHAR(45) NULL,

 RG VARCHAR(45) NULL,

 Orgao_Expeditor_RG VARCHAR(45) NULL,

 Data_Emissão_RG DATE NULL,

 Data_Nascimento DATE NULL,

 Sexo VARCHAR(45) NULL,

 Nacionalidade VARCHAR(45) NULL,

 Nome_Pai VARCHAR(45) NULL,

 Nome_Mae VARCHAR(45) NULL,

 Pessoa_idPessoa INT NOT NULL,

 PRIMARY KEY (`idPessoa_Fisica`, `CPF`),

 UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE,

 INDEX `fk_Pessoa_Fisica_Pessoa1_idx` (`Pessoa_idPessoa` ASC) VISIBLE,

 CONSTRAINT `fk_Pessoa_Fisica_Pessoa1`

  FOREIGN KEY (`Pessoa_idPessoa`)

  REFERENCES `Ecommerce`.`Pessoa` (`idPessoa`)

  ON DELETE NO ACTION

  ON UPDATE NO ACTION)

ENGINE = InnoDB;



-- -----------------------------------------------------

-- Table `Ecommerce`.`Pessoa`

-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Ecommerce.Pessoa (

 idPessoa INT NOT NULL AUTO_INCREMENT,

 Tipo VARCHAR(45) NOT NULL,

 Email VARCHAR(45) NOT NULL,

 Nome VARCHAR(45) NOT NULL,

 Transportadora_idTransportadora INT NOT NULL,

 PRIMARY KEY (`idPessoa`),

 INDEX `fk_Pessoa_Transportadora1_idx` (`Transportadora_idTransportadora` ASC) VISIBLE,

 CONSTRAINT `fk_Pessoa_Transportadora1`

  FOREIGN KEY (`Transportadora_idTransportadora`)

  REFERENCES `Ecommerce`.`Transportadora` (`idTransportadora`)

  ON DELETE NO ACTION

  ON UPDATE NO ACTION)

ENGINE = InnoDB;



-- -----------------------------------------------------

-- Table `Ecommerce`.`Transportadora`

-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Ecommerce.Transportadora (

 idTransportadora INT NOT NULL,

 PRIMARY KEY (`idTransportadora`))

ENGINE = InnoDB;



Show tables;



-- -----------------------------------------------------

-- Table `Ecommerce`.`Pessoa Juridica`

-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Ecommerce.Pessoa_Juridica (

 idPessoa_Juridica INT NOT NULL AUTO_INCREMENT,

 CNPJ VARCHAR(45) NOT NULL,

 Razão_Social VARCHAR(45) NULL,

 Nome_Fantasia VARCHAR(45) NULL,

 Inscrição_Estadual VARCHAR(45) NULL,

 Inscrição_municipal VARCHAR(45) NULL,

 Tipo_Regime VARCHAR(45) NULL,

 Pessoa_idPessoa INT NOT NULL,

 PRIMARY KEY (`idPessoa_Juridica`, `CNPJ`),

 UNIQUE INDEX `CNPJ_UNIQUE` (`CNPJ` ASC) VISIBLE,

 INDEX `fk_Pessoa_Juridica_Pessoa1_idx` (`Pessoa_idPessoa` ASC) VISIBLE,

 CONSTRAINT `fk_Pessoa_Juridica_Pessoa1`

  FOREIGN KEY (`Pessoa_idPessoa`)

  REFERENCES Ecommerce.`Pessoa` (`idPessoa`)

  ON DELETE NO ACTION

  ON UPDATE NO ACTION)

ENGINE = InnoDB;





-- -----------------------------------------------------

-- Table `Ecommerce`.`Revendedor`

-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Ecommerce.Revendedor (

 idRevendedor INT NOT NULL,

 Revendedorcol VARCHAR(45) NULL,

 Pessoa_idPessoa INT NOT NULL,

 PRIMARY KEY (`idRevendedor`),

 INDEX `fk_Revendedor_Pessoa1_idx` (`Pessoa_idPessoa` ASC) VISIBLE,

 CONSTRAINT `fk_Revendedor_Pessoa1`

  FOREIGN KEY (`Pessoa_idPessoa`)

  REFERENCES Ecommerce.Pessoa (`idPessoa`)

  ON DELETE NO ACTION

  ON UPDATE NO ACTION)

ENGINE = InnoDB;



-- -----------------------------------------------------

-- Table `Ecommerce`.`Fornece`

-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Ecommerce.Fornece (

 Produto_idProduto INT NOT NULL,

 Fornecedor_idFornecedor INT NOT NULL,

 PRIMARY KEY (`Produto_idProduto`, `Fornecedor_idFornecedor`),

 INDEX `fk_Produto_has_Fornecedor_Fornecedor1_idx` (`Fornecedor_idFornecedor` ASC) VISIBLE,

 INDEX `fk_Produto_has_Fornecedor_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,

 CONSTRAINT `fk_Produto_has_Fornecedor_Produto1`

  FOREIGN KEY (`Produto_idProduto`)

  REFERENCES Ecommerce.Produto (`idProduto`)

  ON DELETE NO ACTION

  ON UPDATE NO ACTION,

 CONSTRAINT `fk_Produto_has_Fornecedor_Fornecedor1`

  FOREIGN KEY (`Fornecedor_idFornecedor`)

  REFERENCES Ecommerce.Fornecedor (`idFornecedor`)

  ON DELETE NO ACTION

  ON UPDATE NO ACTION)

ENGINE = InnoDB;



-- -----------------------------------------------------

-- Table `Ecommerce`.`Produto`

-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Ecommerce.Produto (

 idProduto INT NOT NULL AUTO_INCREMENT,

 Descrição VARCHAR(90) NULL,

 Valor VARCHAR(45) NOT NULL,

 Produtocol FLOAT NULL,

 Categoria VARCHAR(60) NULL,

 PRIMARY KEY (`idProduto`))

ENGINE = InnoDB;



-- -----------------------------------------------------

-- Table `Ecommerce`.`Fornecedor`

-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Ecommerce.Fornecedor (

 idFornecedor INT NOT NULL AUTO_INCREMENT,

 Tipo_Fonecedor VARCHAR(100) NOT NULL,

 Data_Cadastro VARCHAR(45) NULL,

 Pessoa_idPessoa INT NULL,

 PRIMARY KEY (`idFornecedor`),

 INDEX `fk_Fornecedor_Pessoa1_idx` (`Pessoa_idPessoa` ASC) VISIBLE,

 CONSTRAINT `fk_Fornecedor_Pessoa1`

  FOREIGN KEY (`Pessoa_idPessoa`)

  REFERENCES Ecommerce.Pessoa (`idPessoa`)

  ON DELETE NO ACTION

  ON UPDATE NO ACTION)

ENGINE = InnoDB;



show tables;



-- -----------------------------------------------------

-- Table `Ecommerce`.`Cliente`

-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Ecommerce.Cliente (

 idCliente INT NOT NULL,

 Pessoa_idPessoa INT NOT NULL,

 PRIMARY KEY (`idCliente`),

 INDEX `fk_Cliente_Pessoa1_idx` (`Pessoa_idPessoa` ASC) VISIBLE,

 CONSTRAINT `fk_Cliente_Pessoa1`

  FOREIGN KEY (`Pessoa_idPessoa`)

  REFERENCES Ecommerce.Pessoa (`idPessoa`)

  ON DELETE NO ACTION

  ON UPDATE NO ACTION)

ENGINE = InnoDB;



-- -----------------------------------------------------

-- Table `Ecommerce`.`Forma de pagamento`

-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Ecommerce.Forma_de_pagamento (

 idForma_de_pagamento INT NOT NULL AUTO_INCREMENT,

 PIX VARCHAR(45) NULL,

 Boleto VARCHAR(45) NULL,

 Transferência VARCHAR(45) NULL,

 Cliente_idCliente INT NOT NULL,

 PRIMARY KEY (`idForma_de_pagamento`, `Cliente_idCliente`),

 INDEX `fk_Forma_de_pagamento_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,

 CONSTRAINT `fk_Forma_de_pagamento_Cliente1`

  FOREIGN KEY (`Cliente_idCliente`)

  REFERENCES Ecommerce.Cliente (`idCliente`)

  ON DELETE NO ACTION

  ON UPDATE NO ACTION)

ENGINE = InnoDB;



-- -----------------------------------------------------

-- Table `Ecommerce`.`Pedido x Produto`

-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Ecommerce.Pedido_x_Produto (

 Pedido_idPedido INT NOT NULL,

 Produto_idProduto INT NOT NULL,

 PRIMARY KEY (`Pedido_idPedido`, `Produto_idProduto`),

 INDEX `fk_Pedido_has_Produto_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,

 INDEX `fk_Pedido_has_Produto_Pedido1_idx` (`Pedido_idPedido` ASC) VISIBLE,

 CONSTRAINT `fk_Pedido_has_Produto_Pedido1`

  FOREIGN KEY (`Pedido_idPedido`)

  REFERENCES Ecommerce.Pedido (`idPedido`)

  ON DELETE NO ACTION

  ON UPDATE NO ACTION,

 CONSTRAINT `fk_Pedido_has_Produto_Produto1`

  FOREIGN KEY (`Produto_idProduto`)

  REFERENCES Ecommerce.Produto (`idProduto`)

  ON DELETE NO ACTION

  ON UPDATE NO ACTION)

ENGINE = InnoDB;



Show tables;



-- -----------------------------------------------------

-- Table `Ecommerce`.`Pedido`

-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Ecommerce.Pedido (

 idPedido INT NOT NULL AUTO_INCREMENT,

 Status_01 VARCHAR(45) NOT NULL DEFAULT '\"Em andamento\"',

 Descrição VARCHAR(45) NOT NULL,

 Cliente_idCliente INT NOT NULL,

 Forma_de_pagamento_idForma_de_pagamento INT NOT NULL,

 Data_Pedido DATE NOT NULL,

 PRIMARY KEY (`idPedido`, `Cliente_idCliente`, `Forma_de_pagamento_idForma_de_pagamento`),

 INDEX `fk_Pedido_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,

 INDEX `fk_Pedido_Forma_de_pagamento1_idx` (`Forma_de_pagamento_idForma_de_pagamento` ASC) VISIBLE,

 CONSTRAINT `fk_Pedido_Cliente1`

  FOREIGN KEY (`Cliente_idCliente`)

  REFERENCES Ecommerce.Cliente (`idCliente`)

  ON DELETE NO ACTION

  ON UPDATE NO ACTION,

 CONSTRAINT `fk_Pedido_Forma_de_pagamento1`

  FOREIGN KEY (`Forma_de_pagamento_idForma_de_pagamento`)

  REFERENCES Ecommerce.Forma_de_pagamento (`idForma_de_pagamento`)

  ON DELETE NO ACTION

  ON UPDATE NO ACTION)

ENGINE = InnoDB;



-- -----------------------------------------------------

-- Table `Ecommerce`.`Produto em estoque`

-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Ecommerce.Produto_em_estoque (

 Produto_idProduto INT NOT NULL,

 Estoque_idEstoque INT NOT NULL,

 PRIMARY KEY (`Produto_idProduto`, `Estoque_idEstoque`),

 INDEX `fk_Produto_has_Estoque_Estoque1_idx` (`Estoque_idEstoque` ASC) VISIBLE,

 INDEX `fk_Produto_has_Estoque_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,

 CONSTRAINT `fk_Produto_has_Estoque_Produto1`

  FOREIGN KEY (`Produto_idProduto`)

  REFERENCES Ecommerce.Produto (`idProduto`)

  ON DELETE NO ACTION

  ON UPDATE NO ACTION,

 CONSTRAINT `fk_Produto_has_Estoque_Estoque1`

  FOREIGN KEY (`Estoque_idEstoque`)

  REFERENCES Ecommerce.Estoque (`idEstoque`)

  ON DELETE NO ACTION

  ON UPDATE NO ACTION)

ENGINE = InnoDB;



-- -----------------------------------------------------

-- Table `Ecommerce`.`Estoque`

-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Ecommerce.Estoque (

 idEstoque INT NOT NULL AUTO_INCREMENT,

 Quantidade INT NOT NULL,

 Alocação VARCHAR(45) NULL,

 PRIMARY KEY (`idEstoque`))

ENGINE = InnoDB;



show tables;



-- -----------------------------------------------------

-- Table `Ecommerce`.`Revendedor_has_Produto`

-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Ecommerce.Revendedor_has_Produto (

 Revendedor_idRevendedor INT NOT NULL,

 Produto_idProduto INT NOT NULL,

 PRIMARY KEY (`Revendedor_idRevendedor`, `Produto_idProduto`),

 INDEX `fk_Revendedor_has_Produto_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,

 INDEX `fk_Revendedor_has_Produto_Revendedor1_idx` (`Revendedor_idRevendedor` ASC) VISIBLE,

 CONSTRAINT `fk_Revendedor_has_Produto_Revendedor1`

  FOREIGN KEY (`Revendedor_idRevendedor`)

  REFERENCES Ecommerce.Revendedor (`idRevendedor`)

  ON DELETE NO ACTION

  ON UPDATE NO ACTION,

 CONSTRAINT `fk_Revendedor_has_Produto_Produto1`

  FOREIGN KEY (`Produto_idProduto`)

  REFERENCES Ecommerce.Produto (`idProduto`)

  ON DELETE NO ACTION

  ON UPDATE NO ACTION)

ENGINE = InnoDB;



-- -----------------------------------------------------

-- Table `mydb`.`Endereço`

-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `mydb`.`Endereço` (

 `idEndereço` INT NOT NULL AUTO_INCREMENT,

 `Logradouro` VARCHAR(100) NULL,

 `Numero` VARCHAR(10) NULL,

 `Bairro` VARCHAR(45) NULL,

 `Municipio` VARCHAR(45) NULL,

 `UF` VARCHAR(45) NULL,

 `CEP` VARCHAR(45) NULL,

 `Complemento` VARCHAR(45) NULL,

 `Principal` VARCHAR(45) NULL,

 `Entrega` VARCHAR(45) NULL,

 `Cobrança` VARCHAR(45) NULL,

 `Correspondência` VARCHAR(45) NULL,

 `Pessoa_idPessoa` INT NOT NULL,

 PRIMARY KEY (`idEndereço`),

 INDEX `fk_Endereço_Pessoa1_idx` (`Pessoa_idPessoa` ASC) VISIBLE,

 CONSTRAINT `fk_Endereço_Pessoa1`

  FOREIGN KEY (`Pessoa_idPessoa`)

  REFERENCES `mydb`.`Pessoa` (`idPessoa`)

  ON DELETE NO ACTION

  ON UPDATE NO ACTION)

ENGINE = InnoDB;



-- -----------------------------------------------------

-- Table `Ecommerce`.`Endereço`

-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Ecommerce.Endereço (

 idEndereço INT NOT NULL AUTO_INCREMENT,

 Logradouro VARCHAR(100) NULL,

 Numero VARCHAR(10) NULL,

 Bairro VARCHAR(45) NULL,

 Municipio VARCHAR(45) NULL,

 UF VARCHAR(45) NULL,

 CEP VARCHAR(45) NULL,

 Complemento VARCHAR(45) NULL,

 Principal VARCHAR(45) NULL,

 Entrega VARCHAR(45) NULL,

 Cobrança VARCHAR(45) NULL,

 Correspondência VARCHAR(45) NULL,

 Pessoa_idPessoa INT NOT NULL,

 PRIMARY KEY (`idEndereço`),

 INDEX `fk_Endereço_Pessoa1_idx` (`Pessoa_idPessoa` ASC) VISIBLE,

 CONSTRAINT `fk_Endereço_Pessoa1`

  FOREIGN KEY (`Pessoa_idPessoa`)

  REFERENCES Ecommerce.Pessoa (`idPessoa`)

  ON DELETE NO ACTION

  ON UPDATE NO ACTION)

ENGINE = InnoDB;



-- -----------------------------------------------------

-- Table `Ecommerce`.`Telefone`

-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Ecommerce.Telefone (

 idTelefone INT NOT NULL AUTO_INCREMENT,

 Tipo VARCHAR(45) NULL,

 Numero VARCHAR(45) NOT NULL,

 Pessoa_idPessoa INT NOT NULL,

 PRIMARY KEY (`idTelefone`),

 INDEX `fk_Telefone_Pessoa1_idx` (`Pessoa_idPessoa` ASC) VISIBLE,

 CONSTRAINT `fk_Telefone_Pessoa1`

  FOREIGN KEY (`Pessoa_idPessoa`)

  REFERENCES Ecommerce.Pessoa (`idPessoa`)

  ON DELETE NO ACTION

  ON UPDATE NO ACTION)

ENGINE = InnoDB;



show tables;



-- -----------------------------------------------------

-- Table `Ecommerce`.`Entrega`

-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Ecommerce.Entrega (

 idEntrega INT NOT NULL AUTO_INCREMENT,

 Rastreio VARCHAR(45) NULL,

 Status_Entrega VARCHAR(45) NOT NULL,

 Previsão_Entrega DATE NULL,

 Pedido_idPedido INT NOT NULL,

 Pedido_Cliente_idCliente INT NOT NULL,

 Transportadora_idTransportadora INT NOT NULL,

 PRIMARY KEY (`idEntrega`, `Pedido_idPedido`, `Pedido_Cliente_idCliente`),

 INDEX `fk_Entrega_Pedido1_idx` (`Pedido_idPedido` ASC, `Pedido_Cliente_idCliente` ASC) VISIBLE,

 INDEX `fk_Entrega_Transportadora1_idx` (`Transportadora_idTransportadora` ASC) VISIBLE,

 CONSTRAINT `fk_Entrega_Pedido1`

  FOREIGN KEY (`Pedido_idPedido` , `Pedido_Cliente_idCliente`)

  REFERENCES Ecommerce.Pedido (`idPedido` , `Cliente_idCliente`)

  ON DELETE NO ACTION

  ON UPDATE NO ACTION,

 CONSTRAINT `fk_Entrega_Transportadora1`

  FOREIGN KEY (`Transportadora_idTransportadora`)

  REFERENCES Ecommerce.Transportadora (`idTransportadora`)

  ON DELETE NO ACTION

  ON UPDATE NO ACTION)

ENGINE = InnoDB;



-- -----------------------------------------------------

-- Table `Ecommerce`.`Cartão`

-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Ecommerce.Cartão (

 idCartão INT NOT NULL AUTO_INCREMENT,

 Nome VARCHAR(45) NOT NULL,

 Validade VARCHAR(45) NOT NULL,

 CVC VARCHAR(45) NOT NULL,

 Numero VARCHAR(45) NOT NULL,

 Bandeira VARCHAR(45) NOT NULL,

 Forma_de_pagamento_idForma_de_pagamento INT NOT NULL,

 PRIMARY KEY (`idCartão`, `Forma_de_pagamento_idForma_de_pagamento`),

 INDEX `fk_Cartão_Forma_de_pagamento1_idx` (`Forma_de_pagamento_idForma_de_pagamento` ASC) VISIBLE,

 UNIQUE INDEX `Numero_UNIQUE` (`Numero` ASC) VISIBLE,

 CONSTRAINT `fk_Cartão_Forma de pagamento1`

  FOREIGN KEY (`Forma_de_pagamento_idForma_de_pagamento`)

  REFERENCES Ecommerce.Forma_de_pagamento (`idForma_de_pagamento`)

  ON DELETE NO ACTION

  ON UPDATE NO ACTION)

ENGINE = InnoDB;





select * from Pedido;



## Persistindo Banco e Realizando Consulta :calling::key::telescope:

-- Neste Script iremos persistir alguns dados no Banco Ecommerce

use Ecommerce; 

show tables;



insert into Transportadora (idTransportadora) values

​          (2),

​          (3),

​          (4),

​          (5);

select * from Transportadora;



insert into Pessoa (idPessoa, Tipo, Email, Nome, Transportadora_idTransportadora) values

​          (2, 'Fisica', 'maria@gmail.com', 'Maria',2),

​          (3, 'Fisica', 'Joao@gmail.com', 'João',3),

​          (4, 'Fisica', 'sebastiao@gmail.com', 'Sebastião',4),

​          (5, 'Fisica', 'noe@gmail.com', 'Noe',5);

​          

select * from Pessoa;



insert into Pessoa_Fisica (idPessoa_Fisica, CPF, Nome, RG, Orgao_Expeditor_RG, Data_Emissão_RG, Data_Nascimento, Sexo, Nacionalidade, Nome_Pai, Nome_Mae,Pessoa_idPessoa) values

​              (2, '00100100102', 'Maria da Silva', '01010102', 'SSP', null, null,'F', 'Brasileiro', null,null,1),

​              (3, '00100100103', 'João da Silva', '01010103', 'SSP', null, null,'M', 'Brasileiro', null,null,3),

​              (4, '00100100104', 'Sebastião da Silva', '01010104', 'SSP', null, null,'M', 'Brasileiro', null,null,4),

​              (5, '00100100105', 'Noe da Silva', '01010105', 'SSP', null, null,'M', 'Brasileiro', null,null,5);



select * from Pessoa_Fisica;



-- Filtro com WHERE STATEMENT

-- Filtrar o CPF e Nome da Pessoa onde o Sexo for F - Feminino

select CPF,Nome

from Pessoa_fisica

where Sexo = 'F';



-- Filtro com group by

-- Filtrar e ordenar por Sex e contar o numero de cada agrupamento

select CPF,Nome, sexo, count(*)

from Pessoa_fisica

group by Sexo;



-- Filtrar e ordenar

-- Filtrar CPF, Nome e Sexo e ordenar lista pelo Nome

select CPF,Nome, sexo

from Pessoa_fisica

order by Nome;



-- Agrupar por sexo onde a quantidade for maior que 1

select CPF,Nome, sexo, count(*)

from Pessoa_fisica

group by Sexo

having count(*) > 1;



-- Junção entre Tabela Pessoa e Pessoa_Fisica para mostar o Tipo da pessoa

select F.Nome, F.CPF, P.Tipo

from Pessoa_Fisica F join Pessoa P

group by F.Nome;



insert into Produto (idProduto, Descrição, Valor, Produtocol, Categoria) values

​      (1,'TV 29 Polegadas', 3000, 1, 'TV'),

​      (2,'Alexia', 200, 2, 'Infomatica'),

​      (3,'Geladeira Consul', 5000, 3, 'Eletrodomestico'),

​      (4,'Microondas', 500, 1, 'Eletrodomestico'),

​      (5,'Notebook Lenovo', 4600, 1, 'Informatica'),

​      (6,'Copo Stanley', 300, 1, 'Casa e Lazer'),

​      (7,'Churrasqueira Eletrica', 200, 1, 'Casa e Lazer');

​      

select * from Pessoa_Fisica;



update Pessoa_Fisica

set Nacionalidade = 'Argentino'

where idPessoa_Fisica = 5;





















