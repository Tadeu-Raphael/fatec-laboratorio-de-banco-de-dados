/*
Aluno: Tadeu Raphael - DP
Feito no MySQL Workbench

P2 - Desafio
*/

#Observações: Tenho apenas 2 coisas para observar no desafio. Primeiro é que não separei os exercícios pela formatação que estava no .docx
#porém todo exercício está indicado no arquivo como "Parte XX". 
#A outra observação seria que nos exercícios de Procedures, eu não fiz da orma mais prática por não entender muito bem como funciona, porém
#Me esforcei para conseguir encontrar uma resposta para os mesmos professor. O resultado acaba sendo igual, porém bem menos prático. 

/* Parte 00 */
# Nessa parte, só copiei e colei os dados do .docx e mudei a formatação no começo

CREATE DATABASE TR2_1sem_21;                               
USE TR2_1sem_21;

CREATE TABLE Empregado 
 (Empr_cd_Empregado Char(8) NOT NULL, 
 Empr_nm_Empregado Char(30), 
 Empr_ds_Endereco Char(50), 
 Empr_nm_Cidade Char(20), 
 Empr_nm_Estado char(2),
 Empr_nm_Telefone char(11),
 Empr_dt_Nascimento Date); 

 CREATE TABLE Dependente 
 (Empr_cd_Empregado Char(8) NOT NULL, 
 Depe_cd_Dependente Integer NOT NULL, 
 Depe_nm_Dependente Char(30), 
 Pare_cd_Parentesco Integer, 
 Depe_dt_Nascimento Date); 
 
 CREATE TABLE Parentesco 
 (Pare_cd_Parentesco Integer NOT NULL, 
 Pare_ds_Parentesco char(25)); 

alter table empregado
add primary key (empr_cd_empregado);

alter table dependente
add primary key (empr_cd_empregado,depe_cd_dependente);

alter table parentesco
add primary key (pare_cd_parentesco);

alter table dependente
add foreign key (empr_cd_empregado) references empregado (empr_cd_empregado);

alter table dependente
add foreign key (pare_cd_parentesco) references parentesco (pare_cd_parentesco);

insert into parentesco values (99, 'Esposa');
insert into parentesco values (1, 'Filha');
insert into parentesco values (2, 'Filho');

insert into empregado values (1,'Empregado 1','Rua 1','Campinas','sp','33642735','1967-01-01');
insert into empregado values (2,'Empregado 2','Rua 2','Cabo Frio','rj','33257896','1967-01-01');
insert into empregado values (3,'Empregado 3','Rua 3','Franca','sp','33754127','1967-01-01');

insert into empregado values (4,'Empregado 4','Rua 4','Araruama','rj','33675896','1975-01-01');
insert into empregado values (5,'Empregado 5','Rua 5','Barretos','sp','33641258','1975-01-01');
insert into empregado values (6,'Empregado 6','Rua 6','Resende','rj','33634185','1975-01-01');

insert into empregado values (7,'Empregado 7','Rua 7','Taubate','sp','33675896','1990-01-01');
insert into empregado values (8,'Empregado 8','Rua 8','Volta Redonda','rj','33641258','1990-01-01');
insert into empregado values (9,'Empregado 9','Rua 9','Atibaia','sp','33634185','1990-01-01');

insert into dependente values (1,1,'Filho 1',2,'2005-01-01');
insert into dependente values (1,2,'Filha 1',1,'2003-01-01');
insert into dependente values (1,3,'Esposa 1',99,'1972-01-01');

insert into dependente values (2,1,'Filho 2',2,'2005-01-01');
insert into dependente values (2,2,'Filha 2',1,'2003-01-01');
insert into dependente values (2,3,'Esposa 2',99,'1972-01-01');

insert into dependente values (3,1,'Filho 3',2,'2005-01-01');
insert into dependente values (3,2,'Filha 3',1,'2003-01-01');
insert into dependente values (3,3,'Esposa 3',99,'1972-01-01');

insert into dependente values (4,1,'Filho 4',2,'2010-01-01');
insert into dependente values (4,2,'Filha 4',1,'2008-01-01');
insert into dependente values (4,3,'Esposa 4',99,'1980-01-01');

