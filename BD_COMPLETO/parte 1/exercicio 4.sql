CREATE DATABASE dbFátima;
USE dbFátima;

CREATE TABLE tbproduto(
idprod int not null primary key,
nomeprod varchar(50) not null,
qtd int,
datavalidade date not null,
preço decimal not null
);

ALTER TABLE tbproduto add peso decimal;
ALTER TABLE tbproduto add marca varchar(50) not null;
ALTER TABLE tbproduto add cor varchar(50);

ALTER TABLE tbproduto drop cor;
ALTER TABLE tbproduto drop datavalidade;

describe tbproduto;



