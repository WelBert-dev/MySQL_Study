-- Conceituando: A junção é uma das operações mais úteis e a maneira mais comumente usada para combinar informações de duas ou mais tabelas 

-- Tipos de junção:
   -- Produto Cartesiano (CROSS JOIN)
   -- Junção Interna (INNER JOIN) 
   -- Junção Natural (NATURAL JOIN)
   -- Junção Externa à Esquerda (LEFT OUTER JOIN) 
   -- Junção Externa à Direita (RIGHT OUTER JOIN) 
   -- Junção Externa à Esquerda e à Direita (FULL OUTER JOIN) – MySQL não aceita.

-- Produto Cartesiano (CROSS JOIN):
   -- Conceituando: Obtém uma tabela contendo todas as combinações possíveis de registros entre duas tabelas T1 e T2
   -- Exemplo: 
      SELECT * FROM empe, depto d; 
      SELECT * FROM empe CROSS JOIN depto d;
      -- Saída:
         -- matr | nome | salario | depto_id | id | nome 
         -- 123  | Mary | 4000.00 | 1        | 1  |Informática 
         -- 234  | John | 3000.00 | 1        | 1  |Informática 
         -- 345  | Jim  | 2500.00 | 2        | 1  |Informática 
         -- 456  | Ann  | 3500.00 | 3        | 1  |Informática 
         -- 567  | Carl | 3000.00 | NULL     | 1  |Informática 
         -- 123  | Mary | 4000.00 | 1        | 2  |Matemática 
         -- 234  | John | 3000.00 | 1        | 2  |Matemática 
         -- 345  | Jim  | 2500.00 | 2        | 2  |Matemática 
         -- 456  | Ann  | 3500.00 | 3        | 2  |Matemática 
         -- 567  | Carl | 3000.00 | NULL     | 2  |Matemática 
         -- 123  | Mary | 4000.00 | 1        | 3  |Física 
         -- 234  | John | 3000.00 | 1        | 3  |Física 
         -- 345  | Jim  | 2500.00 | 2        | 3  |Física 
         -- 456  | Ann  | 3500.00 | 3        | 3  |Física 
         -- 567  | Carl | 3000.00 | NULL     | 3  |Física 
         -- 123  | Mary | 4000.00 | 1        | 4  |Química 
         -- 234  | John | 3000.00 | 1        | 4  |Química
         -- 345  | Jim  | 2500.00 | 2        | 4  |Química
         -- 456  | Ann  | 3500.00 | 3        | 4  |Química
         -- 567  | Carl | 3000.00 | NULL     | 4  |Química
