
-- criar o Banco de dados db_pizzaria_legal
CREATE DATABASE db_pizzaria_legal;

-- Selecionar o Banco de Dados db_pizzaria_legal
USE db_pizzaria_legal;

-- Criar a tabela tb_categorias
CREATE TABLE tb_categorias(
id bigint AUTO_INCREMENT,
descricao varchar(255) NOT NULL,
tamanho varchar(255) NOT NULL,
PRIMARY KEY (id)
);

-- Insere dados na tabela tb_categorias
INSERT INTO tb_categorias (descricao, tamanho)
VALUES ("Pizza Doce","Broto");

INSERT INTO tb_categorias (descricao, tamanho)
VALUES ("Pizza Doce","Comum");

INSERT INTO tb_categorias (descricao, tamanho)
VALUES ("Pizza Salgada","Broto");

INSERT INTO tb_categorias (descricao, tamanho)
VALUES ("Pizza Salgada","Comum");

INSERT INTO tb_categorias (descricao,tamanho)
VALUES ("Outros","Comum");

-- Lista todos os dados da tabela tb_categorias
SELECT * FROM tb_categorias;

-- Criar a Tabela tb_pizzas
CREATE TABLE tb_pizzas(
id bigint AUTO_INCREMENT,
sabor varchar(255) NOT NULL,
quantidade int, 
dtvalidade date NULL,
preco decimal(6, 2),
categoria_id bigint, 
PRIMARY KEY (id),
FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- Insere dados na tabela tb_pizzas
INSERT INTO tb_pizzas (sabor, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Frango Caipira", 3, "2022-03-07", 49.99, 1);

INSERT INTO tb_pizzas (sabor, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Frango com Requeijão", 3, "2022-03-08", 45.99, 1);

INSERT INTO tb_pizzas (sabor, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Frango com Cheddar", 4, "2022-03-09", 44.99, 3);

INSERT INTO tb_pizzas (sabor, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Frango Tradicional", 2, "2022-03-10", 40.99, 2);

INSERT INTO tb_pizzas (sabor, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Tradicional", 3, "2022-03-08", 39.99, 3);

INSERT INTO tb_pizzas(sabor, quantidade, dtvalidade, preco, categoria_id)
VALUES("Chocolate", 1, "2022-03-07", 49.99, 5);

INSERT INTO tb_pizzas(sabor, quantidade, dtvalidade, preco, categoria_id)
VALUES("Quatro Queijos", 5, "2022-03-06", 59.00, 4);

INSERT INTO tb_pizzas(sabor, quantidade, dtvalidade, preco, categoria_id)
VALUES("Cinco Queijos", 3, "2022-03-09", 69.50, 4);


-- Visualiza todos os dados da tabela tb_produtos
SELECT * FROM tb_pizzas;

-- Faça um SELECT que retorne todas as pizzas cujo valor seja maior do que R$ 45,00
SELECT * FROM tb_pizzas WHERE preco > 45.00;

-- Faça um SELECT que retorne todas as pizzas cujo valor esteja no intervalo R$ 50,00 e R$ 100,00.
SELECT * FROM tb_pizzas WHERE preco BETWEEN 50 AND 100;

-- Faça um SELECT utilizando o operador LIKE, buscando todas as pizzas que possuam a letra M no atributo nome.
SELECT * FROM tb_pizzas WHERE sabor LIKE "%m%"; 

-- 9.Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias.
SELECT * FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.categoria_id = tb_categorias.id; 

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias, onde traga apenas as pizzas que pertençam a uma categoria específica (Exemplo: Todas as pizzas que são doce).
SELECT * FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.categoria_id = tb_categorias.id
WHERE tb_categorias.id = 1 OR tb_categorias.id = 2;

