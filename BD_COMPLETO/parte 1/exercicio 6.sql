CREATE DATABASE dbdesenvolvimentos;
use dbdesenvolvimentos;

CREATE TABLE tbprodutos(
	IdProp int not null primary key,
	Nomeprod varchar(50) not null,
    Qtd int,
    Datavalidade date not null,
    Preço decimal(14,2) not null
); 

ALTER TABLE tbprodutos add peso decimal(14,2);
ALTER TABLE tbprodutos add cor varchar(50);
ALTER TABLE tbprodutos add marca varchar(50) not null;

ALTER TABLE tbprodutos drop column cor; 

ALTER TABLE tbprodutos modify column peso decimal(14,2) not null;

ALTER TABLE tbprodutos drop column cor;
-- a coluna cor já havia sido apagada -- 

CREATE DATABASE dbLojaGrande2;

ALTER TABLE tbprodutos add column cor varchar(50); 

use dblojica; 

CREATE TABLE tbcliente1(
	NomeCli varchar(50) not null,
    CodigoCli int primary key,
    DataCadastro date not null
);

use dbLojaGrande2;

CREATE TABLE tbfuncionario1(
	Nomefunc varchar(50) not null,
    CodigoFunc int primary key,
    DataCadastro datetime not null
);

DROP DATABASE dblojagrande2;


use dblojica;

ALTER TABLE tbcliente1 add column CPF tinyint not null unique;
