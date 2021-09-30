#questao 6 nao retorna nada. 
#voce nao leu corratmente a questao. filhos/filhas < 5 anos. e' para mostra apenas os filhos homens.
#questao 7 nao retorna nada. idem a anterior

/*
Aluno: Tadeu Raphael - DP
Feito no MySQL Workbench

P1 - Desafio
*/

/* Parte 00 */

CREATE DATABASE IF NOT EXISTS P1;
USE P1;

CREATE TABLE IF NOT EXISTS Empregado (
	cd_empregado CHAR(8),
    nm_empregado CHAR(30),
    endereco CHAR(50),
    cidade CHAR(20),
    sg_estado CHAR(2),
    telefone CHAR(11),
    dt_nascimento DATE
); 

CREATE TABLE IF NOT EXISTS Dependente (
	cd_empregado CHAR(8),
    cd_dependente INT,
    nm_dependente CHAR(30),
    cd_parentesco INT, /* Por conta de no exercício 2 sinalizar que vai precisar ligar a tabela parentesco, nommei igual. */
    dt_nascimento DATE
);

CREATE TABLE IF NOT EXISTS Parentesco (
	cd_parentesco INT,
    nm_parentesco CHAR(25)
);

INSERT INTO Parentesco VALUES (99, 'Esposa');
INSERT INTO Parentesco VALUES (01, 'Filho');
INSERT INTO Parentesco VALUES (02, 'Filha');

/*

Os códigos de parentesco são:
99	-> esposa
1	-> filho
2	-> filha

*/

/* Parte 01 */

ALTER TABLE Empregado
ADD PRIMARY KEY (cd_empregado);

ALTER TABLE Dependente /* Como o senhor pediu 2 chaves primárias, creio que seja uma chave composta */
ADD PRIMARY KEY (cd_dependente, cd_empregado);

ALTER TABLE Parentesco 
ADD PRIMARY KEY (cd_parentesco);

/* Parte 02 */

ALTER TABLE Dependente
ADD FOREIGN KEY (cd_empregado) REFERENCES Empregado (cd_empregado);

ALTER TABLE Dependente /* No Word do desafio, você não pediu para adicionar o cd_parentesco na tabela de Dependente, então fiz essa modificação. */
ADD FOREIGN KEY (cd_parentesco) REFERENCES Parentesco (cd_parentesco);

/* Parte 03 */

/* Grupo 01 */

INSERT INTO Empregado VALUES(01, 'Manuel Henrique', 'Rua Jacob Emerrick, 248', 'Campinas', 'SP', '11991467884', "1941-10-17"); /* Empregado 01 */
INSERT INTO Empregado VALUES(02, 'Germinio Augusto', 'Rua Imperador Luis XIV', 'Cabo Frio', 'RJ', '12945661278', "1944-05-06"); /* Empregado 02 */
INSERT INTO Empregado VALUES(03, 'Felipe Souza', 'Avenida Sterblitch', 'Franca', 'SP', '11978448212', "1940-11-05"); /* Empregado 03 */

INSERT INTO Dependente VALUES(01, 01, "Liliane Guimarães", 99, "1950-11-11"); /* Empregado 01 */
INSERT INTO Dependente VALUES(01, 02, "Renan Henrique", 01, "2014-10-02"); /* Empregado 01 */
INSERT INTO Dependente VALUES(01, 03, "Lilian Guimarães", 02, "1999-04-13"); /* Empregado 01 */

INSERT INTO Dependente VALUES(02, 04, "Rodriga Carvalho", 99, "1949-05-10"); /* Empregado 02 */
INSERT INTO Dependente VALUES(02, 05, "João Augusto", 01, "2014-01-12"); /* Empregado 02 */
INSERT INTO Dependente VALUES(02, 06, "Isadora Carvalho", 02, "1998-06-17"); /* Empregado 02 */

INSERT INTO Dependente VALUES(03, 07, "Vitoria Siqueira", 99, "1947-12-20"); /* Empregado 03 */
INSERT INTO Dependente VALUES(03, 08, "Jacob Souza", 01, "2015-12-24"); /* Empregado 03 */
INSERT INTO Dependente VALUES(03, 09, "Luiza Siqueira", 02, "1998-10-17"); /* Empregado 03 */

/* Grupo 02 */

