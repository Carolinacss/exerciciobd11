CREATE DATABASE dbjvgui;
use dbjvgui;

CREATE table tbusuario(
idUsuario int primary key,
NomeUsuario varchar(45),
DataNascimento date
);


CREATE table tbCliente( 
CodigoCli smallint primary key,
Nome varchar(50),
Endereco varchar(60)
);

CREATE table tbEstado(
Id int primary key,
Uf char(2)
);

CREATE table tbProdutos(
Barras decimal(13,0) primary key,
Valor decimal(18,4),
descricao varchar(230) 
);

describe tbUsuario;
describe tbCliente;
describe tbEstado;
describe tbProdutos;

SHOW DATABASES;

ALTER TABLE tbCliente modify Nome varchar(58); 
ALTER TABLE tbProdutos add quantidade int; 

DROP TABLE tbEstado;

ALTER TABLE tbUsuario drop DataNascimento;

