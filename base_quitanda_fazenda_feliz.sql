-- Apagar Banco de Dados db_quitanda
DROP DATABASE db_quitanda;

-- Recriar o Banco de dados db_quitanda
CREATE DATABASE db_quitanda;

-- Selecionar o Banco de Dados db_quitanda
USE db_quitanda;

-- Criar a tabela tb_categorias
CREATE TABLE tb_categorias(
id bigint AUTO_INCREMENT,
descricao varchar(255) NOT NULL,
PRIMARY KEY (id)
);

-- Insere dados na tabela tb_categorias
INSERT INTO tb_categorias (descricao)
VALUES ("Frutas");

INSERT INTO tb_categorias (descricao)
VALUES ("Verduras");

INSERT INTO tb_categorias (descricao)
VALUES ("Legumes");

INSERT INTO tb_categorias (descricao)
VALUES ("Temperos");


INSERT INTO tb_categorias (descricao)
VALUES ("Ovos");

INSERT INTO tb_categorias (descricao)
VALUES ("outros");

-- Lista todos os dados da tabela tb_categorias
SELECT * FROM tb_categorias;

-- Criar a Tabela tb_produtos
CREATE TABLE tb_produtos(
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
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Maçã", 1000, "2022-03-07", 1.99, 1);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Banana", 1300, "2022-03-08", 5.00, 1);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Batata doce", 2000, "2022-03-09", 10.00, 3);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Alface", 300, "2022-03-10", 7.00, 2);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Cebola", 1020, "2022-03-08", 5.00, 3);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Ovo Branco", 1000, "2022-03-07", 15.00, 5);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Agrião", 1500, "2022-03-06", 3.00, 2);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Cenoura", 1800, "2022-03-09", 3.50, 3);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Pimenta", 1100, "2022-03-15", 10.00, 4);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Alecrim", 130, "2022-03-10", 5.00, 4);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Manga", 200, "2022-03-07", 5.49, 1);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Laranja", 3000, "2022-03-13", 10.00, 1);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Couve", 100, "2022-03-12", 1.50, 2);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Tomate", 1105, "2022-03-15", 3.00, 3);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Rabanete", 1200, "2022-03-15", 13.00, 3);

INSERT INTO tb_produtos(nome, quantidade, preco)
VALUES("Sacola Cinza", 1118, 0.50);

INSERT INTO tb_produtos(nome, quantidade, preco)
VALUES("Sacola Verde", 1118, 0.50);

-- Visualiza todos os dados da tabela tb_produtos
SELECT * FROM tb_produtos;

-- Ordena todos os dados da tabela tb_produtos ordenando por nome
SELECT * FROM tb_produtos ORDER BY nome;

-- ordena todos os dados da tabela tb_produtos ordenando por nome decrescente
SELECT * FROM tb_produtos ORDER BY nome DESC;

-- Operadores lógicos
SELECT * FROM tb_produtos WHERE preco > 5.00 AND categoria_id = 2; -- Consulta onde  preço rpecisa ser maior de 5 e categoria id (chave est) = 2

SELECT * FROM tb_produtos WHERE preco > 5.00 OR categoria_id = 2; -- Consulta onde  preço rpecisa ser maior de 5 OU categoria id (chave est) = 2

SELECT * FROM tb_produtos WHERE NOT categoria_id = 2; -- Consulta onde categoria é diferente de 2, não é 2

-- Operadores IN e BETWEEN - podemos usa-los para datas também
SELECT * FROM tb_produtos WHERE preco IN (5, 10, 15);
SELECT * FROM tb_produtos WHERE preco BETWEEN 5 AND 15;

-- Operadore LIKE - 
-- Consulta a Collation do banco de dados
SELECT @@collation_database;
-- Altera a Collation do BD
ALTER DATABASE db_quitanda
CHARACTER SET utf8mb4
COLLATE utf8mmb4_0900_as_cs;

-- Altera a Collation da tabela
ALTER TABLE tb_produtos
CONVERT TO CHARACTER SET utf8mb4
COLLATE utf8mmb4_0900_as_cs;

SELECT * FROM tb_produtos WHERE nome LIKE "%ra%"; -- qualquer coisa antes e depois
SELECT * FROM tb_produtos WHERE nome LIKE "ra%"; -- qualquer coisa  depois e começa com ra
SELECT * FROM tb_produtos WHERE nome LIKE "%ra"; -- qualquer coisa  antes e termina com ra

