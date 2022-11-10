-- REALIZAR CARREGAMENTO DE DADOS E CONSULTAS
-- AUTOR: GILCIMAR GOMES
-- CAPITULO 3 - DESAFIO DE PROJETO LOGICO DO ZERO

use oficina;

show tables;

insert into Cliente (idPessoa, Pessoacol, Dados_Pessoais_idDados_Pessoais) values
					(2, 'Maria',2),
                    (3, 'joão',3),
                    (4, 'Tiago',4),
                    (5, 'Maria',5);

insert into Dados_Pessoais (idDados_Pessoais, Nome, Endereço, Telefone, CPF) values
					(2, 'Maria da Silva', 'Rua b', '3333-3333','002002002-02'),
                    (3, 'João da Silva', 'Rua C', '3333-3333','003003003-03'),
                    (4, 'Tiago da Silva', 'Rua d', '3333-3333','004004004-04'),
                    (5, 'Maria da Silva', 'Rua e', '3333-3333','005005005-05');

select * from cliente;

insert into Veículo (idVeículo, Modelo, Marca, Placa, KM, Pessoa_idPessoa, OS_Ordem_de_Serviço_idOS_Ordem_de_Serviço) values
					(1, 'Uno','FIAT','ABC-0101',10000,1,1),
                    (2, 'Palio','FIAT','ABC-0102',90000,1,2),
                    (3, 'GOL','VW','ABC-0103',50000,2,3),
                    (4, 'Clio','Renault','ABC-0104',70000,3,4),
                    (5, '208','PEGEOUT','ABC-0105',30000,4,5);

insert into OS_Ordem_de_Serviço (idOS_Ordem_de_Serviço, Valor_Total, Data_de_Entrega, Data_de_Emissão) Values
					(1,'250',null,null),
                    (2,'1250',null,null),
                    (3,'2250',null,null),
                    (4,'50',null,null),
                    (5,'1150',null,null);
                    
-- CONSULTAS
-- Mostrar todos veiculos cadastrados a Marca FIAT
select modelo, marca
from Veículo
where  Marca = 'FIAT';

select modelo, marca, Count(*)
from veículo
group by marca = 'FIAT';

-- Mostar veículos ordenados por KM
Select Modelo, KM
from veículo
order by KM;

-- Juntar tabela e mostrar qual carro é de cada pessoa
Select DP.nome,V.modelo
from Dados_pessoais DP join veículo V
group by DP.nome;

select * from Veículo;
