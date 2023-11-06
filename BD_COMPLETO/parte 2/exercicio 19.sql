-- exercicio 19 --
delimiter &&
CREATE trigger trgProdutoHistorico after insert on tbProduto
	for each row
	begin
	insert into tbProdutoHistorico
		set CodigoBarras = new.CodigoBarras,
		Nome = new.Nome,
		Valor = new.Valor,
		Qtd = new.Qtd,
		Atualizacao = current_timestamp(),
		Ocorrencia = 'Novo';
	end;
&&
call spInsertProduto(12345678910119,'Agua mineral',1.99,500);
select * from tbProdutoHistorico;
 