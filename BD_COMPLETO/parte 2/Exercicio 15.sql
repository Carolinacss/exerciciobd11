-- exercicio 15 --
delimiter $$
	create procedure spMostrarProduto (vCodigoBarras decimal (14,0), vNome varchar (200), vValor decimal (8,2), vQtd int)
	begin
		select CodigoBarras, Nome, Valor, Qtd from tbProduto;
	end $$
select * from tbProduto;
call spMostrarProduto (000000000000, 'Produtos', '00.00', 100); 
 
 