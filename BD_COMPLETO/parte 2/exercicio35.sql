-- exercicio 35 --
select tbCliente.Id,tbCliente.Nomecli,tbClientepf.Cpf,tbClientepf.Rg,tbClientepf.Nasc from tbCliente inner join tbClientepf on tbCliente.Id = tbClientepf.Id;

select * from tbCliente;
select * from tbClientepf;