-- Operadores Aritméticos/Por agregação
SELECT COUNT(*) FROM tb_produtos; -- quantas linahs tem a tabela = 17

SELECT COUNT(categoria_id) FROM tb_produtos; -- quantas linahs tem categoria(são interseção) =15 - as sacolas não são

SELECT SUM(preco) AS Soma_Preco FROM tb_produtos; -- Soma
SELECT AVG(preco) AS Preco_Media FROM tb_produtos; -- Média

SELECT categoria_id, AVG(preco) AS Preco_Media FROM tb_produtos GROUP BY categoria_id; -- Mostra o preço médio, pela categoria

SELECT MAX(preco) AS Preco_Máximo FROM tb_produtos; -- qual o maior preço

SELECT MIN(preco) AS preco_Mínimo FROM tb_produtos; -- qual o menor preço

-- ====================================================================
--  ENTENDENDO JOINS, FILTROS E AGREGAÇÕES (BANCO: DB_QUITANDA)
-- ====================================================================

-- JOIN
-- 1. INNER JOIN (Intersecção Perfeita)
-- Traz APENAS os produtos que possuem uma categoria associada E as categorias que possuem produtos.
-- Se houver algum produto sem categoria ou categoria sem produto, eles ficam de fora.
SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id; -- Você está dizendo pega a intersecção entre produtos e categorias.

-- 2. LEFT JOIN (Prioridade para a Tabela da Esquerda)
-- Traz tudo do INNER JOIN (a intersecção) + TODOS os produtos da tabela da esquerda (tb_produtos), 
-- mesmo aqueles que não têm nenhuma categoria vinculada. 
-- Se um produto não tiver categoria, os campos da tb_categorias aparecerão como NULL.
SELECT * FROM tb_produtos LEFT JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id; -- Se o INNER JOIN trás a intersecção o LEFT Join trás: a intersecção + tudo da esquerda, no caso são os produtos

-- 3. RIGHT JOIN (Prioridade para a Tabela da Direita)
-- Traw tudo do INNER JOIN (a intersecção) + TODAS as categorias da tabela da direita (tb_categorias),
-- mesmo aquelas que ainda não têm nenhum produto cadastrado (como a categoria 'outros' se estiver vazia).
-- Se a categoria não tiver produtos, os campos da tb_produtos aparecerão como NULL.
SELECT * FROM tb_produtos RIGHT JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id; 

-- 4. INNER JOIN COM FILTRO ESPECÍFICO E ORDENAÇÃO
-- Junta as tabelas, filtra para trazer APENAS os produtos da categoria 2 (Verduras) 
-- e ordena o resultado final em ordem alfabética (A-Z) com base no nome da categoria.
SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
WHERE tb_produtos.categoria_id = 2
ORDER BY tb_categorias.descricao; 

-- 5. INNER JOIN COM FILTRO E ORDENAÇÃO POR PRODUTO
-- Faz exatamente a mesma junção e filtro por categoria (Verduras), 
-- mas muda o critério de ordenação: organiza o resultado em ordem alfabética pelo nome do PRODUTO (ex: Alface, Agrião...).
SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
WHERE tb_produtos.categoria_id = 2
ORDER BY nome;

-- 6. JUNTANDO TABELAS COM AGRUPAMENTO (GROUP BY)
-- Exibe o nome de cada categoria e calcula o preço médio dos produtos pertencentes a ela.
-- O GROUP BY é obrigatório aqui porque estamos misturando uma coluna textual (descricao) 
-- com uma função que resume dados / matemática (AVG).
SELECT tb_categorias.descricao, avg(preco) AS Preço_Médio
FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id 
GROUP BY tb_categorias.descricao;

-- 7. FILTRANDO DADOS AGRUPADOS (HAVING)
-- REGRA DE OURO: O WHERE filtra linhas ANTES de agrupar. O HAVING filtra o resultado DEPOIS do agrupamento.
-- O dono da quitanda quer ver as categorias cujo preço médio calculado seja maior que 5. 
-- Como 'preco_medio' nasce de uma função agregada (AVG), não podemos usar o WHERE, somos obrigados a usar o HAVING.
SELECT tb_categorias.descricao, avg(preco) AS preco_medio
FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id 
GROUP BY tb_categorias.descricao
HAVING preco_medio >5;
