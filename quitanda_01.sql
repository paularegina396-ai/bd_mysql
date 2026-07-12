CREATE DATABASE db_quitanda;

USE db_quitanda;
CREATE TABLE tb_produtos(
	id bigint auto_increment,
    nome varchar(255) NOT NULL,
    quantidade int,
    data_validade date,
    preco decimal NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO tb_produtos(nome, quantidade, data_validade, preco)
VALUES ("Banana", 1000, "2026-07-15", 12.99);

INSERT INTO tb_produtos(nome, quantidade, data_validade, preco)
VALUES ("Cenoura", 800, "2026-07-25", 10.00),
		("Alface Higienizada", 100, "2026-07-12", 14.00);
        
INSERT INTO tb_produtos(nome, quantidade, data_validade, preco)
VALUES ("Alface Higienizada", 100, "2026-07-12", 14.00);
        
SELECT * FROM tb_produtos;

SELECT nome,preco FROM tb_produtos;

SELECT * FROM tb_produtos WHERE preco > 10;

DELETE FROM tb_produtos WHERE id = 3;

UPDATE tb_produtos SET preco = 12.99 WHERE id = 1;

ALTER TABLE tb_produtos MODIFY preco decimal(6,2);
ALTER TABLE tb_produtos ADD descricao varchar(1000);
ALTER TABLE tb_produtos DROP descricao;
ALTER TABLE tb_produtos CHANGE nome nome_produto varchar(255);