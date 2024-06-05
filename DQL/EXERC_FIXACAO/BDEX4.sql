


#1. Exibir todas as informações da tabela `PRODUTOS`.
SELECT * FROM PRODUTOS;

#2. Mostrar os nomes e preços dos produtos que custam mais de 50,00.
SELECT NOME_PRO, PRECO 
FROM PRODUTOS
WHERE PRECO > 50;

#3. Listar os nomes e cidades dos fornecedores.
SELECT NOME_FOR, CIDADE
FROM FORNECEDORES;

#4. Exibir os detalhes dos pedidos de compra: ID do pedido, data, hora e nome do fornecedor.
SELECT P.ID_PEDIDO, P.DATA_PEDIDO, P.HORA_PEDIDO, F.NOME_FOR AS NOME_FORNECEDOR
FROM PEDIDOS_COMPRA AS P
INNER JOIN FORNECEDORES AS F
ON P.FORNECEDOR = F.ID_FORNECEDOR;

#5. Listar o nome dos produtos e a quantidade disponível em cada armazém.
SELECT A.NOME_ARMAZEM, P.NOME_PRO, B.QUANTIDADE
FROM PRODUTOS AS P
JOIN PRODUTOS_ARMAZENS AS B
ON P.ID_PRODUTO = B.PRODUTO
JOIN ARMAZENS AS A
ON B.ARMAZEM = A.ID_ARMAZEM
GROUP BY B.ARMAZEM
ORDER BY P.NOME_PRO ASC;

#6. Mostrar os nomes dos fornecedores que têm produtos no armazém de "São Paulo".
SELECT F.NOME_FOR, A.CIDADE_ARMAZEM
FROM FORNECEDORES AS F
JOIN PRODUTOS_FORNECEDORES AS PF
ON F.ID_FORNECEDOR = PF.FORNECEDOR
JOIN PRODUTOS AS P
ON PF.PRODUTO = P.ID_PRODUTO
JOIN PRODUTOS_ARMAZENS AS PA
ON P.ID_PRODUTO = PA.PRODUTO
JOIN ARMAZENS AS A
ON PA.ARMAZEM = A.ID_ARMAZEM
WHERE A.CIDADE_ARMAZEM = "São Paulo";

#7. Listar todos os armazéns, ordenados pelo nome do armazém de A a Z.
SELECT NOME_ARMAZEM FROM ARMAZENS
ORDER BY NOME_ARMAZEM ASC;

#8. Mostrar os nomes dos produtos que têm a palavra "Premium" na descrição.
SELECT *
FROM PRODUTOS;
WHERE NOME_PRO LIKE '%premium%';

#9. Exibir os detalhes dos produtos: ID do produto, nome, descrição, preço e nome dos fornecedores.
SELECT P.ID_PRODUTO, P.NOME_PRO, P.DESCRICAO, P.PRECO, F.NOME_FOR AS FORNECEDOR
FROM PRODUTOS AS P
JOIN PRODUTOS_FORNECEDORES AS PF
ON P.ID_PRODUTO = PF.PRODUTO
JOIN FORNECEDORES AS F
ON PF.FORNECEDOR = F.ID_FORNECEDOR;

#10. Para cada pedido de compra, mostrar o ID do pedido e a quantidade total de produtos solicitados.
SELECT ID_PEDIDO, SUM(QUANTIDADE)
FROM PEDIDOS_COMPRA
GROUP BY ID_PEDIDO;

#11. Contar quantos produtos cada fornecedor oferece.


#12. Listar os nomes dos produtos e a quantidade disponível no armazém "Rio de Janeiro".


#13. Mostrar o nome dos fornecedores e a data e hora do último pedido de compra que eles receberam.


#14. Contar quantos pedidos de compra cada fornecedor recebeu.


#15. Para cada armazém, exibir o nome do armazém e a quantidade total de produtos armazenados nele.






