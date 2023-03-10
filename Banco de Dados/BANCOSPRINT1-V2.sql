-- CRIANDO O BANCO DE DADOS
CREATE DATABASE thermoHolic;

-- UTILIZANDO O BANCO DE DADOS
USE thermoHolic;

-- TABELA USUARIO
CREATE TABLE usuario (
	
	idUsuario INT PRIMARY KEY auto_increment,
    nome varchar(70) NOT NULL,
    senha varchar(8) NOT NULL,
    email varchar(70) NOT NULL,
    cpf varchar(11) NOT NULL,
    celular varchar(11),
    nivelAcesso INT NOT NULL,
    constraint chkNivelAcesso CHECK (nivelAcesso IN (1, 2, 3)) -- NIVEIS DE ACESSO: 1 = ACESSO TOTAL, 2 = ACESSO NORMAL, 3 = ACESSO RESTRITO

);

-- select de login (email,senha)
select  senha, email from usuario; 
-- select dashbord nome usuario 

-- select dash dato temp

-- select dash dato umi


-- DESCRIÇÃO DA TABELA USUARIO
DESC usuario;

-- INSERINDO DADOS NA TABELA USUARIO
INSERT INTO  usuario VALUES 
	( null, 'Maria Paula', '12345678', 'maria.bsilva@sptech.school', '10236589754', '11973114571', '1'),
	( null, 'Fernado', '12684521', 'fernado@sptech.school', '10236589754', '1196789645', '2'),
	( null, 'Isabel', '78542369', 'isabela@sptech.school', '10236589754', '11915879642', '3'),
	( null, 'Gyulia', '15486762', 'gyulia@sptech.school', '10236589754', '11945789632', '2'),
	( null, 'Gabriella', '68957432', 'gabriella@sptech.school', '10236589754', '11935486207', '1'),
	( null, 'Erick', '45712369', 'erick@sptech.school', '10236589754', '11945789627', '3'),
	( null, 'Gustavo', '45782368', 'gustavo@sptech.school', '10236589754', '11914789652', '1');

-- SELECTS DA TABELA USUARIO

-- TABELA EMPRESA
CREATE TABLE empresa (

	idEmpresa INT PRIMARY KEY,
	nomeEmpresa varchar(70),
	CNPJ char(18) NOT NULL,
	tel varchar(10) NOT NULL,
	emailEmpresa varchar(70) NOT NULL,
	qntSalas INT
) 	auto_increment =100; -- DEFININDO O INICIO DOS IDS DE EMPRESAS

-- DESCIÇÃO DA TABELA EMPRESA
DESC empresa;

-- INSERINDO DADOS NA TABELA EMPRESA
INSERT INTO empresa VALUES 
(100, 'Ambev', '07.526.557/0001-00','27244012','ambev@gmail.com', '5' ),
(101, 'Original', '08.930.673/0001-24','27256589','original@gmail.com', '2' ),
(102, 'Skol', '07.526.557/0001-00','24856973','ambev@gmail.com', '8' ),
(103, 'Heineken', '21.900.899/0001-79','57896423','heineken@gmail.com', '3' );

-- SELECTS DA TABELA EMPRESA
SELECT * FROM empresa;

-- TABELA NOMESENSOR
CREATE TABLE nomeSensor (

	idNomeSensor INT PRIMARY KEY,
	nomeSensor varchar(10) NOT NULL,
	constraint ckcSensor check (nomeSensor in ('DHT11', 'LM35')) -- DHT11 SENSOR DE TEMPERATURA, LM35 SENSOR DE UMIDADE
    
);

-- DESCRIÇÃO DA TABELA NOMESENSOR
DESC nomeSensor;

-- INSERINDO DADOS NA TABELA NOMESENSOR
INSERT INTO nomeSensor VALUES 
(1, 'DHT11'),
(2,'LM35');

-- SELECTS DA TABELA NOMESENSOR
SELECT * FROM nomeSensor;


-- TABELA SENSOR
CREATE TABLE sensor (
idSensor INT PRIMARY KEY auto_increment,
statusSensor varchar(10),
sala varchar(60) NOT NULL,
idEmpresaSensor int,
idNomeSensor int,
constraint ckcStatusSensor check (statusSensor in ('Ativo', 'Inativo', 'Manutenção'))
 );

 insert into sensor values 
(null, 'Ativo' , 'salaA', 103, 1),
(null,  'Ativo' , 'salaA', 103, 2),
(null,  'Inativo' , 'salaB', 100, 1),
(null,  'Ativo' , 'salaB', 100, 2),
(null,  'Manutenção' , 'salaC', 102, 1),
(null,  'Inativo' , 'salaC', 102, 2 ),
(null,  'Ativo' , 'salaD', 101, 1 ),
(null,  'Manutenção' , 'salaD', 101, 2 );

select*from sensor;

create table TempUmi (
idTempUmi int primary key auto_increment,
idSensor int,
temp double,
umi double,
dtHora datetime default current_timestamp
);
alter table TempUmi auto_increment = 150;
drop table TempUmi;

insert into TempUmi (idTempUmi, idSensor,temp ) values -- Valores do LM35
(null, 1,'50.00' ),
(null, 3,'52.00'),
(null, 5,  '55.00'),
(null, 7,'60.00');

insert into TempUmi (idTempUmi, idSensor,umi) values -- Valores do DHT11
(null, 2, '60.00'),
(null, 4,'52.00'),
(null, 6,  '65.00'),
(null, 8,'61.00');

select *from TempUmi ;

