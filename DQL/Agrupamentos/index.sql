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
 ---------------------------> [ 5525 ] <------------------------------- SUM(qntd)
   -- Saída: 
      -- | Total_Mouses | 
      -- | 5525         |


-- Exemplo 2 (GROUP BY com SUM): Consulta totalizando as vendas de produtos POR cidade;
   SELECT cidade, SUM(qntd) as Total_Vendas
   FROM vendas
   GROUP BY cidade;
   -- [1a Etapa(GROUP BY cidade) quebra e organiza por cidade (grupos de cidade)]:
   -- [vendas]: LEMBRANDO QUE SÓ VAI SELECIONAR A COLUNA CIDADE!
   -- | id | nome_vdedor| qntd | produto | [ cidade     ] |
   -- | 10 | Jorge      | 1400 | Mouse   | São Paulo      |
   -- | 12 | Tatiana    | 1220 | Teclado | São Paulo      |
   -- | 18 | Marcos     | 980  | Mouse   | São Paulo      |
   -- | 22 | Roberto    | 3145 | Mouse   | São Paulo      |

   -- | 15 | Rita       | 2120 | Webcan  | Recife         | 
   -- | 19 | Carla      | 1120 | Webcan  | Recife         |

   -- | 14 | Ana        | 1700 | Teclado | Rio de Janeiro |

   -- [2a Etapa(SUM(qntd) as Total_Vendas) Aplica para cada grupo a soma das células da coluna]:
   -- [vendas]:
   -- | id | nome_vdedor| [ qntd ] | produto | cidade         |
   -- | 10 | Jorge      | 1400     | Mouse   | São Paulo      |
   -- | 12 | Tatiana    | 1220     | Teclado | São Paulo      |
   -- | 18 | Marcos     | 980      | Mouse   | São Paulo      |
   -- | 22 | Roberto    | 3145     | Mouse   | São Paulo      |
 ----------------------> [ 6745 ] <------------------------------- SUM(qntd)
        
   -- | 15 | Rita       | 2120     | Webcan  | Recife         | 
   -- | 19 | Carla      | 1120     | Webcan  | Recife         |
 ----------------------> [ 3240 ] <-------------------------------

   -- | 14 | Ana        | 1700     | Teclado | Rio de Janeiro |
 ----------------------> [ 1700 ] <------------------------------- SUM(qntd)
   -- Saída (Organiza em ASC):
      -- | Cidade         | Total_vendas |
      -- | Recife         | 3240         |
      -- | Rio de Janeiro | 1700         |
      -- | São Paulo      | 6745         |


 -- Exemplo 3 (GROUP BY com COUNT): Contar o número de registros de vendas POR cidade
    SELECT cidade, COUNT(*) as Total 
    FROM vendas
    GROUP BY cidade;
    -- [1a Etapa(GROUP BY cidade) quebra e organiza por cidade (grupos de cidade)]:
    -- [vendas]: LEMBRANDO QUE SÓ VAI SELECIONAR A COLUNA CIDADE!
    -- | id | nome_vdedor| qntd | produto | [ cidade     ] |
    -- | 10 | Jorge      | 1400 | Mouse   | São Paulo      |
    -- | 12 | Tatiana    | 1220 | Teclado | São Paulo      |
    -- | 18 | Marcos     | 980  | Mouse   | São Paulo      |
    -- | 22 | Roberto    | 3145 | Mouse   | São Paulo      |

    -- | 15 | Rita       | 2120 | Webcan  | Recife         | 
    -- | 19 | Carla      | 1120 | Webcan  | Recife         |

    -- | 14 | Ana        | 1700 | Teclado | Rio de Janeiro |

    -- [2a Etapa(COUNT(*) as Total) conta os registros de cidade POR grupos]:
    -- [vendas]:
    -- | id | nome_vdedor| [ qntd ] | produto | cidade         |
    -- | 10 | Jorge      | 1400     | Mouse   | São Paulo      |
    -- | 12 | Tatiana    | 1220     | Teclado | São Paulo      |
    -- | 18 | Marcos     | 980      | Mouse   | São Paulo      |
    -- | 22 | Roberto    | 3145     | Mouse   | São Paulo      |
  -------------------------------------------> [ 4 Registros ] <---- COUNT(*) 

    -- | 15 | Rita       | 2120     | Webcan  | Recife         | 
    -- | 19 | Carla      | 1120     | Webcan  | Recife         |
  -------------------------------------------> [ 2 Registros ] <---- COUNT(*)

    -- | 14 | Ana        | 1700     | Teclado | Rio de Janeiro |
  -------------------------------------------> [ 1 Registro ]  <---- COUNT(*)
    -- Saída: Organiza em ASC 
       -- | cidade         | Total | 
       -- | Recife         | 2     |
       -- | Rio de Janeiro | 1     |
       -- | São Paulo      | 4     |


-- cláusula HAVING:
   -- Conceituando: Utilizada para especificar condições de filtragem em grupos de registros ou agregacões.
   -- É frequentemente usada com a cláusula GROUP BY para filtrar as colunas agrupadas.

-- Corpo básico de uma Query com HAVING:
SELECT colunas, função_agregacão()
FROM tabela
WHERE filtro
GROUP BY colunas
HAVING filtro_agrupamento;

