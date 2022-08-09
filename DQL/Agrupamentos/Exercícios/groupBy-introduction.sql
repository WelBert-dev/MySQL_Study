CREATE TABLE vendas (
  id INT NOT NULL AUTO_INCREMENT,
  nome_vdedor VARCHAR(100),
  qntd INT,
  produto VARCHAR(30),
  cidade VARCHAR(30),
  
  PRIMARY KEY (id)
);

INSERT INTO vendas (id, nome_vdedor, qntd, produto, cidade) VALUES (10, 'Jorge', 1400, 'Mouse', 'São Paulo');
INSERT INTO vendas (id, nome_vendedor, qntd, produto, cidade) VALUES (12, 'Tatiana', 1220, 'Teclado', 'São Paulo');
INSERT INTO vendas (id, nome_vendedor, qntd, produto, cidade) VALUES (14, 'Ana', 1700, 'Teclado', 'Rio de Janeiro');
INSERT INTO vendas (id, nome_vendedor, qntd, produto, cidade) VALUES (15, 'Rita', 2120, 'Webcan', 'Recife');
INSERT INTO vendas (id, nome_vendedor, qntd, produto, cidade) VALUES (18, 'Marcos', 980, 'Mouse', 'São Paulo');
INSERT INTO vendas (id, nome_vendedor, qntd, produto, cidade) VALUES (19, 'Carla', 1120, 'Webcan', 'Recife');
INSERT INTO vendas (id, nome_vendedor, qntd, produto, cidade) VALUES (22, 'Roberto', 3145, 'Mouse', 'São Paulo');

-- [vendas]:
-- | id | nome_vdedor| qntd | produto | cidade         |
-- | 10 | Jorge      | 1400 | Mouse   | São Paulo      |
-- | 12 | Tatiana    | 1220 | Teclado | São Paulo      |
-- | 14 | Ana        | 1700 | Teclado | Rio de Janeiro |
-- | 15 | Rita       | 2120 | Webcan  | Recife         |
-- | 18 | Marcos     | 980  | Mouse   | São Paulo      | 
-- | 19 | Carla      | 1120 | Webcan  | Recife         |
-- | 22 | Roberto    | 3145 | Mouse   | São Paulo      |

-- GROUP BY: 
   --
