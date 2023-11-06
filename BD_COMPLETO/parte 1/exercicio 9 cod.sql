create DATABASE dbbanco;
use dbbanco;

create table tbcliente(
CPF decimal(11,0) PRIMARY KEY,
Nome varchar(50) not null,
Sexo char(1) not null,
Endereco varchar(50) not null
);

create table tbconta(
NumeroConta int PRIMARY KEY,
Saldo decimal(7, 2),
Tipoconta smallint not null,
Numagencia int not null 
);

create table tbhistorico(
CPF decimal(11,0),
Numeroconta int,
Datainicio date,
primary key(CPF,NumeroConta),
foreign key (CPF) references tbcliente(CPF),
foreign key (Numeroconta) references tbconta(Numeroconta)
);

create table tbtelefone_cliente(
Telefone int PRIMARY KEY,
CPF decimal(11,0),
foreign key (CPF) references tbcliente(CPF)
);

create table tbagencia(
Numeroagencia int PRIMARY KEY,
Codbanco int, 
Endereco varchar(50) not null
);

alter table tbconta add foreign key (Numagencia) references tbagencia(Numeroagencia);

create table tbbanco(
Codigo int PRIMARY KEY,
Nome varchar(50) not null
);

alter table tbagencia add foreign key (Codbanco) references tbbanco(Codigo);

show tables;

insert into tbBanco (Codigo,Nome)
   Values (1,'Banco do Brasil'),
		  (104,'Caixa Economica Federal'),
	      (801,'Banco Escola');
       
insert into tbAgencia (CodBanco, Numeroagencia, Endereco)
   Values (1, 123, 'Av. Paulista,78'),
	   (104, 159, 'Rua Liberdade,124'),
       (801, 401, 'Rua Vinte Três,23'),
       (801, 485, 'Av. Marechal,68');
       
insert into tbcliente (CPF, Nome, Sexo, Endereco)
   values (12345678910, 'Enildo', 'M', 'Rua Grande,75'),
		  (12345678911, 'Astrogildo','M', 'Rua Pequena,789'),
          (12345678912, 'Monica','F',' Av. Larga,148'),
          (12345678913, 'Cascão','M', 'Av. Principal,369');
       
insert into tbconta (NumeroConta, Saldo, TipoConta, NumAgencia)
    values (9876, 456.05, 1, 123),
              (9877,321.00, 1 , 123),
              (9878,100.00, 2 , 485),
              (9879,5589.48, 1 , 401);
              
insert into tbhistorico (Cpf, NumeroConta, Datainicio)
	values (12345678910, 9876, '2001-04-15'),
			(12345678911, 9877, '2011-03-10'),
			(12345678912, 9878, '2021-07-11'),
			(12345678913, 9879, '2000-07-05');
                     
insert into tbTelefone_Cliente (Cpf, Telefone)
	values (12345678910, 912345678),
		   (12345678911, 912345679),
			(12345678912, 912345680),
			(12345678913, 912345681);
         
alter table tbcliente add E_mail varchar(50);

select cpf, endereco from tbcliente where nome = 'monica';

select numeroagencia,endereco from tbagencia where codbanco = 801;

select CPF, Nome, Sexo, Endereco,E_mail from tbcliente where sexo = 'M';

-- exercicio 10 -- 

delete from tbtelefone_cliente where cpf =12345678911;
delete from tbtelefone_cliente where telefone =  912345679;
select * from tbtelefone_cliente;
select * from tbconta;

update tbconta set tipoconta = 2 where numeroconta = 9879;

update tbcliente set E_mail = 'Astro@Escola.com' where nome = 'Monica';

select * from tbcliente;

update tbconta  set saldo = (456.05 * 1.1) where numeroconta = 9876;
select * from tbconta;

select nome,endereco,E_mail from tbcliente where nome = 'Monica';

update tbcliente set Nome = 'Enildo Candido' where Nome ='Enildo '; 
update tbcliente set E_mail = 'Enildo@escola.com' where nome = 'Enildo';

update tbconta set saldo = (saldo - 30);

delete from tbhistorico where numeroconta = 9878;
select * from tbhistorico;