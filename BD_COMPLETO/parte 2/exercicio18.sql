-- exercicio 18 --
alter table tbProdutoHistorico modify CodigoBarras decimal(14,0) not null;
alter table tbProdutoHistorico drop primary key;
alter table tbProdutoHistorico add constraint CodigoBarras primary key (CodigoBarras,Ocorrencia,Atualizacao);
 