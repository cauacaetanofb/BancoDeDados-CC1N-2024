CREATE SCHEMA IF NOT EXISTS aeroporto;

USE aeroporto;

CREATE TABLE IF NOT EXISTS passageiros(
cod_passageiro VARCHAR(15) PRIMARY KEY NOT NULL,
nome VARCHAR(45) NOT NULL,
sobrenome VARCHAR(50) NOT NULL,
data_nasc DATE NOT NULL,
nacionalidade VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS cias_aereas(
id_cia INT PRIMARY KEY NOT NULL,
nome VARCHAR(45) NOT NULL,
cnpj VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS reservas_voo(
cod_reserva INT PRIMARY KEY NOT NULL,
data_reserva DATE NOT NULL,
forma_pagamento VARCHAR(45) NOT NULL,
valor_total DECIMAL(10,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS aeroportos(
cod_aeroporto VARCHAR(15) PRIMARY KEY NOT NULL
);

CREATE TABLE IF NOT EXISTS aeronave(
cod_aeronave INT PRIMARY KEY NOT NULL,
modelo VARCHAR(45) NOT NULL,
fabricante VARCHAR(45) NOT NULL,
ano YEAR NOT NULL,
quantidade_assentos INT NOT NULL,
CIAS_id_cia INT NOT NULL,
CONSTRAINT cias_aeronave FOREIGN KEY(CIAS_id_cia) REFERENCES cias_aereas(id_cia)
);

CREATE TABLE IF NOT EXISTS voos(
id_voo INT NOT NULL,
assento VARCHAR(45) NOT NULL,
PRIMARY KEY(id_voo, assento),
data_partida DATE NOT NULL,
data_chegada_prev DATE NOT NULL,
hora_partida TIME NOT NULL,
hora_chegada_prev TIME NOT NULL,
AERONAVE_cod_aeronave INT NOT NULL,
AEROPORTOS_cod_aeroporto_partida VARCHAR(15) NOT NULL,
AEROPORTOS_cod_aeroporto_chegada VARCHAR(15) NOT NULL,
CIAS_id_cia INT NOT NULL,
CONSTRAINT aeronave_voos FOREIGN KEY(AERONAVE_cod_aeronave) REFERENCES aeronave(cod_aeronave),
CONSTRAINT aeroporto_voos FOREIGN KEY(AEROPORTOS_cod_aeroporto_partida) REFERENCES aeroportos(cod_aeroporto),
CONSTRAINT aeroportos_voos FOREIGN KEY(AEROPORTOS_cod_aeroporto_chegada) REFERENCES aeroportos(cod_aeroporto),
CONSTRAINT cias_voos FOREIGN KEY(CIAS_id_cia) REFERENCES cias_aereas(id_cia)
);

CREATE TABLE IF NOT EXISTS voos_reservas(
VOOS_AERONAVE_cod_aeronave INT NOT NULL,
VOOS_AEROPORTOS_cod_aeroporto_partida VARCHAR(15) NOT NULL,
VOOS_AEROPORTOS_cod_aeroporto_chegada VARCHAR(15) NOT NULL,
VOOS_CIAS_id_cia INT NOT NULL,
VOOS_id_voo INT NOT NULL,
VOOS_assento VARCHAR(45) NOT NULL,
RESERVAS_cod_reserva INT NOT NULL,
CONSTRAINT voos01 FOREIGN KEY(VOOS_AERONAVE_cod_aeronave) REFERENCES aeronave(cod_aeronave),
CONSTRAINT voos02 FOREIGN KEY(VOOS_AEROPORTOS_cod_aeroporto_partida) REFERENCES voos(AEROPORTOS_cod_aeroporto_partida),
CONSTRAINT voos03 FOREIGN KEY(VOOS_AEROPORTOS_cod_aeroporto_chegada) REFERENCES voos(AEROPORTOS_cod_aeroporto_chegada),
CONSTRAINT voos04 FOREIGN KEY(VOOS_CIAS_id_cia) REFERENCES cias_aereas(id_cia),
CONSTRAINT voos05 FOREIGN KEY(VOOS_id_voo,VOOS_assento) REFERENCES voos(id_voo,assento),
CONSTRAINT reservas FOREIGN KEY(RESERVAS_cod_reserva) REFERENCES reservas_voo(cod_reserva)
);

CREATE TABLE IF NOT EXISTS passageiros_reservas(
PASSAGEIROS_cod_passageiro VARCHAR(15) NOT NULL,
RESERVAS_cod_reserva INT NOT NULL,
CONSTRAINT pass FOREIGN KEY(PASSAGEIROS_cod_passageiro) REFERENCES passageiros(cod_passageiro),
CONSTRAINT rese FOREIGN KEY(RESERVAS_cod_reserva) REFERENCES reservas_voo(cod_reserva)
);
