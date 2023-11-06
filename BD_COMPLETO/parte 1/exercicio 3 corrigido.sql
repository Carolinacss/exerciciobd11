CREATE DATABASE dbcomercio;
USE dbcomercio;

CREATE TABLE tbcliente(
id int primary key,
nomecli varchar(200) not null,
numend int not null,
compend varchar(50) 
);

CREATE TABLE tbclientepf(
cpf decimal(11.0) primary key, 
rg decimal(9,0),
rgdig char(1),
nascimento date not null
);

describe tbcliente;
describe tbclientepf;





