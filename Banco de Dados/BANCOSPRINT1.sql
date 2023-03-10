CREATE DATABASE thermoHolic;

USE thermoHolic;

CREATE TABLE usuario (
	
	idUsuario INT PRIMARY KEY auto_increment,
    nome varchar(70) NOT NULL,
    senha varchar(8) NOT NULL,
    email varchar(70) NOT NULL,
    celular varchar(11),
    nivelAcesso INT NOT NULL,
    constraint chkNivelAcesso CHECK (nivelAcesso IN (1, 2, 3))

);

INSERT INTO usuario (nome, senha, email, CNPJ, tel, celular, nivelAcesso) VALUES
	('Gustavo Albino Pereira' , 'A234567@', 'gustavo.pereira@sptech.school', '12.345.678/0003-00', '1234567891', '11993347562', 1); 
    
SELECT * FROM usuario;

create table empresa (
idEmpresa int primary key auto_increment,
nomeEmpresa varchar (70),
CNPJ char(18) NOT NULL,
tel varchar(10),
qntSalas int	);



create table sensor (
idSensor int primary key ,
nomeSensor varchar (10),
sala varchar (60), 
idEmpresaSensor int,
constraint ckcSensor check (nomeSensor in ('DHT11', 'LM35')
 );
 

create table TempUmi (
idTempUmi int primary key auto_increment,
idSensor int,
temp double,
umi double,
dtHora datetime);