INSERT INTO Empregado VALUES(04, 'Augusto Barreto', 'Rua Jacob Emerrick, 248', 'Araruama', 'RJ', '11915974268', "1980-04-16"); /* Empregado 04 */
INSERT INTO Empregado VALUES(05, 'Maicon Rubens', 'Rua Imperador Luis XIV', 'Barretos', 'SP', '12925866654', "1981-07-16"); /* Empregado 05 */
INSERT INTO Empregado VALUES(06, 'Josef Britz', 'Avenida Sterblitch', 'Resende', 'RJ', '11919844652', "1979-12-11"); /* Empregado 06 */

INSERT INTO Dependente VALUES(04, 10, "Miriam Gonçalves", 99, "1980-12-10"); /* Empregado 04 */
INSERT INTO Dependente VALUES(04, 11, "Lucas Barreto", 01, "2012-01-22"); /* Empregado 04 */
INSERT INTO Dependente VALUES(04, 12, "Fernanda Gonçalves", 02, "2001-05-14"); /* Empregado 04 */

INSERT INTO Dependente VALUES(05, 13, "Suzy Araujo", 99, "1981-04-11"); /* Empregado 05 */
INSERT INTO Dependente VALUES(05, 14, "Ricardo Rubens", 01, "2013-12-01"); /* Empregado 05 */
INSERT INTO Dependente VALUES(05, 15, "Juliana Araujo", 02, "2002-07-18"); /* Empregado 05 */

INSERT INTO Dependente VALUES(06, 16, "Thassia Mendes", 99, "1980-11-22"); /* Empregado 06 */
INSERT INTO Dependente VALUES(06, 17, "Miguel Britz", 01, "2015-04-14"); /* Empregado 06 */
INSERT INTO Dependente VALUES(06, 18, "Fatima Mendes", 02, "2000-11-18"); /* Empregado 06 */

/* Grupo 03 */

INSERT INTO Empregado VALUES(07, 'Mikael Fonseca', 'Rua Jacob Emerrick, 248', 'Taubaté', 'SP', '11994466302', "1991-02-15"); /* Empregado 07 */
INSERT INTO Empregado VALUES(08, 'Geronimo Antoniel', 'Rua Imperador Luis XIV', 'Volta Redonda', 'RJ', '12917800659', "1990-07-26"); /* Empregado 08 */
INSERT INTO Empregado VALUES(09, 'Antonio da Silva', 'Avenida Sterblitch', 'Atibaia', 'SP', '11946990007', "1992-10-25"); /* Empregado 09 */

INSERT INTO Dependente VALUES(07, 19, "Julia Figueira", 99, "1990-10-01"); /* Empregado 07 */
INSERT INTO Dependente VALUES(07, 20, "Sebastião Fonseca", 01, "2020-02-25"); /* Empregado 07 */
INSERT INTO Dependente VALUES(07, 21, "Jaqueline Figueira", 02, "2006-02-16"); /* Empregado 07 */

INSERT INTO Dependente VALUES(08, 22, "Milena Blinn", 99, "1991-06-09"); /* Empregado 08 */
INSERT INTO Dependente VALUES(08, 23, "Peter Antoniel", 01, "2019-07-04"); /* Empregado 08 */
INSERT INTO Dependente VALUES(08, 24, "Penelope Blinn", 02, "2005-05-13"); /* Empregado 08 */

INSERT INTO Dependente VALUES(09, 25, "Anastasia Paes", 99, "1992-10-20"); /* Empregado 09 */
INSERT INTO Dependente VALUES(09, 26, "Lourval da Silva", 01, "2021-01-11"); /* Empregado 09 */
INSERT INTO Dependente VALUES(09, 27, "Nicole Paes", 02, "2004-08-14"); /* Empregado 09 */

/* Parte 04 */

SELECT A.nm_empregado, A.dt_nascimento, B.nm_dependente, C.nm_dependente, D.nm_dependente
FROM Empregado AS A, Dependente AS B, Dependente AS C, Dependente AS D
WHERE 
	B.cd_empregado = A.cd_empregado AND
	C.cd_empregado = A.cd_empregado AND
	D.cd_empregado = A.cd_empregado AND
	B.cd_parentesco = 99 AND
	C.cd_parentesco = 01 AND
	D.cd_parentesco = 02;

/* Parte 05 */

