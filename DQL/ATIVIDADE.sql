USE BDEX1_HOSPITAL;

#1
SELECT NOME,DATA_NASC
FROM pacientes;

#2
SELECT COUNT(*) 
FROM medicos;

#3
SELECT ROUND(AVG(TIMESTAMPDIFF(year,data_nasc,curdate())),0) AS media_idade
FROM pacientes;