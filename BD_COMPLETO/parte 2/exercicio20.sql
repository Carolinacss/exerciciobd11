-- exercício 20 -- 
delimiter $$ 
CREATE TRIGGER trg_insertTbProdHistStatus AFTER UPDATE ON TbProduto 
    FOR EACH ROW
BEGIN
    INSERT INTO tb_ProdutoHistorico
    SET CodigoBarras = NEW.CodigoBarras,
        Nome = NEW.Nome,
        Valor = NEW.Valor,
        Qtd = NEW.Qtd,
        Ocorrencia = "Atualizado",
        Atualizacao = CURRENT_TIMESTAMP();
    INSERT INTO tb_ProdutoHistorico
    SET CodigoBarras = OLD.CodigoBarras,
        Nome = OLD.Nome,
        Valor = OLD.Valor,
        Qtd = OLD.Qtd,
        Ocorrencia = "Novo",
        Atualizacao = CURRENT_TIMESTAMP();
END $$


