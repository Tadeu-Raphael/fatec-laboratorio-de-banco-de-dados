/*
Aluno: Tadeu Raphael - DP
Feito no MySQL Workbench

TP01 - Exercício 01
*/

/*Parte 01*/
CREATE DATABASE IF NOT EXISTS Exercicio_01;

USE Exercicio_01;

CREATE TABLE IF NOT EXISTS Vendedor(
	cd_Vendedor INT,
    nm_Vendedor VARCHAR(40), 
    ds_Endereco VARCHAR(40),
    cd_CPF DECIMAL(11), 
    nm_Cidade VARCHAR(20), 
    nm_Bairro VARCHAR(20), 
    sg_Estado CHAR(2), 
    cd_Telefone VARCHAR(20), 
    ds_Email VARCHAR(80)
);

CREATE TABLE IF NOT EXISTS Comprador (
	cd_Comprador INT,
    nm_Comprador VARCHAR(40), 
    ds_Endereco VARCHAR(40), 
    cd_CPF DECIMAL(11), 
    nm_Cidade VARCHAR(20), 
    nm_Bairro VARCHAR(20), 
    sg_Estado VARCHAR(2), 
    cd_Telefone VARCHAR(20), 
    ds_Email VARCHAR(80) 
);

CREATE TABLE IF NOT EXISTS Oferta (
	cd_Comprador INT, 
    cd_Imovel INT,
    vl_Oferta INT, 
    dt_Oferta DATE 
);

CREATE TABLE IF NOT EXISTS Imovel (
	cd_Imovel INT, 
    cd_Vendedor INT, 
    cd_Bairro INT, 
    cd_Cidade INT, 
    sg_Estado CHAR(2), 
    ds_Endereco VARCHAR(40), 
    qt_AreaUtil DECIMAL(10,2), 
    qt_AreaTotal DECIMAL (10,2), 
    ds_Imovel VARCHAR(300), 
    vl_preco INT, 
    qt_Ofertas INT, 
    ic_Vendido CHAR(1), 
    dt_Lancto DATE, 
    qt_ImovelIndicado INT 
);

CREATE TABLE IF NOT EXISTS Estado (
	sg_Estado CHAR(2), 
    nm_Estado VARCHAR(20) 
);

CREATE TABLE IF NOT EXISTS Cidade (
	cd_Cidade INT, 
    sg_Estado CHAR(2), 
    nm_Cidade VARCHAR(20) 
);

CREATE TABLE IF NOT EXISTS Bairro (
	cd_Bairro INT, 
    cd_Cidade INT, 
    sg_Estado CHAR(2), 
    nm_Bairro VARCHAR(20) 
);

CREATE TABLE IF NOT EXISTS Faixa_Imovel (
	cd_Faixa INT, 
    nm_Faixa VARCHAR(30), 
    vl_Maximo INT, 
    vl_Minimo INT 
);

/*Parte 02*/

ALTER TABLE Vendedor 
ADD PRIMARY KEY (cd_Vendedor);

ALTER TABLE Comprador
ADD PRIMARY KEY (cd_Comprador);

ALTER TABLE Imovel
ADD PRIMARY KEY (cd_Imovel);

ALTER TABLE Faixa_Imovel
ADD PRIMARY KEY (cd_Faixa);

ALTER TABLE Oferta
ADD FOREIGN KEY (cd_Comprador) REFERENCES Comprador (cd_Comprador);

ALTER TABLE Oferta
ADD FOREIGN KEY (cd_Imovel) REFERENCES Imovel (cd_Imovel);

ALTER TABLE Imovel
ADD FOREIGN KEY (cd_Vendedor) REFERENCES Vendedor (cd_Vendedor);

ALTER TABLE Estado
ADD PRIMARY KEY (sg_Estado);

ALTER TABLE Cidade
ADD PRIMARY KEY (cd_Cidade);

ALTER TABLE Bairro
ADD PRIMARY KEY (cd_Bairro);

ALTER TABLE Cidade
ADD FOREIGN KEY (sg_Estado) REFERENCES Estado (sg_Estado);

ALTER TABLE Bairro
ADD FOREIGN KEY (cd_Cidade) REFERENCES Cidade (cd_Cidade);

ALTER TABLE Bairro
ADD FOREIGN KEY (sg_Estado) REFERENCES Estado (sg_Estado);

/*
TP02 - Exercício 02
*/

/* Parte 01 */

INSERT INTO Estado VALUES ('SP', 'Sao Paulo');
INSERT INTO Estado VALUES ('RJ', 'Rio de Janeiro');

/* Parte 02 */

INSERT INTO Cidade VALUES (01, 'SP', 'Sao Paulo');
INSERT INTO Cidade VALUES (02, 'SP', 'Santo Andre');
INSERT INTO Cidade VALUES (03, 'SP', 'Campinas');
INSERT INTO Cidade VALUES (01, 'RJ', 'Rio de Janeiro');
INSERT INTO Cidade VALUES (02, 'RJ', 'Niteroi');

/* Parte 03 */

INSERT INTO Bairro VALUES (01, 01, 'SP', 'Jardins');
INSERT INTO Bairro VALUES (02, 01, 'SP', 'Morumbi');
INSERT INTO Bairro VALUES (03, 01, 'SP', 'Aeroporto');
INSERT INTO Bairro VALUES (01, 01, 'RJ', 'Aeroporto');
INSERT INTO Bairro VALUES (02, 02, 'RJ', 'Niteroi');

