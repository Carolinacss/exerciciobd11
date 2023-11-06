-- guilherme sola --

create DATABASE dbescola;
use dbescola;


CREATE TABLE tbcliente(
	IdCli int primary key,
    NomeCli varchar(50) not null,
    NumEnd smallint,
    DataCadastro datetime default current_timestamp()
);

ALTER TABLE tbcliente add column CPF decimal(11,0) not null unique;

ALTER TABLE tbcliente ADD column CEP decimal (8,0); 

create DATABASE dbempresa; 

CREATE TABLE tbendereco(
	CEP decimal(8,0) primary key,
    Logradouro varchar(250) not null,
    IdUf tinyint
);

Alter table tbcliente add foreign key (CEP) references tbendereco(CEP);

describe tbcliente; 

/*
1 - criar a chave estrangeira
2 - usar o comando default
3 - descobrir qual tipo de dado usar
*/

SHOW DATABASES;

DROP DATABASE dbempresa;

-- Exercicio 8 --

CREATE TABLE tbest(
	IdUf tinyint primary key,
    NomeUfs char(2) not null,
    NomeEstado char(40) not null
);


ALTER TABLE tbEndereco ADD foreign key Fk_IdUF_TbEndereco(IdUf) references tbEst(IdUf);

ALTER TABLE tbEst DROP column NomeEstado;

RENAME TABLE tbEst TO TbEstado;

ALTER TABLE tbEstado CHANGE NomeUfs NomeUf char(2) not null; 

ALTER TABLE tbEndereco ADD IdCid MEDIUMINT;

CREATE TABLE tbcidade(
	IdCid MEDIUMINT PRIMARY KEY, 
    NomeCidade VARCHAR(50) NOT NULL
);

ALTER TABLE tbcidade modify column NomeCidade varchar(250) not null;

ALTER TABLE tbEndereco ADD CONSTRAINT Fk_IdCid_TbEndereco FOREIGN KEY (IdCid) REFERENCES tbCidade(IdCid);

