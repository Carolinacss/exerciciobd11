create DATABASE dbandreia;
USE dbandreia;


CREATE TABLE tbproduto(
	CodigoB bigint not null primary key,
    Nomeprod varchar(50) not null
);


CREATE TABLE tbvenda(
	NF  bigint not null primary key auto_increment,
	datavalidade date not null,
    foreign key (NF) references tbproduto(CodigoB)
);

ALTER table tbvenda add preco decimal(12,2) not null;
ALTER TABLE tbvenda add qtd TINYINT UNSIGNED;

ALTER TABLE tbvenda drop datavalidade;

ALTER TABLE tbvenda add datavenda timestamp;



