CREATE DATABASE db_ecommerce;
USE db_ecommerce;

-- Crie uma tabela de produtos e determine 5 atributos relevantes dos produtos para se trabalhar com o serviço deste e-commerce	
CREATE TABLE tb_produtos(
	id bigint auto_increment,
    nome varchar(255) NOT NULL,
    categoria varchar(255) NOT NULL,
    quantidade int NOT NULL,
    data_entrada_sistema date NOT NULL,
    preco decimal(8,2) NOT NULL,
    PRIMARY KEY (id)
);

-- Insira nesta tabela no mínimo 8 dados (registros).
INSERT INTO tb_produtos(nome, categoria, quantidade, data_entrada_sistema, preco)
VALUES ("Kit garfos", "Cozinha", 30, "2016-07-25", 100.99),
	   ("Kit facas","Cozinha", 40, "2022-07-12", 140.89),
       ("Kit colheres","Cozinha", 25, "2022-07-12", 98.00),
       ("O Conde de Monte Cristo - Alexandre Dumas","Livro", 19, "2026-07-12", 16.99),
       ("Orgulho e Preconceito - Jane Austen", "Livro",100, "2024-09-12", 16.99),
       ("Kit Copos", "Cozinha",27, "2024-09-12", 160.99),
       ("Tablet lenovo", "Eletronicos",27, "2024-09-12", 1900.99),
       ("Moto Edge 90", "Eletronicos",27, "2024-09-12", 1600.99);
       
       
-- retorne todes os produtos com o valor maior do que 500
SELECT * FROM tb_produtos WHERE preco > 500;

-- retorne todes os produtos com o valor menor do que 500
SELECT * FROM tb_produtos WHERE preco < 500;

-- atualize um registro desta tabela através de uma query de atualização	
UPDATE tb_produtos SET nome = "Kir Copos 2" WHERE id = 6;
