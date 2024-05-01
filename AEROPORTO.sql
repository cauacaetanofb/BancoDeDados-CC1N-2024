USE BDEX2_PASSAGENS_AEREAS;

INSERT INTO PASSAGEIROS
(COD_PASSAGEIRO,NOME,SOBRENOME,DATA_NASC,NACIONALIDADE)
VALUES
(1,"Cauã","Caetano","2003-07-10","brasileiro"),
(2,"Roger","Dariva","1950-05-05","brasileiro"),
(3,"Igor","Maciel","2005-05-05","brasileiro"),
(4,"Bryan","Oconnor","2005-10-10","brasileiro");

INSERT INTO AEROPORTOS
(ID_AEROPORTO,NOME,CIDADE,ESTADO,PAIS,LATITUDE,LONGITUDE,TAMANHO_PISTA)
VALUES
(10,"CONGONHAS","São Paulo","SP","BRASIL","200","100","1000"),
(20,"GUARULHOS","São Paulo","SP","Brasil","300","200","2000");

INSERT INTO CIA_AEREAS
(ID_CIA,CNPJ,NOME_FANTASIA)
VALUES
(11,"10101010101010101010","GOL"),
(22,"20202020202020202020","AZUL");

INSERT INTO RESERVAS
(ID_RESERVA,DATA_RESERVA,FORMA_PGTO,VALOR_RESERVA)
VALUES
(21,"2024-04-30",



