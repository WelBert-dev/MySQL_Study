-- Conceituando: Uma Exibição (Visão) é uma tabela virtual basaeada no conjunto de resultados de uma consulta SQL.
-- Contém linhas e colunas igual uma tabela real, e pode receber comandos como declarações JOIN, WHERE como uma tabela normal.
-- Mostra sempre resultados de dados atualizados, pois o monitor do banco de dados recria os dados toda vez que um usuário consulta a visão.

-- Tabelas:
    -- [tbl_autores]
    -- | Id_Autor | Nome_Autor | Sobrenome_Autor |
    -- | 1        | Daniel     | Barret          |
    -- | 2        | Gerald     | Carter          |
    -- | 3        | Mark       | Sobel           |
    -- | 4        | William    | Stanek          |
    -- | 5        | Richard    | Blum            |
    -- | 6        | Wellison   | Bertelli        |

    -- [tbl_editoras]
    -- | Id_Editora | Nome_Editora    | 
    -- | 1          | Prentice Hall   |
    -- | 2          | O´Reilly        |
    -- | 3          | Microsoft Press | 
    -- | 4          | Wiley           |
    -- | 5          | WEC             |

    -- [tbl_livros]
    -- | Id_Livro | Nome_Livro              | ISBN | Data_Pub   | Preco_Livro | Id_Autor | Id_Editora |
    -- | 1        | Linux cmd and shellScrp | 1414 | 2009-12-21 | 68.35       | 5        | 4          |
    -- | 2        | SSH, the secure shell   | 1212 | 2009-12-21 | 58.30       | 1        | 2          |
    -- | 3        | Using samba             | 1313 | 2000-12-21 | 61.45       | 2        | 2          |
    -- | 4        | Python essentials       | 1515 | 2015-12-22 | 75.30       | 6        | 5          |

    -- | Id_Autor | Nome_Autor | Sobrenome_Autor |
    -- | 1        | Daniel     | Barret          |
    -- | 2        | Gerald     | Carter          |
    -- | 3        | Mark       | Sobel           |
    -- | 4        | William    | Stanek          |
    -- | 5        | Richard    | Blum            |
    -- | 6        | Wellison   | Bertelli        |

-- SINTAXE para criação de uma VIEW:
    CREATE VIEW nome_exibição
    AS SELECT colunas
    FROM tabela
    WHERE condição;
-- Exemplo:
    CREATE VIEW vw_livrosAutores
    AS SELECT tbl_livros.Nome_Livro AS Livro, tbl_autores.Nome_Autor AS Autor
    FROM tbl_livros
    INNER JOIN tbl_autores ON (tbl_livros.Id_Autor = tbl_autores.Id_Autor);
    -- Exibição criada:
        -- [vw_livrosAutores]
        -- | Livro                   | Autor    |
        -- | Linux cmd and shellScrp | Richard  |
        -- | SSH, the secure shell   | Daniel   |
        -- | Using samba             | Gerald   |
        -- | Python essentials       | Wellison |


-- Para UTILIZAR a VIEW: Realizar um SELECT em cima da VIEW como se fosse uma tabela comum.
    -- Exemplo:
       SELECT Livro
       FROM vw_livrosAutores
       ORDER BY Autor ASC;
        -- Saída:
            -- [vw_livrosAutores]
            -- | Livro                   | Autor    |
            -- | SSH, the secure shell   | Daniel   |
            -- | Using samba             | Gerald   |
            -- | Linux cmd and shellScrp | Richard  |
            -- | Python essentials       | Wellison |


-- Para EXCLUIR uma VIEW:
    DROP VIEW vw_livrosAutores;
