-- exercicio 11 --
drop database dbdistribuidora;
create DATABASE dbdistribuidora;
use dbdistribuidora;

CREATE TABLE tbestado(
UFid int primary key auto_increment,
UF char(2) not null
);

CREATE TABLE tbcidade(
CidadeId int primary key auto_increment,
Cidade varchar(200) not null
);

CREATE TABLE tbbairro(
BairroId int primary key auto_increment,
Bairro varchar(200) not null
);

CREATE TABLE tbendereco(
Logradouro varchar(200) not null,
Cep decimal(8,0) primary key,
Bairro int not null,
Cidade int not null,
Uf int not null,
foreign key (Bairro) references tbbairro(Bairroid), 
foreign key (Cidade) references tbCidade(CidadeId), 
foreign key (Uf) references tbestado(Ufid) 
);

CREATE TABLE tbcliente( 
Id int primary key auto_increment,
Nomecli varchar(200) not null,
Numend decimal(6,0) not null,
Compend varchar(50),
Cepcli decimal(8,0) not null,
foreign key (Cepcli) references tbendereco(Cep) 
);

CREATE TABLE tbclientePJ(
Cnpj decimal(14,0) primary key,
IE decimal(11,0) unique,
Id int,
foreign key (Id) references tbcliente(Id)
);

CREATE TABLE tbclientePF(
Cpf decimal(11,0) primary key,
Rg decimal(9,0) not null,
Rg_Dig char(1) not null,
Nasc date not null,
Id int,
foreign key (Id) references tbcliente(Id)
);

CREATE TABLE tbnota_fiscal(
Nf int primary key,
Totalnota decimal(8,2) not null,
Dataemissao date not null
);
 
CREATE TABLE tbvenda(
Numerovenda int primary key,
Datavenda date not null,
Totalvenda decimal(8,2) not null,
Id_cli int not null, 
Nf int,
foreign key (Nf) references tbNota_fiscal(Nf),
foreign key (Id_cli) references tbcliente(Id)
);

CREATE TABLE tbproduto(
CodigoBarras decimal(14,0) primary key,
Nome varchar(200) not null,
Valor decimal(8,2) not null,
Qtd int
);

CREATE TABLE tbItemvenda(
Numerovenda int,
CodigoBarras decimal(14,0),
Valoritem decimal(8,2) not null,
Qtd int not null,
foreign key (Numerovenda) references tbvenda(numerovenda), 
foreign key (CodigoBarras) references tbproduto(CodigoBarras), 
primary key (numerovenda,CodigoBarras)
);

CREATE TABLE tbfornecedor(
Codigo int primary key auto_increment,
Cnpj decimal(14,0) unique,
Nome varchar(200) not null,
Telefone decimal(11,0)
);

CREATE TABLE tbcompra(
Notafiscal int primary key,
Datacompra date not null,
Valortotal decimal(8,2) not null,
Qtdtotal int not null,
Codigo int,
foreign key (Codigo) references tbfornecedor(Codigo) 
);

CREATE TABLE tbItemCompra(
Valoritem decimal(8,2) not null,
Qtd int not null,
Notafiscal int,
Codigobarras decimal(14,0),
foreign key (Notafiscal) references tbcompra(Notafiscal), 
foreign key (Codigobarras) references tbproduto(Codigobarras), 
primary key(Notafiscal,CodigoBarras)
);

-- exercicio 1 --
insert into tbFornecedor(codigo,Nome,Cnpj,Telefone)
    values(default,'Revenda Chico Loco',1245678937123,11934567897),
    (default, 'José Faz Tudo S/A', 1345678937123, 11934567898),
    (default, 'Vadalto Entregas', 1445678937123,11934567899),
    (default, 'Astrogildo Das Estrelas',1545678937123,11934567800),
    (default, 'Amoroso e Doce','1645678937123',11934567801),
    (default, 'Marcelo Dedal','1745678937123',11934567802),
    (default, 'Franciscano Cachaça','1845678937123',11934567803),
    (default, 'Joãozinho Chupeta','1945678937123',11934567804);

select * from tbFornecedor;

-- exercicio 2 -- 
delimiter $$
CREATE PROCEDURE spInsertCidade(vCidade varchar(200))
BEGIN
if not exists(select Cidade from tbCidade where Cidade = vCidade) then
Insert into tbcidade (Cidade) values (vCidade);
end if;
END;
$$
call spInsertCidade('Rio de Janeiro');
call spInsertCidade('São Paulo');
call spInsertCidade('Campinas');
call spInsertCidade('Franco da Rocha');
call spInsertCidade('Osasco');
call spInsertCidade('Pirituba');
call spInsertCidade('Lapa');
call spInsertCidade('Ponta Grossa');
call spInsertCidade('Barra Mansa');
select * from tbCidade;

-- exercicio 3 --
delimiter $$
CREATE PROCEDURE spInsertUF(vUF char(2))
BEGIN 
if not exists(select Uf from tbEstado where uf = vuf) then
INSERT INTO tbEstado (UF) values (vUF);
end if;
END;
$$
call spInsertUF ('SP');
call spInsertUF ('RJ');
call spInsertUF ('RS');
select * from tbEstado;

-- exercicio 4 --
delimiter $$
CREATE PROCEDURE spInsertBairro (vBairro varchar(90))
BEGIN
if not exists(select Bairro from tbBairro where Bairro = vBairro) then
INSERT INTO tbBairro (Bairro) values (vBairro);
end if;
END;
$$
call spInsertBairro ('Aclimação');
call spInsertBairro ('Capão Redondo');
call spInsertBairro ('Pirituba');
call spInsertBairro ('Liberdade');
call spInsertBairro ('Penha');
call spInsertBairro ('Consolação');
call spInsertBairro ('Barra Funda');
call spInsertBairro ('Lapa');
select * from tbbairro;

-- exercicio 5 --
delimiter $$
CREATE PROCEDURE spInsertProduto (vCodigoBarras decimal(14,0) , vNome varchar(200), vValor decimal(7,2), vQtd int)
BEGIN
if not exists(select CodigoBarras from tbProduto where CodigoBarras = vCodigoBarras) then 
INSERT INTO tbproduto (CodigoBarras, Nome, Valor, Qtd) values(vCodigoBarras, vNome, vValor, vQtd);
end if;
END;
$$
call spInsertProduto (12345678910111, 'Rei de Papel Mache', 54.61, 120);
call spInsertProduto (12345678910112, 'Bolinha de Sabão', 100.45, 120);
call spInsertProduto (12345678910113, 'Carro Bate', 44.00, 120);
call spInsertProduto (12345678910114, 'Bola Furada', 10.00, 120);
call spInsertProduto (12345678910115, 'Maçã Laranjada', 99.44, 120);
call spInsertProduto (12345678910116, 'Boneco do Hitler', 124.00, 200);
call spInsertProduto (12345678910117, 'Farinha de Suruí', 50.00, 200);
call spInsertProduto (12345678910118, 'Zelador de Cemitério', 24.50, 100);
select * from tbproduto;

-- exercicio 6 --
delimiter $$
create procedure spInsertEndereco(vLogradouro varchar(200), vCEP decimal(8,0), vBairro varchar(200),vCidade varchar(200), vUF char (2))
begin
     If not exists(select Bairro from tbBairro where Bairro = vBairro) then
		Insert into tbBairro (Bairro) values (vBairro);
     end if;
     if not exists(select UF from tbEstado where UF = vUF) then
		insert into tbEstado (UF) values (vUF);
     end if;
     if not exists(select Cidade from tbCidade where Cidade = vCidade) then
              insert into tbCidade(Cidade) values (vCidade);
     end if;
	Insert into tbEndereco(Logradouro, CEP, Bairro, Cidade, UF ) 
      values (vLogradouro, vCEP, (SELECT Bairroid FROM tbBairro where Bairro = vBairro),(SELECT Cidadeid FROM tbCidade where Cidade = vCidade), 
      (SELECT UFid FROM tbEstado where UF = vUF));
end
$$
call spInsertEndereco ('Av Brasil', 12345051, 'Lapa' ,'Campinas','SP');
call spInsertEndereco ('Rua Liberdade', 12345052,'Consolação','Campinas','SP');
call spInsertEndereco ('Av Paulista', 12345053,'Penha','Rio de Janeiro','RJ');
call spInsertEndereco ('Rua Ximbú', 12345054,'Penha','Rio de Janeiro','RJ');
call spInsertEndereco ('Rua Piu XI',12345055,'Penha','Campinas','SP');
call spInsertEndereco ('Rua Chocolate',12345056,'Aclimação','Barra Mansa','RJ');
call spInsertEndereco ('Rua Pão na Chapa', 12345057,'Barra Funda','Ponta Grossa','RS' );

select * from tbEndereco;

-- exercicio 7--
/*describe tbendereco;
describe tbcliente;*/

delimiter $$
create procedure spInsertClientepf(vNomeCli varchar(200), vNumEnd decimal(6,0),vCompEnd varchar(50),vCep decimal(8,0),vCpf decimal(11,0),vRg decimal(9,0),vRg_dig char(1),vNasc date,vLogradouro varchar(200),vBairro varchar(200),vCidade varchar(200),vUF char(2))
	begin 
    if not exists(select Cep from tbEndereco where Cep = vCep)then
		call spInsertEndereco(vLogradouro,vCep,vBairro,vCidade,vUf);
    end if;
    if not exists(select Cpf from tbClientepf where Cpf = vCpf)then
    Insert into tbCliente (Nomecli,Numend,Compend,Cepcli)
		values(vNomecli,vNumend,vCompend,(select Cep from tbendereco where Cep = vCep));
	Insert into tbClientepf(Id,Cpf,Rg,Rg_Dig,Nasc)
			values((select Id from tbCliente where Nomecli = vNomecli and Numend = vNumend),vCpf,vRg,vRg_Dig,vNasc);
	end if;
