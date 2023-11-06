-- exercício 26 -- 
delimiter &&
create trigger trgQtdHistorico after insert on tbitemvenda 
for each row begin update tbProduto set qtd = (qtd - new.qtd) where CodigoBarras = new.CodigoBarras; 
end &&

select * from tbProduto;
