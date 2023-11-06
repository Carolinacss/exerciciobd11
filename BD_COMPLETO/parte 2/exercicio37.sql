-- exercicio 37 --
select tbCliente.Id, tbCliente.Nomecli,tbEndereco.Cep,tbEndereco.Logradouro,tbCliente.Numend,tbCliente.Compend 
from tbCliente inner join tbEndereco on tbCliente.Cepcli = tbEndereco.Cep inner join tbBairro on tbBairro.Bairro = tbEndereco.Bairro;

select * from tbCliente;
select * from tbEndereco;
select * from tbCidade;
select * from tbBairro;
select * from tbEstado;

/*id ,nomecli, cep, logradouro, Numend, Compend, Bairro
Cidade
Uf*/