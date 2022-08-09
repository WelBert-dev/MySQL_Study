-- Conceituando:


CREATE TABLE vendas (
  id INT NOT NULL AUTO_INCREMENT,
  nome_vendedor VARCHAR(100),
  quantidade INT,
  produto VARCHAR(30),
  cidade VARCHAR(30),
  
  PRIMARY KEY (id)
);

INSERT INTO vendas (nome_vendedor, quantidade, produto, cidade) VALUES (10, 'Jorge', 1400, 'Mouse', 'São Paulo');
INSERT INTO vendas (nome_vendedor, quantidade, produto, cidade) VALUES (12, 'Tatiana', 1220, 'Teclado', 'São Paulo');
INSERT INTO vendas (nome_vendedor, quantidade, produto, cidade) VALUES (14, 'Ana', 1700, 'Teclado', 'Rio de Janeiro');
INSERT INTO vendas (nome_vendedor, quantidade, produto, cidade) VALUES (15, 'Rita', 2120, 'Webcan', 'Recife');
INSERT INTO vendas (nome_vendedor, quantidade, produto, cidade) VALUES (18, 'Marcos', 980, 'Mouse', 'São Paulo');
INSERT INTO vendas (nome_vendedor, quantidade, produto, cidade) VALUES (19, 'Carla', 1120, 'Webcan', 'Recife');
INSERT INTO vendas (nome_vendedor, quantidade, produto, cidade) VALUES (22, 'Roberto', 3145, 'Mouse', 'São Paulo');

SELECT * 
FROM vendas
WHERE produto = 'Mouse';

