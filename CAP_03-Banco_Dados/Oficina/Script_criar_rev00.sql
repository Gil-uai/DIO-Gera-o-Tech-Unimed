-- CRIAÇÃO DE MODELO LOGICO PARA CENARIO DE OFICINA MECÂNICA
-- AUTOR: GILCIMAR GOMES
create database oficina;
use oficina;
 -- PRIMEIRAMENTE IREMOS CRIAR TODAS AS TABELAS

show tables;

-- -----------------------------------------------------
-- Table `oficina`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oficina.Cliente (
	idPessoa INT NOT NULL,
	Pessoacol VARCHAR(45) NULL,
	Dados_Pessoais_idDados_Pessoais INT NOT NULL,
	PRIMARY KEY (`idPessoa`),
	INDEX `fk_Cliente_Dados_Pessoais1_idx` (`Dados_Pessoais_idDados_Pessoais` ASC) VISIBLE,
	CONSTRAINT `fk_Cliente_Dados_Pessoais1`
    FOREIGN KEY (`Dados_Pessoais_idDados_Pessoais`)
    REFERENCES oficina.`Dados_Pessoais` (`idDados_Pessoais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table `oficina`.`Dados Pessoais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oficina.Dados_Pessoais (
	idDados_Pessoais INT NOT NULL,
	Nome VARCHAR(45) NULL,
	Endereço VARCHAR(45) NULL,
	Telefone VARCHAR(45) NULL,
	CPF VARCHAR(45) NULL,
  PRIMARY KEY (`idDados_Pessoais`));


-- -----------------------------------------------------
-- Table `oficina`.`OS - Ordem de Serviço`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oficina.OS_Ordem_de_Serviço (
	idOS_Ordem_de_Serviço INT NOT NULL,
	Valor_Total VARCHAR(45) NULL,
	Data_de_Entrega VARCHAR(45) NULL,
	Data_de_Emissão VARCHAR(45) NULL,
	Status VARCHAR(45) NULL,
  PRIMARY KEY (`idOS_Ordem_de_Serviço`));


-- -----------------------------------------------------
-- Table `oficina`.`Veículo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oficina.Veículo (
	idVeículo INT NOT NULL,
	Modelo VARCHAR(45) NULL,
	Marca VARCHAR(45) NULL,
	Placa VARCHAR(10) NULL,
	KM INT NULL,
	Pessoa_idPessoa INT NOT NULL,
	OS_Ordem_de_Serviço_idOS_Ordem_de_Serviço INT NOT NULL,
	PRIMARY KEY (`idVeículo`, `Pessoa_idPessoa`, `OS_Ordem_de_Serviço_idOS_Ordem_de_Serviço`),
	INDEX `fk_Veículo_Pessoa1_idx` (`Pessoa_idPessoa` ASC) VISIBLE,
	INDEX `fk_Veículo_OS - Ordem de Serviço1_idx` (`OS_Ordem_de_Serviço_idOS_Ordem_de_Serviço` ASC) VISIBLE,
	CONSTRAINT `fk_Veículo_Pessoa1`
    FOREIGN KEY (`Pessoa_idPessoa`)
    REFERENCES oficina.Cliente (`idPessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Veículo_OS_Ordem_de_Serviço1`
    FOREIGN KEY (`OS_Ordem_de_Serviço_idOS_Ordem_de_Serviço`)
    REFERENCES oficina.OS_Ordem_de_Serviço (`idOS_Ordem_de_Serviço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table `oficina`.`Mão-de-obra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oficina.mao_de_obra (
	idmao_de_obra INT NOT NULL,
	Nome VARCHAR(45) NULL,
	Valor FLOAT NULL,
  PRIMARY KEY (`idmao_de_obra`));

show tables;

-- -----------------------------------------------------
-- Table `mydb`.`Peças`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`Peças` (
  `idPeças` INT NOT NULL,
  `Codigo` VARCHAR(45) NULL,
  `Descrição` VARCHAR(45) NULL,
  `Marca` VARCHAR(45) NULL,
  PRIMARY KEY (`idPeças`));



-- -----------------------------------------------------
-- Table `oficina`.`Mecânicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oficina.Mecânicos (
	idMecânicos INT NOT NULL,
	Especialidade VARCHAR(45) NULL,
	Dados_Pessoais_idDados_Pessoais INT NOT NULL,
	PRIMARY KEY (`idMecânicos`),
	INDEX `fk_Mecânicos_Dados_Pessoais1_idx` (`Dados_Pessoais_idDados_Pessoais` ASC) VISIBLE,
	CONSTRAINT `fk_Mecânicos_Dados_Pessoais1`
    FOREIGN KEY (`Dados_Pessoais_idDados_Pessoais`)
    REFERENCES oficina.Dados_Pessoais (`idDados_Pessoais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table `oficina`.`Mecânicos_has_OS - Ordem de Serviço`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oficina.Mecânicos_has_OS_Ordem_de_Serviço (
  Mecânicos_idMecânicos INT NOT NULL,
  OS_Ordem_de_Serviço_idOS_Ordem_de_Serviço INT NOT NULL,
  PRIMARY KEY (`Mecânicos_idMecânicos`, `OS_Ordem_de_Serviço_idOS_Ordem_de_Serviço`),
  INDEX `fk_Mecânicos_has_OS_Ordem_de_Serviço_OS_Ordem_de_Serv_idx` (`OS_Ordem_de_Serviço_idOS_Ordem_de_Serviço` ASC) VISIBLE,
  INDEX `fk_Mecânicos_has_OS_Ordem_de_Serviço_Mecânicos1_idx` (`Mecânicos_idMecânicos` ASC) VISIBLE,
  CONSTRAINT `fk_Mecânicos_has_OS_Ordem_de_Serviço_Mecânicos1`
    FOREIGN KEY (`Mecânicos_idMecânicos`)
    REFERENCES `oficina`.`Mecânicos` (`idMecânicos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mecânicos_has_OS_Ordem_de_Serviço_OS_Ordem_de_Servi1`
    FOREIGN KEY (`OS_Ordem_de_Serviço_idOS_Ordem_de_Serviço`)
    REFERENCES `oficina`.`OS_Ordem_de_Serviço` (`idOS_Ordem_de_Serviço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table `oficina`.`OS - Ordem de Serviço_has_Mão-de-obra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oficina.OS_Ordem_de_Serviço_has_Mao_de_obra (
	OS_Ordem_de_Serviço_idOS_Ordem_de_Serviço INT NOT NULL,
	Mao_de_obra_idMao_de_obra INT NOT NULL,
	PRIMARY KEY (`OS_Ordem_de_Serviço_idOS_Ordem_de_Serviço`, `Mao_de_obra_idMao_de_obra`),
	INDEX `fk_OS_Ordem_de_Serviço_has_Mao_de_obra_Mao_de_obra1_idx` (`Mao_de_obra_idMao_de_obra` ASC) VISIBLE,
	INDEX `fk_OOS_Ordem_de_Serviço_has_Mao_de_obra_OS_Ordem_de_Se_idx` (`OS_Ordem_de_Serviço_idOS_Ordem_de_Serviço` ASC) VISIBLE,
	CONSTRAINT `fk_OS_Ordem_de_Serviço_has_Mao_de_obra_OS_Ordem_de_Serv1`
    FOREIGN KEY (`OS_Ordem_de_Serviço_idOS_Ordem_de_Serviço`)
    REFERENCES `oficina`.`OS_Ordem_de_Serviço` (`idOS_Ordem_de_Serviço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
	CONSTRAINT `fk_OS_Ordem_de_Serviço_has_Mao_de_obra_Mao_de_obra1`
    FOREIGN KEY (`Mao_de_obra_idMao_de_obra`)
    REFERENCES `oficina`.`Mao_de_obra` (`idMao_de_obra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

show tables;

-- -----------------------------------------------------
-- Table `oficina`.`OS - Ordem de Serviço_has_Peças`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oficina.`OS_Ordem_de_Serviço_has_Peças` (
	OS_Ordem_de_Serviço_idOS_Ordem_de_Serviço INT NOT NULL,
	`Peças_idPeças` INT NOT NULL,
	PRIMARY KEY (`OS_Ordem_de_Serviço_idOS_Ordem_de_Serviço`, `Peças_idPeças`),
	INDEX `fk_OS_Ordem_de_Serviço_has_Peçs_Peçs1_idx` (`Peças_idPeças` ASC) VISIBLE,
	INDEX `fk_OS_Ordem_de_Serviço_has_Peças_OS_Ordem_de_Serviço_idx` (`OS_Ordem_de_Serviço_idOS_Ordem_de_Serviço` ASC) VISIBLE,
	CONSTRAINT `fk_OS_Ordem_de_Serviço_has_Peças_OS_Ordem_de_Serviço1`
    FOREIGN KEY (`OS_Ordem_de_Serviço_idOS_Ordem_de_Serviço`)
    REFERENCES `oficina`.`OS_Ordem_de_Serviço` (`idOS_Ordem_de_Serviço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
	CONSTRAINT `fk_OS_Ordem_de_Serviço_has_Peças_Peças1`
    FOREIGN KEY (`Peças_idPeças`)
    REFERENCES `oficina`.`Peças` (`idPeças`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


show table status;