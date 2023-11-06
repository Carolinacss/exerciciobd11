-- exercicio 36 --
select * from tbCliente inner join tbClientepj on tbCliente.id = tbClientepj.Id inner join tbEndereco on tbCliente.Cepcli = tbEndereco.Cep;

select * from tbCliente;
select * from tbClientepj;
select * from tbendereco;
describe tbendereco;