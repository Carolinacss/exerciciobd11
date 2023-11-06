-- exercicio 7--
delimiter $$
create procedure spInsertClientepf(vNomeCli varchar(200), vNumEnd decimal(6,0),vCompEnd varchar(50),vCep decimal(8,0),vCpf decimal(11,0),vRg decimal(9,0),vRg_dig char(1),vNasc date,vLogradouro varchar(200),vBairro varchar(200),vCidade varchar(200),vUF char(2))
	begin 
    if not exists(select Cep from tbendereco where Cep = vCep)then
		call spInsertEndereco(vLogradouro,vCep,vBairro,vCidade,vUf);
    end if
    if not exists(select Cpf from tbclientepf where Cpf = vCpf)then
    Insert into tbcliente (Nomecli,Numend,Compend,Cep)
		values(vNomecli,vNumend,vCompend,(select Cep from tbendereco where Cep = vCep));
	Insert into tbclientepf(Id,Cpf,Rg,Rg_Dig,Nasc)
			values((select Id from tbcliente where Nomecli = vNomecli and Numend = vNumend),vCpf,vRg,vRg_Dig,vNasc);
	end if 
end
$$
call spInsertClientepf('Pimpão', 325, null, 12345051, 12345678911, 12345678, 0, STR_TO_DATE("12,10,2000","%d,%m,%Y"), 'Av Brasil', 'Lapa', 'Campinas', 'SP');
call spInsertClientePF('Disney Chaplin', 89, 'Ap.12', 12345053, 12345678912, 12345679, 0, STR_TO_DATE("21,11,2001","%d,%m,%Y"), 'Av Paulista', 'Penha', 'Rio de Janeiro', 'RJ');
call spInsertClientePF('Marciano', 744, null, 12345054, 12345678913, 12345680, 0, STR_TO_DATE("01,06,2001","%d,%m,%Y"), 'Rua Ximbú', 'Penha', 'Rio de Janeiro', 'RJ');
call spInsertClientePF('Lança Perfume', 128, null, 12345059, 12345678914, 12345681, 'X', STR_TO_DATE("05,04,2004","%d,%m,%Y"), 'Rua Veia', 'Jardim Santa Isabel', 'Cuiabá', 'MT');
call spInsertClientePF('Remédio Amargo', 2585, null, 12345058, 12345678915, 12345682, 'X', STR_TO_DATE("15,07,2002","%d,%m,%Y"), 'Rua Veia', 'Jardim Santa Isabel', 'Cuiabá', 'MT');

describe tbendereco;
describe tbcliente;
describe tbclientepf;
describe tbbairro;
describe tbcidade;
select * from tbcliente;
select * from tbEndereco;
select * from tbBairro;
select * from tbCidade;
select * from tbEstado;
select * from tbcliente_PF;

-- Exercicio 8 -- 
delimiter $$
create procedure spInsertClientepj(vNomeCli varchar(200),vCnpj decimal(14,0), vIE decimal(11,0),vCep decimal(8,0),vLogradouro varchar(200),
									vNumEnd decimal(6,0),vCompEnd varchar(50),vBairro varchar(200),vCidade varchar(200),vUF char(2))
	begin
    if not exists(select Cep from tbendereco where Cep = vCep) then
		call spInsertEndereco(vCep,vLogradouro,vBairro,vCidade,vUf);
	end if
	 if not exists(select Cnpj from tbclientepj where Cnpj = vCnpj)then
    Insert into tbcliente (Nomecli,Numend,Compend,Cep)
		values(vNomecli,vNumend,vCompend,(select Cep from tbendereco where Cep = vCep));
	Insert into tbclientepj(Cnpj,IE,Id)
			values((select Id from tbcliente where Nomecli = vNomecli and Numend = vNumend),vCnpj,vIE,vId);
	end if 
end
$$
call spInsertClientePJ('Paganada', '12345678912345', '98765432198', '12345051', 'Av Brasil', 159, null, 'Lapa', 'Campinas', 'SP');
call spInsertClientePJ('Caloteando', '12345678912346', '98765432199', '12345053', 'Av Paulista', 69, null, 'Penha', 'Rio de Janeiro', 'RJ');
call spInsertClientePJ('Semgrana', '12345678912347', '98765432100', '12345060', 'Av Paulista', 189, 'Sala 23', 'Sei lá', 'Recife', 'PE');
call spInsertClientePJ('Durango', '12345678912349', '98765432102', '12345060', 'Av Paulista', 1254, null, 'Sei lá', 'Recife', 'PE');

select * from tbclienetepj;

describe tbclientepj;
describe tbendereco;
describe tbcliente;

-- Exercicio 9 -- 
delimiter $$
create procedure spInsertCompras
    
