-- Conceituando: O agrupamento é bastante utilizado para agrupar valores, e também é muito utilizado em conjunto com funções de agregação!
-- Para entender melhor iremos criar uma tabela vendas:

-- Tabelas:
-- [vendas]:
-- | id | nome_vdedor| qntd | produto | cidade         |
-- | 10 | Jorge      | 1400 | Mouse   | São Paulo      |
-- | 12 | Tatiana    | 1220 | Teclado | São Paulo      |
-- | 14 | Ana        | 1700 | Teclado | Rio de Janeiro |
-- | 15 | Rita       | 2120 | Webcan  | Recife         |
-- | 18 | Marcos     | 980  | Mouse   | São Paulo      | 
-- | 19 | Carla      | 1120 | Webcan  | Recife         |
-- | 22 | Roberto    | 3145 | Mouse   | São Paulo      |

-- GROUP BY: Cláusula utilizada para agrupar colunas
-- HAVING: Operador equivalente ao WHERE do SELECT, porém utilizado em conjunto com GROUP BY!

-- Corpo básico de uma Query com GROUP BY:
SELECT colunas, função_agregacão()
FROM tabela
WHERE filtro
GROUP BY colunas;

-- Exemplo 1(Agregação SUM): Consulta utilizando agregação para obter o TOTAL de venda de MOUSES:
   SELECT SUM(qntd) as Total_Mouses
   FROM vendas
   WHERE produto = 'Mouse';
   -- [1a Etapa(Soma dos campos qntd aonde produto = Mouse)]:
   -- | id | nome_vdedor| qntd   | produto | cidade         |
 ---->| 10 | Jorge      | [ 1400 | Mouse ] | São Paulo      |<----
   -- | 12 | Tatiana    | 1220   | Teclado | São Paulo      |
   -- | 14 | Ana        | 1700   | Teclado | Rio de Janeiro |
   -- | 15 | Rita       | 2120   | Webcan  | Recife         |
 ---->| 18 | Marcos     | [ 980  | Mouse ] | São Paulo      |<----
   -- | 19 | Carla      | 1120   | Webcan  | Recife         |
 ---->| 22 | Roberto    | [ 3145 | Mouse ] | São Paulo      |<----
   -- Saída: 


-- Exemplo 2 (GROUP BY com SUM): Consulta totalizando as vendas de produtos POR cidade;
   SELECT cidade, SUM(qntd) as Total_vendas
   FROM vendas
   GROUP BY cidade;
   -- [1a Etapa()]:



