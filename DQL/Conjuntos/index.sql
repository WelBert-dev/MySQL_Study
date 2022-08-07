-- Conceituando:

-- Em algumas situações, é necessário realizar operações com conjuntos de registros 
   -- União de conjuntos:
      -- UNION 
      -- UNION ALL
   -- Interseção entre conjuntos:
      -- com IN
      -- com OUTER JOIN
   -- Diferença entre conjuntos:
      -- com IN
      -- com OUTER JOIN

-- As operações devem envolver dois conjuntos de registros retornados por uma declaração SELECT. 
-- Os conjuntos de registros devem ter a mesma quantidade de colunas.
-- As colunas devem ser de tipos de dados compatíveis.

-- UNION: Operador usado para combinar (união) o resultado de duas ou mais declarações SELECT.
   -- Exemplo: Recuperar as cidades dos médicos e as cidades dos pacientes.
      SELECT cidade 
      FROM medico 
      UNION 
      SELECT cidade 
      FROM paciente;
      -- Tabelas:
         -- [Médico]:       [Pacientes]:
         -- | CIDADE        | CIDADE         |
         -- | Porto Alegre  | São Paulo      |
         -- | Florianópolis | Rio de Janeiro |
         -- | Brasília      | Brasília       |
         -- | NULL          | NULL           |
         -- | São Paulo     | São Paulo      |
         -- | Campo Grande  |
         -- | São Paulo     | 
         -- | São Paulo     |
      -- Saída:
         -- | CIDADE         | 
         -- | Porto Alegre   | 
         -- | Florianópolis  | 
         -- | Brasília       |
         -- | NULL           | 
         -- | São Paulo      |
         -- | Campo Grande   | 
         -- | Rio de Janeiro |
     
-- UNION ALL: Faz a combinação, porém mantendo as duplicatas (Mais rápido que o UNION, pois não faz a comparação e DISTINCT)
-- O nº de cópias de uma linha no resultado é m + n, onde m e n é o nº de vezes que a linha aparece na primeira e na segunda parte da união •
   -- Exemplo: Recuperar as cidades dos médicos e as cidades dos pacientes. 
      SELECT cidade 
      FROM medico 
      UNION ALL
      SELECT cidade 
      FROM paciente;
      -- Tabelas:
         -- [Médico]:       [Pacientes]:
         -- | CIDADE        | CIDADE         |
         -- | Porto Alegre  | São Paulo      |
         -- | Florianópolis | Rio de Janeiro |
         -- | Brasília      | Brasília       |
         -- | NULL          | NULL           |
         -- | São Paulo     | São Paulo      |
         -- | Campo Grande  |
         -- | São Paulo     | 
         -- | São Paulo     |
      -- Saída:
         -- | CIDADE         |
         -- | Porto Alegre   | 
         -- | Florianópolis  |
         -- | Brasília       | 
         -- | NULL           | 
         -- | São Paulo      | 
         -- | Campo Grande   |
         -- | São Paulo      | 
         -- | São Paulo      |
         -- | São Paulo      |
         -- | Rio de Janeiro |
         -- | Brasília       | 
         -- | NULL           |
         -- | São Paulo      |

-- Interseção: O MySQL não possui um operador para obter a interseção do resultado de duas ou mais declarações SELECT (como o INTERSECT no PostgreSQL).
-- É possível simular a interseção utilizando o operador IN ou a junção externa (por exemplo, LEFT OUTER JOIN).
-- Conceituando: Retorna apenas os registros iguais nas duas ou mais tabelas  (math).

-- Interseção com IN e com INNER JOIN:
   -- Exemplo IN: Recuperar as cidades que têm médicos e pacientes cadastrados. 
      SELECT DISTINCT cidade 
      FROM medico 
      WHERE cidade IN (SELECT cidade FROM paciente);
   -- Exemplo INNER JOIN:
      SELECT DISTINCT m.cidade 
      FROM medico m 
      INNER JOIN paciente p ON (m.cidade = p.cidade);
      -- Tabelas:
         -- [Médico]:       [Pacientes]:
         -- | CIDADE        | CIDADE         |
         -- | Porto Alegre  | São Paulo      |
         -- | Florianópolis | Rio de Janeiro |
         -- | Brasília      | Brasília       |
         -- | NULL          | NULL           |
         -- | São Paulo     | São Paulo      |
         -- | Campo Grande  |
         -- | São Paulo     | 
         -- | São Paulo     |
      -- Saída:
         -- | CIDADE    |
         -- | Brasília  |
         -- | São Paulo | 
   