insert into dependente values (5,1,'Filho 5',2,'2010-01-01');
insert into dependente values (5,2,'Filha 5',1,'2008-01-01');
insert into dependente values (5,3,'Esposa 5',99,'1980-01-01');

insert into dependente values (6,1,'Filho 6',2,'2010-01-01');
insert into dependente values (6,2,'Filha 6',1,'2008-01-01');
insert into dependente values (6,3,'Esposa 6',99,'1980-01-01');

insert into dependente values (7,1,'Filho 7',2,'2017-01-01');
insert into dependente values (7,2,'Filha 7',1,'2015-01-01');
insert into dependente values (7,3,'Esposa 7',99,'1997-01-01');

insert into dependente values (8,1,'Filho 8',2,'2017-01-01');
insert into dependente values (8,2,'Filha 8',1,'2015-01-01');
insert into dependente values (8,3,'Esposa 8',99,'1997-01-01');

insert into dependente values (9,1,'Filho 9',2,'2017-01-01');
insert into dependente values (9,2,'Filha 9',1,'2015-01-01');
insert into dependente values (9,3,'Esposa 9',99,'1997-01-01');

/* Parte 01 */

SELECT A.Depe_nm_Dependente, A.Depe_dt_Nascimento, B.Depe_nm_Dependente, B.Depe_dt_Nascimento, C.Empr_nm_Cidade
FROM dependente AS A, dependente AS B, empregado AS C
WHERE
	A.Empr_cd_Empregado = C.Empr_cd_Empregado AND
    B.Empr_cd_Empregado = C.Empr_cd_Empregado AND
	A.Pare_cd_Parentesco = 99 AND
    (B.Pare_cd_Parentesco = 01 OR B.Pare_cd_Parentesco = 02) AND
    A.Depe_dt_Nascimento < "1974-01-01" AND
    B.Depe_dt_Nascimento < "2004-01-01";

/* Parte 02 */

SELECT A.Depe_nm_Dependente, A.Depe_dt_Nascimento, B.Depe_nm_Dependente, B.Depe_dt_Nascimento, C.Empr_ds_Endereco
FROM dependente AS A, dependente AS B, empregado AS C
WHERE
	A.Empr_cd_Empregado = C.Empr_cd_Empregado AND
    B.Empr_cd_Empregado = C.Empr_cd_Empregado AND
	A.Pare_cd_Parentesco = 99 AND
    (B.Pare_cd_Parentesco = 01 OR B.Pare_cd_Parentesco = 02) AND
    A.Depe_dt_Nascimento > "1987-01-01" AND
    A.Depe_dt_Nascimento < "2001-01-01" AND
    B.Depe_dt_Nascimento > "2016-01-01";

/* Parte 03 */

SELECT A.Empr_nm_Empregado, A.Empr_dt_Nascimento, 
	   B.Depe_nm_Dependente, B.Depe_dt_Nascimento, 
       C.Depe_nm_Dependente, C.Depe_dt_Nascimento, 
       A.Empr_cd_Empregado
FROM empregado AS A, dependente AS B, dependente AS C 
WHERE
	A.Empr_cd_Empregado = B.Empr_cd_Empregado AND
    A.Empr_cd_Empregado = C.Empr_cd_Empregado AND
	B.Pare_cd_Parentesco = 99 AND
    (C.Pare_cd_Parentesco = 01 OR C.Pare_cd_Parentesco = 02) AND
    B.Depe_dt_Nascimento > "1975-01-01" AND
    B.Depe_dt_Nascimento < "1986-01-01" AND
    C.Depe_dt_Nascimento < "2009-01-01";

/* Parte 04 */

SELECT A.Empr_nm_Empregado, A.Empr_dt_Nascimento, 
	   B.Depe_nm_Dependente, B.Depe_dt_Nascimento, 
       C.Depe_nm_Dependente, C.Depe_dt_Nascimento, 
       A.Empr_nm_Cidade
