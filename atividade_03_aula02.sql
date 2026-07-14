-- criar o Banco de dados db_farmacia_bem_estar
CREATE DATABASE db_farmacia_bem_estar;

-- Selecionar o Banco de Dados db_farmacia_bem_estar
USE db_farmacia_bem_estar;

-- Criar a tabela tb_categorias
CREATE TABLE tb_categorias(
id bigint AUTO_INCREMENT,
descricao varchar(255) NOT NULL,
setor varchar(255) NOT NULL,
PRIMARY KEY (id)
);

-- Insere dados na tabela tb_categorias
INSERT INTO tb_categorias (descricao, setor)
VALUES ("Rosto","Cosméticos");

INSERT INTO tb_categorias (descricao, setor)
VALUES ("Genérico","Medicamentos");

INSERT INTO tb_categorias (descricao, setor)
VALUES ("Cabelo","Cosméticos");

INSERT INTO tb_categorias (descricao, setor)
VALUES ("Hidratante","Cosméticos");

INSERT INTO tb_categorias (descricao,setor)
VALUES ("Outros","Higiene");

-- Lista todos os dados da tabela tb_categorias
SELECT * FROM tb_categorias;

-- Criar a Tabela tb_produtos 
CREATE TABLE tb_produtos (
id bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
quantidade int, 
dtvalidade date NULL,
preco decimal(6, 2),
categoria_id bigint, 
PRIMARY KEY (id),
FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- Insere dados na tabela tb_produtos
INSERT INTO tb_produtos  (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Hidratante Facial Nívea", 88, "2022-03-07", 39.99, 1);

INSERT INTO tb_produtos  (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Sabonete Facil", 100, "2022-03-08", 15.99, 1);

INSERT INTO tb_produtos  (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Dipirona 500mg", 90, "2022-03-09", 12.99, 2);

INSERT INTO tb_produtos  (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Dipirona 1g", 50, "2022-03-10", 16.99, 2);

INSERT INTO tb_produtos  (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Shampoo Seda Cachos", 20, "2022-03-08", 39.99, 3);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Condicionador Seda Cachos", 20, "2022-03-07", 29.99, 3);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Hidratante corpo Nívea", 5, "2022-03-06",100.00, 4);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Fralda Recem-Nascido", 3, "2022-03-09", 69.50, 5);


-- Visualiza todos os dados da tabela tb_produtos
SELECT * FROM tb_produtos ;

-- Faça um SELECT que retorne todes os produtos cujo valor seja maior do que R$ 50,00.
SELECT * FROM tb_produtos  WHERE preco > 50.00;

-- Faça um SELECT que retorne todes os produtos cujo valor esteja no intervalo R$ 5,00 e R$ 60,00.
SELECT * FROM tb_produtos  WHERE preco BETWEEN 5 AND 60;

-- Faça um SELECT utilizando o operador LIKE, buscando todes os produtos que possuam a letra C no atributo nome;
SELECT * FROM tb_produtos  WHERE nome LIKE "%c%"; 

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias.
SELECT * FROM tb_produtos  INNER JOIN tb_categorias
ON tb_produtos .categoria_id = tb_categorias.id; 

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica (Exemplo: Todes os produtos que pertencem a categoria cosméticos)
SELECT * FROM tb_produtos  INNER JOIN tb_categorias
ON tb_produtos .categoria_id = tb_categorias.id
WHERE tb_categorias.id = 1
;

