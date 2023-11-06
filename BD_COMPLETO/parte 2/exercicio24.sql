-- exercício 24 -- 
SELECT * FROM tbItemvenda
WHERE Numerovenda = (
    SELECT Numerovenda
    FROM tbvenda
    ORDER BY Datavenda DESC
    LIMIT 1
);

