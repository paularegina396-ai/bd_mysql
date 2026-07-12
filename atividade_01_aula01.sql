CREATE DATABASE db_rh;
USE db_rh;

-- Crie uma tabela de colaboradores e determine 5 atributos relevantes dos colaboradores para se trabalhar com o serviço deste RH
CREATE TABLE tb_colaboradores(
	id bigint auto_increment,
    nome varchar(255) NOT NULL,
    cargo varchar(255) NOT NULL,
    idade int NOT NULL,
    data_entrada_empresa date NOT NULL,
    salario decimal(8,2) NOT NULL,
    PRIMARY KEY (id)
);
SELECT * FROM tb_colaboradores;

-- Insira nesta tabela no mínimo 5 dados (registros).
INSERT INTO tb_colaboradores(nome, cargo, idade, data_entrada_empresa, salario)
VALUES ("Ana Clara", "Gerente Marketing", 30, "2016-07-25", 10000.99),
	   ("Maria Luiza","Gerente Comercial", 40, "2022-07-12", 14000.89),
       ("Thomas Ellert","Analista Comercial", 25, "2022-07-12", 9800.00),
       ("Leonardo Pedrosa","Estagiário", 19, "2026-07-12", 1600.99),
       ("Paula da Silva", "Estagiário",27, "2024-09-12", 1600.99);

-- retorne todes os colaboradores com o salário maior do que 2000
SELECT * FROM tb_colaboradores WHERE salario > 2000;

-- retorne todes os colaboradores com o salário menor do que 2000
SELECT * FROM tb_colaboradores WHERE salario < 2000;

-- atualize um registro desta tabela através de uma query de atualização	
UPDATE tb_colaboradores SET salario = 1600.89 WHERE id = 5;