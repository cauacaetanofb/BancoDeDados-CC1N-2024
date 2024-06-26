USE BDEX1_HOSPITAL;

#1
SELECT NOME, DATA_NASC
FROM PACIENTES;

#2
SELECT COUNT(*) AS QANT_MEDICOS
FROM MEDICOS;

#3
SELECT ROUND(AVG(DATEDIFF(CURDATE(), DATA_NASC) / 365),0) AS MEDIA_IDADE_PAC
FROM PACIENTES;

USE BDEX2_PASSAGENS_AEREAS;

#1
SELECT NOME,CIDADE
FROM AEROPORTOS;

#2
SELECT C.NOME_FANTASIA,COUNT(*) AS QNT_VOOS
FROM VOOS AS V
JOIN CIA_AEREAS AS C
ON V.CIA_AEREA = C.ID_CIA
GROUP BY CIA_AEREA;

#3
SELECT ROUND(AVG(POLTRONAS),0) AS MEDIA_CAPACIDADE
FROM AERONAVES;

USE BDEX3_REDESOCIAL;

#1
SELECT NOME_USUARIO,SOBRENOME
FROM USUARIOS;

#2
SELECT COUNT(*) AS QNT_GRUPOS
FROM GRUPOS;

#3
SELECT ROUND(AVG(COMENTARIOS_POR_POSTAGEM),1) AS MEDIA_COMENTARIOS_POSTAGEM
FROM(
SELECT COUNT(*) AS COMENTARIOS_POR_POSTAGEM
FROM COMENTARIOS
GROUP BY POST
) AS MEDIA_POR_POST;

USE BDEX4_ESTOQUE;

#1
SELECT NOME_PRO,PRECO
FROM PRODUTOS;

#2
SELECT F.NOME_FOR,COUNT(P.PRODUTO) AS PRODUTOS_POR_FORNECEDOR
FROM PRODUTOS_FORNECEDORES AS P
JOIN FORNECEDORES AS F
ON P.FORNECEDOR = F.ID_FORNECEDOR
GROUP BY FORNECEDOR;

#3
SELECT *
FROM PRODUTOS_ARMAZENS;

USE BDEX5_EVENTOS;

#1
SELECT NOME_EVENTO,DATA_EVENTO
FROM EVENTOS;

#2
SELECT E.NOME_EVENTO,COUNT(A.ID_ATIVIDADE) AS QNT_ATIVIDADES
FROM ATIVIDADES AS A
JOIN EVENTOS AS E
ON A.EVENTO_ATV = E.ID_EVENTO
GROUP BY EVENTO_ATV;

#3
SELECT E.NOME_EVENTO,COUNT(*) AS QNT_PARTICIPANTE
FROM PARTICIPANTE_EVENTO AS P
JOIN EVENTOS AS E
ON P.EVENTO = E.ID_EVENTO
GROUP BY EVENTO;

USE BDEX6_CINEMA;

#1 - Quais são os nomes e capacidades de todas as salas de cinema cadastradas?
SELECT NOME, CAPACIDADE
FROM SALAS;

#2 - Quantos espectadores frequentaram cada sessão de cinema?
SELECT SESSAO, COUNT(ESPECTADOR) AS QNTD_ESPEC
FROM INGRESSOS
GROUP BY SESSAO;

#3 - Qual é o horário médio de início das sessões de cinema?
SELECT S.ID_SESSAO, ROUND(AVG(F.TEMPO_FILME), 0) AS "DURACAO_MEDIA(MINUTOS)"
FROM SESSOES AS S
JOIN FILMES AS F
ON S.FILME = F.ID_FILME
GROUP BY ID_SESSAO;

USE BDEX7_TRANSACOESBANCARIAS;

#1 - Quais são os nomes e CPFs de todos os usuários cadastrados?
SELECT NOME_USER, CPF_USER
FROM USUARIOS;

#2 - Qual é o total de transações realizadas por cada usuário?
SELECT U.NOME_USER, COUNT(T.ID_TRANS) AS TOTAL_TRANSACOES
FROM TRANSACOES AS T
RIGHT JOIN USUARIOS AS U
ON T.USUARIO = U.ID_USER
GROUP BY U.ID_USER;

#3 - Qual é o valor médio das transações bancárias?
SELECT ROUND(AVG(VALOR), 2) AS MEDIA
FROM TRANSACOES;




