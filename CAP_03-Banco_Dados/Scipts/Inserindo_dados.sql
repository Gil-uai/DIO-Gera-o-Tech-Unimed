-- Neste Script iremos persistir alguns dados no Banco Ecommerce
use Ecommerce; 
show tables;

insert into Transportadora (idTransportadora) values
					(2),
                    (3),
                    (4),
                    (5);
select * from Transportadora;

insert into Pessoa (idPessoa, Tipo, Email, Nome, Transportadora_idTransportadora) values
					(2, 'Fisica', 'maria@gmail.com', 'Maria',2),
                    (3, 'Fisica', 'Joao@gmail.com', 'João',3),
                    (4, 'Fisica', 'sebastiao@gmail.com', 'Sebastião',4),
                    (5, 'Fisica', 'noe@gmail.com', 'Noe',5);
                    
select * from Pessoa;

insert into Pessoa_Fisica (idPessoa_Fisica, CPF, Nome, RG, Orgao_Expeditor_RG, Data_Emissão_RG, Data_Nascimento, Sexo, Nacionalidade, Nome_Pai, Nome_Mae,Pessoa_idPessoa) values
							(2, '00100100102', 'Maria da Silva', '01010102', 'SSP', null, null,'F', 'Brasileiro', null,null,1),
                            (3, '00100100103', 'João da Silva', '01010103', 'SSP', null, null,'M', 'Brasileiro', null,null,3),
                            (4, '00100100104', 'Sebastião da Silva', '01010104', 'SSP', null, null,'M', 'Brasileiro', null,null,4),
                            (5, '00100100105', 'Noe da Silva', '01010105', 'SSP', null, null,'M', 'Brasileiro', null,null,5);

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
			(1,'TV 29 Polegadas', 3000, 1, 'TV'),
            (2,'Alexia', 200, 2, 'Infomatica'),
            (3,'Geladeira Consul', 5000, 3, 'Eletrodomestico'),
            (4,'Microondas', 500, 1, 'Eletrodomestico'),
            (5,'Notebook Lenovo', 4600, 1, 'Informatica'),
            (6,'Copo Stanley', 300, 1, 'Casa e Lazer'),
            (7,'Churrasqueira Eletrica', 200, 1, 'Casa e Lazer');
            
select * from Pessoa_Fisica;

update Pessoa_Fisica
set Nacionalidade = 'Argentino'
where idPessoa_Fisica = 5;


