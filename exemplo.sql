CREATE SCHEMA IF NOT EXISTS exemplo;
USE exemplo;

CREATE TABLE IF NOT EXISTS cargo(
id_cargo INT(11) NOT NULL PRIMARY KEY,
nome VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS riscos_ocupacionais(
id_risco INT(11) NOT NULL PRIMARY KEY,
nome VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS resultado_exame(
id_Spo_resultado_exame INT(11) NOT NULL PRIMARY KEY,
tipo VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS tipo_exame(
id_tipo_exame INT(11) NOT NULL PRIMARY KEY,
tipo VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS medico(
id_medico INT(11) NOT NULL PRIMARY KEY,
crm INT(11) NOT NULL,
nome VARCHAR(100) NOT NULL,
cpf VARCHAR(20) NOT NULL,
especialidade VARCHAR(50) NOT NULL,
data_nascimento DATE NOT NULL,
endereco VARCHAR(200) NOT NULL,
telefone VARCHAR(20) NULL,

CREATE TABLE IF NOT EXISTS atestado(
id_atestado INT(11) NOT NULL PRIMARY KEY,
resultados_riscos VARCHAR(100) NOT NULL,
reultado VARCHAR(100) NOT NULL,
observacoes VARCHAR(300) NOT NULL,
CONSTRAINT med_ates FOREIGN KEY (id_medico) REFERENCES medico(id_medico)
);

CREATE TABLE IF NOT EXISTS exame(
id_exame INT(11) NOT NULL PRIMARY KEY,
especialidade VARCHAR(50) NOT NULL,
data_realização DATE NOT NULL,
id_Spo_resultado_exame INT(11) NOT NULL,
CONSTRAINT res_exam FOREIGN KEY (id_Spo_resultado_exame) REFERENCES resultado_exame(id_Spo_resultado_exame)
CONSTRAINT tip_exam FOREIGN KEY (id_tipo_exame) REFERENCES tipo_exame(id_tipo_exame)
);

CREATE TABLE IF NOT EXISTS empresa(
id_empresa INT(11),
cnpj VARCHAR(20),
nome_fantasia VARCHAR(50),
endereco VARCHAR(200),
telefone VARCHAR(20),