end
$$
call spInsertClientepf('Pimpão', 325, null,12345051, 12345678911, 12345678, 0, STR_TO_DATE("12,10,2000","%d,%m,%Y"), 'Av Brasil', 'Lapa', 'Campinas', 'SP');
call spInsertClientePF('Disney Chaplin', 89, 'Ap.12', 12345053, 12345678912, 12345679, 0, STR_TO_DATE("21,11,2001","%d,%m,%Y"), 'Av Paulista', 'Penha', 'Rio de Janeiro', 'RJ');
call spInsertClientePF('Marciano', 744, null, 12345054, 12345678913, 12345680, 0, STR_TO_DATE("01,06,2001","%d,%m,%Y"), 'Rua Ximbú', 'Penha', 'Rio de Janeiro', 'RJ');
call spInsertClientePF('Lança Perfume', 128, null, 12345059, 12345678914, 12345681, 'X', STR_TO_DATE("05,04,2004","%d,%m,%Y"), 'Rua Veia', 'Jardim Santa Isabel', 'Cuiabá', 'MT');
call spInsertClientePF('Remédio Amargo', 2585, null, 12345058, 12345678915, 12345682, 0, STR_TO_DATE("15,07,2002","%d,%m,%Y"), 'Rua Veia', 'Jardim Santa Isabel', 'Cuiabá', 'MT');

select * from tbClientePF;

-- Exercicio 8 -- 
/*drop procedure spInsertClientepj;
describe tbclientepj;*/
delimiter $$
create procedure spInsertClientepj(vId int ,vNomeCli varchar(200),vCnpj decimal(14,0), vIE decimal(11,0),vCep decimal(8,0),vLogradouro varchar(200),
									vNumEnd decimal(6,0),vCompEnd varchar(50),vBairro varchar(200),vCidade varchar(200),vUF char(2))
	begin
    if not exists(select Cep from tbendereco where Cep = vCep) then
		call spInsertEndereco(vCep,vLogradouro,vBairro,vCidade,vUf);
	end if;
	 if not exists(select Cnpj from tbclientepj where Cnpj = vCnpj)then
    Insert into tbcliente (Nomecli,Numend,Compend,Cep)
		values(vNomecli,vNumend,vCompend,(select Cep from tbendereco where Cep = vCep));
	Insert into tbclientepj(Cnpj,IE,Id)
			values((select Nomecli from tbcliente where Id = vId)and (select Numend from tbCliente where Numend = vNumend),vCnpj,vIE,vId);
	end if;
end
$$
call spInsertClientepj('Paganada',12345678912345,98765432198,12345051,'Av Brasil',159, null, 'Lapa', 'Campinas', 'SP');
call spInsertClientepj('Caloteando',12345678912346,98765432199,12345053,'Av Paulista',69, null, 'Penha', 'Rio de Janeiro', 'RJ');
call spInsertClientepj('Semgrana',12345678912347,98765432100,12345060,'Rua dos Amores',189, null, 'Sei lá', 'Recife', 'PE');
call spInsertClientepj('Cemreais',12345678912348,98765432101,12345069,'Rua dos Amores',5024,'Sala 23','Sei lá', 'Recife', 'PE');
call spInsertClientepj('Durango',12345678912349,98765432102,12345060,'Rua dos Amores',1254, null, 'Sei lá', 'Recife', 'PE');

select * from tbclientepj;

-- Exercicio 9 -- 
/*describe tbItemCompra;
drop procedure spInsertCompra*/
delimiter $$
create procedure spInsertCompra(vNotaFiscal int,vFornecedor varchar(200),vDataCompra DATE,vCodigoBarras decimal(14,0),
								vValorItem decimal(8,2),vQtd int,vQtdTotal int,vValorTotal decimal(8,2))
    begin 
    if not exists(select NotaFiscal from tbItemCompra where NotaFiscal = vNotaFiscal)then
		insert into tbItemCompra (NotaFiscal) values (vNotaFiscal);
	if exists(select Codigo from tbFornecedor where Nome = vFornecedor) and exists (select CodigoBarras from tbItemCompra where CodigoBarras = vCodigoBarras)then
			insert into tbCompra (NotaFiscal,DataCompra,ValorTotal,QtdTotal,Codigo)
				values(vNotaFiscal,vDataCompra,vValortotal,vQtdtotal,(select Codigo from tbFornecedor where Nome = vFornecedor));
		end if;
	end if;
		if not exists (select * from tbItemCompra where (CodigoBarras = vCodigoBarras)and(select NotaFiscal from tbItemCompra where NotaFiscal = vNotaFiscal)) then
			insert into tbItemCompra (NotaFiscal,CodigoBarras,ValorItem,Qtd)
						values (vNotaFiscal,vCodigoBarras,vValorItem,vQtd);
		end if;  