FROM empregado AS A, dependente AS B, dependente AS C 
WHERE
	A.Empr_cd_Empregado = B.Empr_cd_Empregado AND
    A.Empr_cd_Empregado = C.Empr_cd_Empregado AND
	B.Pare_cd_Parentesco = 99 AND
    (C.Pare_cd_Parentesco = 01 OR C.Pare_cd_Parentesco = 02) AND
    A.Empr_dt_Nascimento < "1971-01-01" AND
    C.Depe_dt_Nascimento > "2004-01-01";

/* Parte 05 */

SELECT A.Empr_nm_Empregado, A.Empr_dt_Nascimento, 
	   B.Depe_nm_Dependente, B.Depe_dt_Nascimento, 
       C.Depe_nm_Dependente, C.Depe_dt_Nascimento
FROM empregado AS A, dependente AS B, dependente AS C 
WHERE
	A.Empr_cd_Empregado = B.Empr_cd_Empregado AND
    A.Empr_cd_Empregado = C.Empr_cd_Empregado AND
	B.Pare_cd_Parentesco = 99 AND
    (C.Pare_cd_Parentesco = 01 OR C.Pare_cd_Parentesco = 02) AND
    A.Empr_dt_Nascimento > "1972-01-01" AND
    A.Empr_dt_Nascimento < "1986-01-01" AND
    C.Depe_dt_Nascimento < "2009-01-01";

/* Parte 06 */

SELECT A.Empr_nm_Empregado, A.Empr_dt_Nascimento, 
	   B.Depe_nm_Dependente, B.Depe_dt_Nascimento, 
       C.Depe_nm_Dependente, C.Depe_dt_Nascimento
FROM empregado AS A, dependente AS B, dependente AS C 
WHERE
	A.Empr_cd_Empregado = B.Empr_cd_Empregado AND
    A.Empr_cd_Empregado = C.Empr_cd_Empregado AND
	B.Pare_cd_Parentesco = 99 AND
    (C.Pare_cd_Parentesco = 01 OR C.Pare_cd_Parentesco = 02) AND
    A.Empr_dt_Nascimento > "1987-01-01" AND
    A.Empr_dt_Nascimento < "2001-01-01" AND
    C.Depe_dt_Nascimento > "2016-01-01";

/* Parte 07 */
#Observação: Imagino que a ideia desses exercicios de procedures era ser algo de forma mais automatizada. Porém eu não entendo muito bem delas, e não
#soube fazer de uma maneira que não ficasse separado em multiplas procedures

CREATE PROCEDURE ex_07_01()
	UPDATE empregado
	SET Empr_dt_Nascimento = '1992-01-01'
	WHERE Empr_cd_Empregado = 1; 

CREATE PROCEDURE ex_07_02()
	UPDATE empregado
	SET Empr_dt_Nascimento = '1987-01-01'
	WHERE Empr_cd_Empregado = 2; 

CREATE PROCEDURE ex_07_03()
	UPDATE empregado
	SET Empr_dt_Nascimento = '1982-01-01'
	WHERE Empr_cd_Empregado = 3; 
    
CREATE PROCEDURE ex_07_04()
	UPDATE empregado
	SET Empr_dt_Nascimento = '1977-01-01'
	WHERE Empr_cd_Empregado = 4; 
    
CREATE PROCEDURE ex_07_05()
	UPDATE empregado
	SET Empr_dt_Nascimento = '1972-01-01'
	WHERE Empr_cd_Empregado = 5; 
    
CREATE PROCEDURE ex_07_06()
	UPDATE empregado
	SET Empr_dt_Nascimento = '1967-01-01'
	WHERE Empr_cd_Empregado = 6; 

CREATE PROCEDURE ex_07_07()
	UPDATE empregado
	SET Empr_dt_Nascimento = '1962-01-01'
	WHERE Empr_cd_Empregado = 7; 
    
CREATE PROCEDURE ex_07_08()
	UPDATE empregado
	SET Empr_dt_Nascimento = '1957-01-01'
	WHERE Empr_cd_Empregado = 8; 
    
CREATE PROCEDURE ex_07_09()
	UPDATE empregado
	SET Empr_dt_Nascimento = '1952-01-01'
	WHERE Empr_cd_Empregado = 9; 
    
