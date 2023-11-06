-- Exercicio 34 --
select tbCliente.Id,tbCliente.Nomecli,tbClientepj.Cnpj,tbClientepj.Ie,tbClientepj.Id from tbCliente inner join tbclientepj on tbcliente.id = tbclientepj.id;