end                     
$$
call spInsertCompra (8459,'Amoroso e Doce',STR_TO_DATE("01,05,2018","%d,%m,%Y"),12345678910111,22.22,200,700,21944.00);
call spInsertCompra (2482,'Revenda Chico Loco',STR_TO_DATE'22/04/2020',12345678910112,40.50,180,180,7290.00);
call spInsertCompra (21563,'Marcelo Dedal',STR_TO_DATE'12/07/2020',12345678910113,3.00,300,300,900.00);
call spInsertCompra (8459,'Amoroso e Doce',STR_TO_DATE'04/12/2020',12345678910114,35.00,500,700,21944.00);
call spInsertCompra (156354,'Revenda Chico Loco',STR_TO_DATE'23/11/2021',12345678910115,54.00,350,350,18900.00);

-- exercicio 10 --
delimiter &&
create procedure spInsertVenda(vNumeroVenda int, vNomeCli varchar (200), vDataVenda date, vCodigoBarras decimal (14,0),
vValorItem decimal (10,2), vQtd int, vTotalVenda decimal(10,2))
begin 
if not exists (select NomeCli from tbCliente where NomeCli = vNomeCli) and exists (select CodigoBarras from tbproduto where vCodigoBarras = CodigoBarras)then
	if not exists (select NumeroVenda from tbVenda where NumeroVenda = vNumeroVenda) then
		insert into tbVenda (NumeroVenda, DataVenda, TotalVenda, NF, IdCli) 
		values (vNumeroVenda, current_date(), vTotalVenda, (select IdCli from tbCliente where NomeCli = vNomeCli), 
        (select NotaFiscal from tbCompra where (select CodigoBarras = vCodigoBarras)));
        insert into tbItemVenda (NumeroVenda, CodigoBarras, ValorItem, Qtd)
			values (vNumeroVenda, vCodigoBarras, vValorItem, vQtd);
	end if;
end if;
end 
&&
call spInsertVenda (1,'Pimpão',null,12345678910111, 54.61, 1, 54.61);
call spInsertVenda (2,'Lança Perfume', null,2345678910112, 100.45, 2, 200.90);
call spInsertVenda (3,'Pimpão',null,12345678910113,44.00,1,44.00);
 
-- exercicio 11 --
/*describe tbVenda;
describe tbnota_fiscal;
drop procedure spNotaFiscalInsert;*/
delimiter $$
create procedure spNotaFiscalInsert (vNF int, vCliente varchar(200))
begin
declare vTotalNota decimal(8,2);
set vTotalNota = (select sum(TotalVenda) from tbVenda where Id_Cli = (select Id from tbCliente where NomeCli = vCliente));
insert into tbNota_Fiscal(NF, TotalNota, DataEmissao) values(vNF, vTotalNota, current_date());
End $$
call spInsertVenda(1,'Pimpão','2023-10-07',12345678910111,54.61,1);
call spInsertVenda(2,'Lança Perfume','2023-10-07',12345678910112,100.45,2);
call spInsertVenda(3,'Pimpão','2023-10-07',12345678910113,44.00,1); 

-- exercicio 12--
call spInsertProduto(12345678910130,'Camiseta de Poliéster','35.61',100);
call spInsertProduto(12345678910131,'Blusa Frio Moletom','200.00',100);
call spInsertProduto(12345678910132,'Vestido Decote Redondo','144.00',50);
select * from tbProduto;
 
-- exercicio 13 --
delimiter $$
create procedure spApagaProduto (vCodigoBarras decimal (14,0))
begin
    if not exists(select CodigoBarras from tbProduto where CodigoBarras = vCodigoBarras)then
	delete from tbProduto where CodigoBarras = vCodigoBarras;
    end if;
end $$
call spApagaProduto(12345678910116);
call spApagaProduto(12345678910117);
 
-- exercicio 14--
delimiter $$
	create procedure spAtualizaProduto (vCodigoBarras decimal (14,0), vNome varchar (200), vValor decimal (8,2))
	begin
		update tbProduto set Valor = vValor where CodigoBarras = vCodigoBarras;
	end $$
call spAtualizaProduto(12345678910111,'Rei de Papel Mache','64.61');
call spAtualizaProduto(12345678910112,'Bolinha de Sabão','120.00');
call spAtualizaProduto(12345678910113,'Carro Bate','64.00');
select * from tbProduto;