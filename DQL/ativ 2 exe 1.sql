USE bdex1_hospital;

#1
SELECT nome,cpf_paciente,ROUND(datediff(CURDATE(),DATA_NASC)/365) AS idade
FROM pacientes
ORDER BY idade ASC;

#2
SELECT d.nome_especialidade, COUNT(p.cpf_paciente) quant_pac
FROM pacientes AS p
JOIN consultas AS c ON p.cpf_paciente = c.cpf_paciente
JOIN medicos AS m ON c.crm = m.crm AND c.uf = m.uf
JOIN departamentos AS d ON m.depto_cod_espec = d.cod_especialidade
GROUP BY d.nome_especialidade;

#3






