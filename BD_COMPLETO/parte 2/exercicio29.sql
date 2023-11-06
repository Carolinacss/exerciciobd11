-- Exercicio 29 --
delimiter &&
create trigger trgQtdCompra after insert on tbitemcompra 
for each row begin update tbProduto set qtd = (qtd + new.qtd) where CodigoBarras = new.CodigoBarras;
end &&