-- Exemplo 1(GROUP BY com SUM e HAVING): Consulta retornando total de vendas das cidades com menos de 2500 produtos vendidos:
   SELECT cidade, SUM(qntd) AS Total
   FROM vendas
   GROUP BY cidade
   HAVING SUM(qntd) < 2500; -- obs: Poderia utilizar o alias Total ao invéz de repetir SUM(qntd)
   -- [1a Etapa(GROUP BY cidade) quebra e organiza por cidade (grupos de cidade)]:
   -- [vendas]: LEMBRANDO QUE SÓ VAI SELECIONAR A COLUNA CIDADE!
   -- | id | nome_vdedor| qntd | produto | [ cidade     ] |
   -- | 10 | Jorge      | 1400 | Mouse   | São Paulo      |
   -- | 12 | Tatiana    | 1220 | Teclado | São Paulo      |
   -- | 18 | Marcos     | 980  | Mouse   | São Paulo      |
   -- | 22 | Roberto    | 3145 | Mouse   | São Paulo      |

   -- | 15 | Rita       | 2120 | Webcan  | Recife         | 
   -- | 19 | Carla      | 1120 | Webcan  | Recife         |

   -- | 14 | Ana        | 1700 | Teclado | Rio de Janeiro |
   
   -- [2a Etapa(SUM(qntd) as Total_Vendas) Aplica para cada grupo a soma das células da coluna]:
   -- [vendas]:
   -- | id | nome_vdedor| [ qntd ] | produto | cidade         |
   -- | 10 | Jorge      | 1400     | Mouse   | São Paulo      |
   -- | 12 | Tatiana    | 1220     | Teclado | São Paulo      |
   -- | 18 | Marcos     | 980      | Mouse   | São Paulo      |
   -- | 22 | Roberto    | 3145     | Mouse   | São Paulo      |
 ----------------------> [ 6745 ] <------------------------------- SUM(qntd)
        
   -- | 15 | Rita       | 2120     | Webcan  | Recife         | 
   -- | 19 | Carla      | 1120     | Webcan  | Recife         |
 ----------------------> [ 3240 ] <------------------------------- SUM(qntd)

   -- | 14 | Ana        | 1700     | Teclado | Rio de Janeiro |
 ----------------------> [ 1700 ] <------------------------------- SUM(qntd)

   -- [3a Etapa(HAVING SUM(qntd) < 2500) aplica a mesma lógica anterior, e verifica se o resultado total da soma POR grupos é menor que 2500]
   -- | 14 | Ana        | 1700     | Teclado | Rio de Janeiro |
 ----------------------> [ 1700 ] <-- Menor que 2500 (true) cai na condição HAVING
   -- Saída:
      -- | cidade         | Total | 
      -- | Rio de Janeiro | 1700  |


-- Exemplo 2 (GROUP BY com WHERE, SUM E HAVING): Consulta retornando total de vendas do produto 'Teclado' das cidades com menos de 1500 teclados vendidos:
   SELECT cidade, SUM(qntd) AS Total_Teclados
   FROM vendas
   WHERE Produto = 'Teclado'
   GROUP BY cidade
   HAVING SUM(qntd) < 1500; -- obs: Poderia utilizar o alias Total ao invéz de repetir SUM(qntd)
   -- [1a Etapa(GROUP BY cidade) quebra e organiza por cidade (grupos de cidade)]:
   -- [vendas]: LEMBRANDO QUE SÓ VAI SELECIONAR A COLUNA CIDADE!
   -- | id | nome_vdedor| qntd | produto | [ cidade     ] |
   -- | 10 | Jorge      | 1400 | Mouse   | São Paulo      |
   -- | 12 | Tatiana    | 1220 | Teclado | São Paulo      |
   -- | 18 | Marcos     | 980  | Mouse   | São Paulo      |
   -- | 22 | Roberto    | 3145 | Mouse   | São Paulo      |

   -- | 15 | Rita       | 2120 | Webcan  | Recife         | 
   -- | 19 | Carla      | 1120 | Webcan  | Recife         |

   -- | 14 | Ana        | 1700 | Teclado | Rio de Janeiro |
  
   -- [2a Etapa(WHERE produto = 'Teclado') e após aplica a soma SUM(qntd)]:
   -- [vendas]: LEMBRANDO QUE SÓ VAI SELECIONAR A COLUNA CIDADE!
   -- | id | nome_vdedor| qntd | [ produto ] |  cidade        |
   ---|-10-|-Jorge------|-1400-|---Mouse-----|-São-Paulo------|--
   -- | 12 | Tatiana    | 1220 |   Teclado   | São Paulo      |
   ---|-18-|-Marcos-----|-980--|---Mouse-----|-São-Paulo------|--
   ---|-22-|-Roberto----|-3145-|---Mouse-----|-São-Paulo------|--
 ---------------------> [ 1220 ] <--------------------------------- SUM(qntd) total

   ---|-15-|-Rita-------|-2120-|-Webcan--|-Recife---------|---
   ---|-19-|-Carla------|-1120-|-Webcan--|-Recife---------|---
 
   -- | 14 | Ana        | 1700 | Teclado | Rio de Janeiro |
 ---------------------> [ 1700 ] <-------------------------------- SUM(qntd) total

   -- [3a Etapa(HAVING SUM(qntd) < 1500) aplica a mesma lógica anterior, e verifica se o resultado total da soma POR grupos é menor que 1500]
   -- | 12 | Tatiana    | 1220 |   Teclado   | [ São Paulo     ] |
 ----------------------> [ 1220 ] <-- Menor que 1500 (true) cai na condição HAVING
   -- Saída:
      -- | cidade    | Total | 
      -- | São Paulo | 1220  |

   
