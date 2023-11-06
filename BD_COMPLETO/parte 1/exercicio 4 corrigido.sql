CREATE DATABASE dbFátima;
USE dbFátima;

CREATE TABLE tbproduto(
idprod int primary key,
nomeprod varchar(50) not null,
qtd int,
datavalidade date not null,
preço decimal(32,9) not null
);

ALTER TABLE tbproduto add peso decimal(5.2);
ALTER TABLE tbproduto add marca varchar(50) not null;
ALTER TABLE tbproduto add cor varchar(50);

ALTER TABLE tbproduto drop cor;
ALTER TABLE tbproduto drop datavalidade;
-- faltando modificação do peso not null
describe tbproduto;