CALL ex_07_01();
CALL ex_07_02();
CALL ex_07_03();
CALL ex_07_04();
CALL ex_07_05();
CALL ex_07_06();
CALL ex_07_07();
CALL ex_07_08();
CALL ex_07_09();

#Pode usar esse comando para testar
SELECT Empr_dt_Nascimento
FROM empregado; 

/* Parte 08 */

CREATE PROCEDURE ex_08_01()
	UPDATE dependente
	SET Depe_dt_Nascimento = '1953-01-01'
	WHERE Empr_cd_Empregado = 1 AND 
		  Pare_cd_Parentesco = 99; 

CREATE PROCEDURE ex_08_02()
	UPDATE dependente
	SET Depe_dt_Nascimento = '1956-01-01'
	WHERE Empr_cd_Empregado = 2 AND 
		  Pare_cd_Parentesco = 99; 

CREATE PROCEDURE ex_08_03()
	UPDATE dependente
	SET Depe_dt_Nascimento = '1959-01-01'
	WHERE Empr_cd_Empregado = 3 AND 
		  Pare_cd_Parentesco = 99; 
    
CREATE PROCEDURE ex_08_04()
	UPDATE dependente
	SET Depe_dt_Nascimento = '1973-01-01'
	WHERE Empr_cd_Empregado = 4 AND 
		  Pare_cd_Parentesco = 99; 
    
CREATE PROCEDURE ex_08_05()
	UPDATE dependente
	SET Depe_dt_Nascimento = '1976-01-01'
	WHERE Empr_cd_Empregado = 5 AND 
		  Pare_cd_Parentesco = 99; 
    
CREATE PROCEDURE ex_08_06()
	UPDATE dependente
	SET Depe_dt_Nascimento = '1979-01-01'
	WHERE Empr_cd_Empregado = 6 AND 
		  Pare_cd_Parentesco = 99; 

CREATE PROCEDURE ex_08_07()
	UPDATE dependente
	SET Depe_dt_Nascimento = '1983-01-01'
	WHERE Empr_cd_Empregado = 7 AND 
		  Pare_cd_Parentesco = 99; 
    
CREATE PROCEDURE ex_08_08()
	UPDATE dependente
	SET Depe_dt_Nascimento = '1986-01-01'
	WHERE Empr_cd_Empregado = 8 AND 
		  Pare_cd_Parentesco = 99; 
    
CREATE PROCEDURE ex_08_09()
	UPDATE dependente
	SET Depe_dt_Nascimento = '1989-01-01'
	WHERE Empr_cd_Empregado = 9 AND 
		  Pare_cd_Parentesco = 99; 
          
CALL ex_08_01();
CALL ex_08_02();
CALL ex_08_03();
CALL ex_08_04();
CALL ex_08_05();
CALL ex_08_06();
CALL ex_08_07();
CALL ex_08_08();
CALL ex_08_09();

#Pode usar esse comando para testar
SELECT Depe_dt_Nascimento
FROM dependente
WHERE Pare_cd_Parentesco = 99; 

/* Parte 09 */

CREATE PROCEDURE ex_09_01()
	UPDATE dependente
	SET Depe_dt_Nascimento = '1994-01-01'
	WHERE Empr_cd_Empregado = 1 AND 
		  Pare_cd_Parentesco = 2; 

CREATE PROCEDURE ex_09_02()
	UPDATE dependente
	SET Depe_dt_Nascimento = '1994-01-01'
	WHERE Empr_cd_Empregado = 2 AND 
		  Pare_cd_Parentesco = 2; 

CREATE PROCEDURE ex_09_03()
	UPDATE dependente
	SET Depe_dt_Nascimento = '1994-01-01'
	WHERE Empr_cd_Empregado = 3 AND 
		  Pare_cd_Parentesco = 2; 
    
CREATE PROCEDURE ex_09_04()
	UPDATE dependente
	SET Depe_dt_Nascimento = '1994-01-01'
	WHERE Empr_cd_Empregado = 4 AND 
		  Pare_cd_Parentesco = 2; 
    
CREATE PROCEDURE ex_09_05()
	UPDATE dependente
	SET Depe_dt_Nascimento = '1994-01-01'
	WHERE Empr_cd_Empregado = 5 AND 
		  Pare_cd_Parentesco = 2; 
    
