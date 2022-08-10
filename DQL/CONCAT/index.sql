-- Conceituando: Função utilizada para concatenar strings.
-- OBS: Ao concatenar com NULL o resultado é NULL!
    -- Para evitar: Utilizar funções que tratam de NULL (Para mais informações ir na raiz/NULL):
        -- IFNULL: IFNULL(valor | coluna, substituição)
            -- Exemplo:
                SELECT CONCAT('A quandidade adiquirida é: ', IFNULL(quantidade, 0))
                FROM teste_nulos
                WHERE item = 'Teclado';
        -- COALESCE: Aceita vários parâmetros, e vai fazendo o teste em cascata, retornando a primeira ocorrência não NULL.
            -- Exemplo: 
                SELECT CONCAT('A quantidade adiquirida é: ', COALESCE(NULL, quantidade, 0))
                FROM teste_nulos;
                WHERE item = 'Teclado';
                -- Saída: Valor de quantidade, pois é a primeira ocorrência NÂO NULL.
                


-- Sintaxe:
    SELECT CONCAT(nome_coluna | <string>, <string> | nome_coluna, ...);

-- Tabelas:
    -- [tbl_autores]
    -- | Id_Autor | Nome_Autor | Sobrenome_Autor |
    -- | 1        | Daniel     | Barret          |
    -- | 2        | Gerald     | Carter          |
    -- | 3        | Mark       | Sobel           |
    -- | 4        | William    | Stanek          |
    -- | 5        | Richard    | Blum            |
    -- | 6        | Wellison   | Bertelli        |

    -- [tbl_livros]
    -- | Id_Livro | Nome_Livro              | ISBN | Data_Pub   | Preco_Livro | Id_Autor | Id_Editora |
    -- | 1        | Linux cmd and shellScrp | 1414 | 2009-12-21 | 68.35       | 5        | 4          |
    -- | 2        | SSH, the secure shell   | 1212 | 2009-12-21 | 58.30       | 1        | 2          |
    -- | 3        | Using samba             | 1313 | 2000-12-21 | 61.45       | 2        | 2          |
    -- | 4        | Python essentials       | 1515 | 2015-12-22 | 75.30       | 6        | 5          |    

-- Exemplo:
    SELECT CONCAT('Wellison ', 'da Cruz Bertelli') AS Meu_Nome;
    -- Saída:
        -- | Meu_Nome                  |
        -- | Wellison da Cruz Bertelli |

-- Exemplo 2: 
    SELECT CONCAT(Nome_Autor, ' ', Sobrenome_Autor) AS 'Nome_Completo'
    FROM tbl_autores;
    -- Saída:
        -- | Nome_Completo     |
        -- | Daniel Barret     |
        -- | Gerald Carter     |
        -- | Mark Sobel        |
        -- | William Starrer   |
        -- | Richard Blum      |
        -- | Wellison Bertelli |
-- Exemplo 3:
    SELECT CONCAT('Eu gosto do livro ', Nome_Livro)
    FROM tbl_livros
    WHERE Id_Autor = 6;
    -- Saída:
        -- | CONCAT('Eu gosto do livro ', Nome_Livro) |
        -- | Eu gosto do livro Python essentials      |
