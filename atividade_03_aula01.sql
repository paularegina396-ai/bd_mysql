CREATE DATABASE db_escola;
USE db_escola;

-- Crie uma tabela estudantes e utilizando a habilidade de abstração e determine 5 atributos relevantes dos estudantes para se trabalhar com o serviço dessa escola.
CREATE TABLE tb_estudantes(
	id bigint auto_increment,
    nome varchar(255) NOT NULL,
    turma varchar(255) NOT NULL,
    idade int NOT NULL,
    data_entrada_sistema date NOT NULL,
    nota_final decimal(4,2) NOT NULL,
    PRIMARY KEY (id)
);

-- Insira nesta tabela no mínimo 8 dados (registros).
INSERT INTO tb_estudantes(nome, turma, idade, data_entrada_sistema, nota_final)
VALUES ("Ana maria", "3b", 12, "2016-07-25", 10.00),
	   ("Marianne","3b", 11, "2022-07-12", 4.89),
       ("Claudia","3b", 10, "2022-07-12", 8.00),
       ("Carlos","3c", 11, "2026-07-12", 6.99),
       ("Otávio", "3c",10, "2024-09-12", 7.01),
       ("Kelly", "4f",14, "2024-09-12", 6.99),
       ("Tabatha", "4f",17, "2024-09-12", 9.99),
       ("Marianna", "4f",17, "2024-09-12", 8.99);
       
       
-- retorne todes o/a(s) estudantes com a nota maior do que 7.0.
SELECT * FROM tb_estudantes WHERE nota_final > 7.0;

-- retorne todes o/a(s) estudantes com a nota menor do que 7.0.
SELECT * FROM tb_estudantes WHERE nota_final < 7.0;

-- atualize um registro desta tabela através de uma query de atualização	
UPDATE tb_estudantes SET nome = "Marianna Silva" WHERE id = 8;