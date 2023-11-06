-- exercício 25 --  
DELIMITER $$
CREATE PROCEDURE spConsultaCliente(IN vNomeCliente VARCHAR(200))
BEGIN
    SELECT * FROM tbcliente
    WHERE Nomecli = vNomeCliente;
END $$
DELIMITER ;

CALL spConsultaCliente('Disney Chaplin');
