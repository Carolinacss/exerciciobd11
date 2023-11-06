CREATE DATABASE dbLuis;
USE dbLuis;

CREATE Table tbProduto(
IdProp int not null primary key,
NomeProd varchar(50) not null,
Quantidade int,
DataValidade date not null,
Preco decimal(25,2) not null
);

Create table tbcliente(
codigo int primary key,
nomecli varchar(50) not null,
datanascimento date not null
);

describe tbproduto;
describe tbcliente;