/* Parte 04 */

INSERT INTO Vendedor VALUES (
01, 
'Maria da Silva',
'Rua do Grito, 45',
null,
null,
null,
null,
null,
'msilva@nova.com');

INSERT INTO Vendedor VALUES (
02, 
'Marco Andrade',
'Av. da Saudade, 365',
null,
null,
null,
null,
null,
'mandrade@nova.com');

INSERT INTO Vendedor VALUES (
03, 
'Andre Cardoso',
'Av. Brasil, 401',
null,
null,
null,
null,
null,
'acardoso@nova.com');

INSERT INTO Vendedor VALUES (
04, 
'Tatiana Souza',
'Rua do Imperador, 778',
null,
null,
null,
null,
null,
'tsouza@nova.com');

/* Parte 05 */

INSERT INTO Imovel VALUES (
01,
01,
01,
01,
'SP',
'Al. Tiete, 3304/101',
250,
400,
180000,
null,
null,
null,
null,
null
);

INSERT INTO Imovel VALUES (
02,
01,
02,
01,
'SP',
'Av Morumbi, 2230',
150,
250,
135000,
null,
null,
null,
null,
null
);

INSERT INTO Imovel VALUES (
03,
02,
01,
01,
'RJ',
'R. Gal. Osorio, 445/34',
250,
400,
185000,
null,
null,
null,
null,
null
);

INSERT INTO Imovel VALUES (
04,
02,
02,
02,
'RJ',
'R. D. Pedro I, 882',
120,
200,
110000,
null,
null,
null,
null,
null
);

INSERT INTO Imovel VALUES (
05,
03,
03,
01,
'SP',
'Av. Ruben Berta, 2355',
110,
200,
95000,
null,
null,
null,
null,
null
);

INSERT INTO Imovel VALUES (
06,
04,
01,
01,
'RJ',
'R. Getulio Vargas, 552',
200,
300,
99000,
null,
null,
null,
null,
null
);

/* Parte 06 */

INSERT INTO Comprador VALUES (
01,
'Emmanuel Antunes',
'R. Saraiva, 452',
null,
null,
null,
null,
null,
'eantunes@nova.com'
);

INSERT INTO Comprador VALUES (
02,
'Joana Pereira',
'Av Portugal, 52',
null,
null,
null,
null,
null,
'jpereira@nova.com'
);

INSERT INTO Comprador VALUES (
03,
'Ronaldo Campelo',
'R. Estados Unidos, 13',
null,
null,
null,
null,
null,
'rcampelo@nova.com'
);

INSERT INTO Comprador VALUES (
04,
'Manfred Augusto',
'Av. Brasil, 351',
null,
null,
null,
null,
null,
'maugusto@nova.com'
);

/* Parte 07 */

INSERT INTO Oferta VALUES (01, 01, 170000, '10/01/09');
INSERT INTO Oferta VALUES (01, 03, 180000, '10/01/09');
INSERT INTO Oferta VALUES (02, 02, 135000, '15/01/09');
INSERT INTO Oferta VALUES (02, 04, 100000, '10/02/09');
INSERT INTO Oferta VALUES (03, 01, 160000, '05/01/09');
INSERT INTO Oferta VALUES (03, 02, 140000, '20/02/09');

/* Parte 08 */

UPDATE Imovel SET ds_Imovel = 198000 WHERE cd_Imovel = 01;
UPDATE Imovel SET ds_Imovel = 148500 WHERE cd_Imovel = 02;
UPDATE Imovel SET ds_Imovel = 203500 WHERE cd_Imovel = 03;
UPDATE Imovel SET ds_Imovel = 121000 WHERE cd_Imovel = 04;
UPDATE Imovel SET ds_Imovel = 104500 WHERE cd_Imovel = 05;
UPDATE Imovel SET ds_Imovel = 108900 WHERE cd_Imovel = 06;

/* Parte 09 */

UPDATE Imovel SET ds_Imovel = 188100 WHERE cd_Imovel = 01;
UPDATE Imovel SET ds_Imovel = 141075 WHERE cd_Imovel = 02;

/* Parte 10 */

UPDATE Oferta SET vl_Oferta = (vl_Oferta + (vl_Oferta * 0.05)) WHERE cd_Comprador = 02;

/* Parte 11 */

UPDATE Comprador SET ds_Endereco = 'R. Ananás, 45' WHERE cd_Comprador = 03;
UPDATE Comprador SET sg_Estado = 'RJ' WHERE cd_Comprador = 03;

/* Parte 12 */

UPDATE Oferta SET vl_Oferta = 101000 WHERE cd_Comprador = 02 AND cd_Imovel = 04;

/* Parte 13 */

DELETE FROM Oferta WHERE cd_Comprador = 03 AND cd_Imovel = 01; 

/* Parte 14 */

DELETE FROM Cidade WHERE cd_Cidade = 03 AND sg_Estado = 'SP';

/* Parte 15 */

INSERT INTO Faixa_Imovel VALUES (
01,
'Baixo',
0,
105000
);

INSERT INTO Faixa_Imovel VALUES (
02,
'Medio',
105001,
180000
);

INSERT INTO Faixa_Imovel VALUES (
03,
'Alto',
180001,
999999
);