SELECT A.nm_empregado, B.nm_dependente, C.nm_dependente, C.dt_nascimento, D.nm_dependente, D.dt_nascimento
FROM Empregado AS A, Dependente AS B, Dependente AS C, Dependente AS D
WHERE 
	B.cd_empregado = A.cd_empregado AND
	C.cd_empregado = A.cd_empregado AND
    D.cd_empregado = A.cd_empregado AND
    B.cd_parentesco = 99 AND
    C.cd_parentesco = 01 AND
    D.cd_parentesco = 02;

/* Parte 06 */

SELECT A.nm_empregado, A.dt_nascimento, C.nm_dependente, C.dt_nascimento, D.nm_dependente, D.dt_nascimento
FROM Empregado AS A, Dependente AS C, Dependente AS D
WHERE 
	C.cd_empregado = A.cd_empregado AND
    D.cd_empregado = A.cd_empregado AND
    C.cd_parentesco = 01 AND
    D.cd_parentesco = 02 AND
    A.dt_nascimento > "1970-12-31" AND /* Caso queira averiguar a observação, apenas abaixe as datas de nascimento dos filhos para 2000 */
    C.dt_nascimento > "2015-12-31" AND
    D.dt_nascimento > "2015-12-31"; /* Observação: Nesse exercício não irá retornar nada, pois não tem nenhum caso onde esses critérios batem*/

/* Parte 07 */

SELECT A.nm_empregado, B.nm_dependente, B.dt_nascimento, C.nm_dependente, C.dt_nascimento, D.nm_dependente, D.dt_nascimento
FROM Empregado AS A, Dependente AS B, Dependente AS C, Dependente AS D
WHERE 
	B.cd_empregado = A.cd_empregado AND
	C.cd_empregado = A.cd_empregado AND
    D.cd_empregado = A.cd_empregado AND
	B.cd_parentesco = 99 AND
    C.cd_parentesco = 01 AND
    D.cd_parentesco = 02 AND
    B.dt_nascimento > "1974-12-31" AND
    B.dt_nascimento < "1989-12-31" AND
    C.dt_nascimento < "2008-12-31" AND
    D.dt_nascimento < "2008-12-31"; /* Observação: Novamente, nesse exercício não irá retornar nada, pois não tem nenhum caso onde esses critérios batem*/

/* Parte 08 */

SELECT A.nm_empregado, B.nm_dependente, B.dt_nascimento, C.nm_dependente, C.dt_nascimento, D.nm_dependente, D.dt_nascimento
FROM Empregado AS A, Dependente AS B, Dependente AS C, Dependente AS D
WHERE 
	B.cd_empregado = A.cd_empregado AND
	C.cd_empregado = A.cd_empregado AND
    D.cd_empregado = A.cd_empregado AND
	B.cd_parentesco = 99 AND
    C.cd_parentesco = 01 AND
    D.cd_parentesco = 02 AND
    B.dt_nascimento > "1974-12-31" AND
    B.dt_nascimento < "2001-12-31"; /* Observações: Como foi comentado anteriormente, os dois ultimos exercícios estão funcionando normalmente, porém não tem casos onde as condições batam, já neste exercício, existe retorno de dados. */

/* Parte 09 */

SELECT A.nm_empregado, B.nm_dependente, C.nm_dependente, C.dt_nascimento, D.nm_dependente, D.dt_nascimento, A.sg_estado
FROM Empregado AS A, Dependente AS B, Dependente AS C, Dependente AS D
WHERE 
	B.cd_empregado = A.cd_empregado AND
	C.cd_empregado = A.cd_empregado AND
    D.cd_empregado = A.cd_empregado AND
    B.cd_parentesco = 99 AND
    C.cd_parentesco = 01 AND
    D.cd_parentesco = 02 AND
    A.sg_estado = 'RJ';

/* Parte 10 */

SELECT A.nm_empregado, B.nm_dependente, C.nm_dependente, C.dt_nascimento, D.nm_dependente, D.dt_nascimento, A.sg_estado
FROM Empregado AS A, Dependente AS B, Dependente AS C, Dependente AS D
WHERE 
	B.cd_empregado = A.cd_empregado AND
	C.cd_empregado = A.cd_empregado AND
    D.cd_empregado = A.cd_empregado AND
    B.cd_parentesco = 99 AND
    C.cd_parentesco = 01 AND
    D.cd_parentesco = 02 AND
    A.sg_estado = 'SP';