CREATE PROCEDURE ex_09_06()
	UPDATE dependente
	SET Depe_dt_Nascimento = '1994-01-01'
	WHERE Empr_cd_Empregado = 6 AND 
		  Pare_cd_Parentesco = 2; 

CREATE PROCEDURE ex_09_07()
	UPDATE dependente
	SET Depe_dt_Nascimento = '1994-01-01'
	WHERE Empr_cd_Empregado = 7 AND 
		  Pare_cd_Parentesco = 2; 
    
CREATE PROCEDURE ex_09_08()
	UPDATE dependente
	SET Depe_dt_Nascimento = '1994-01-01'
	WHERE Empr_cd_Empregado = 8 AND 
		  Pare_cd_Parentesco = 2; 
    
CREATE PROCEDURE ex_09_09()
	UPDATE dependente
	SET Depe_dt_Nascimento = '1994-01-01'
	WHERE Empr_cd_Empregado = 9 AND 
		  Pare_cd_Parentesco = 2; 
          
CALL ex_09_01();
CALL ex_09_02();
CALL ex_09_03();
CALL ex_09_04();
CALL ex_09_05();
CALL ex_09_06();
CALL ex_09_07();
CALL ex_09_08();
CALL ex_09_09();

#Pode usar esse comando para testar
SELECT Depe_dt_Nascimento
FROM dependente
WHERE Pare_cd_Parentesco = 2; 

/* Parte 10 */

CREATE PROCEDURE ex_10_01()
	UPDATE dependente
	SET Depe_dt_Nascimento = '2010-01-01'
	WHERE Empr_cd_Empregado = 1 AND 
		  Pare_cd_Parentesco = 1; 

CREATE PROCEDURE ex_10_02()
	UPDATE dependente
	SET Depe_dt_Nascimento = '2010-01-01'
	WHERE Empr_cd_Empregado = 2 AND 
		  Pare_cd_Parentesco = 1; 

CREATE PROCEDURE ex_10_03()
	UPDATE dependente
	SET Depe_dt_Nascimento = '2010-01-01'
	WHERE Empr_cd_Empregado = 3 AND 
		  Pare_cd_Parentesco = 1; 
    
CREATE PROCEDURE ex_10_04()
	UPDATE dependente
	SET Depe_dt_Nascimento = '2010-01-01'
	WHERE Empr_cd_Empregado = 4 AND 
		  Pare_cd_Parentesco = 1; 
    
CREATE PROCEDURE ex_10_05()
	UPDATE dependente
	SET Depe_dt_Nascimento = '2010-01-01'
	WHERE Empr_cd_Empregado = 5 AND 
		  Pare_cd_Parentesco = 1; 
    
CREATE PROCEDURE ex_10_06()
	UPDATE dependente
	SET Depe_dt_Nascimento = '2010-01-01'
	WHERE Empr_cd_Empregado = 6 AND 
		  Pare_cd_Parentesco = 1; 

CREATE PROCEDURE ex_10_07()
	UPDATE dependente
	SET Depe_dt_Nascimento = '2010-01-01'
	WHERE Empr_cd_Empregado = 7 AND 
		  Pare_cd_Parentesco = 1; 
    
CREATE PROCEDURE ex_10_08()
	UPDATE dependente
	SET Depe_dt_Nascimento = '2010-01-01'
	WHERE Empr_cd_Empregado = 8 AND 
		  Pare_cd_Parentesco = 1; 
    
CREATE PROCEDURE ex_10_09()
	UPDATE dependente
	SET Depe_dt_Nascimento = '2010-01-01'
	WHERE Empr_cd_Empregado = 9 AND 
		  Pare_cd_Parentesco = 1; 
		
CALL ex_10_01();
CALL ex_10_02();
CALL ex_10_03();
CALL ex_10_04();
CALL ex_10_05();
CALL ex_10_06();
CALL ex_10_07();
CALL ex_10_08();
CALL ex_10_09();

#Pode usar esse comando para testar
SELECT Depe_dt_Nascimento
FROM dependente
WHERE Pare_cd_Parentesco = 1; 