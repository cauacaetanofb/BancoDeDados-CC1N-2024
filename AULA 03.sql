CREATE SCHEMA IF NOT EXISTS aula_exercicio_hospital;

USE aula_exercicio_hospital;

CREATE TABLE IF NOT EXISTS Pacientes(
CPF_paciente VARCHAR(15) PRIMARY KEY NOT NULL,
nome VARCHAR(45) NOT NULL,
data_nasc DATE NOT NULL,
telefone VARCHAR(45) NOT NULL,
email VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS Departamentos(
cod_especialidade INT PRIMARY KEY NOT NULL,
nome_especialidade VARCHAR(45)
);

CREATE TABLE IF NOT EXISTS Medicos(
CRM INT NOT NULL,
UF CHAR(2) NOT NULL,
PRIMARY KEY(CRM, UF),
nome VARCHAR(45) NOT NULL,
email VARCHAR(45) NOT NULL,
telefone VARCHAR(45) NOT NULL,
dep_cod_espec INT,
CONSTRAINT dep_med FOREIGN KEY (dep_cod_espec) REFERENCES Departamentos(cod_especialidade)
);

CREATE TABLE IF NOT EXISTS Consultas(
id_consultas INT PRIMARY KEY NOT NULL,
anamnese TEXT NOT NULL,
data_consulta DATE NOT NULL,
hora TIME NOT NULL,
CPF_paciente VARCHAR(15),
CRM INT,
UF CHAR(2),
CONSTRAINT pac_cons FOREIGN KEY (CPF_paciente) REFERENCES Pacientes(CPF_paciente),
CONSTRAINT med_cons FOREIGN KEY (CRM, UF) REFERENCES Medicos(CRM, UF)
);



