-- Conceituando: Stored Procedures (Procedimentos armazenados) são uma espécie de função mais complexa.
-- Emcapsula uma query SQL e execulta com os parâmetros passados.

-- Sintaxe:
    CREATE PROCEDURE nome-do-procedimento (parâmetros <TIPO>)
    declarações;

-- Invocando um procedimento (rodando):
    CALL nome-do-procedimento(parâmetros);

-- EXCLUINDO um procedimento:
    DROP PROCEDURE nome-do-procedimento;

-- Tabelas:
    -- [tbl_livros]
    -- | Id_Livro | Nome_Livro              | ISBN | Data_Pub   | Preco_Livro | Id_Autor | Id_Editora |
    -- | 1        | Linux cmd and shellScrp | 1414 | 2009-12-21 | 68.35       | 5        | 4          |
    -- | 2        | SSH, the secure shell   | 1212 | 2009-12-21 | 58.30       | 1        | 2          |
    -- | 3        | Using samba             | 1313 | 2000-12-21 | 61.45       | 2        | 2          |
    -- | 4        | Python essentials       | 1515 | 2015-12-22 | 75.30       | 6        | 5          |

-- Exemplo:
    CREATE PROCEDURE proc_verPreco (varId_Livro smallint)
    SELECT CONCAT('O preço é: ', Preco_Livro) AS Preço
    FROM tbl_livros
    WHERE Id_Livro = varId_Livro;

    CALL verPreco(3);
    -- Saída:
        -- | Preço            |
        -- | O preço é: 61.45 |

-- Criando Procedimentos com delimitador BEGIN e END: é preciso criar um delimitador com DELIMITER.
    -- DELIMITER: Substitui ';' pela expressão passada.
        -- Obs: Ao final passamos o delimitador padrão novamente para RESETAR e o MySQL voltar ao "Normal"

-- Exemplo:
    DELIMITER $$
    CREATE PROCEDURE verPreco (varId_Livro smallint)
    BEGIN
        SELECT CONCAT('O preço é: ', Preco_Livro) AS Preço
        FROM tbl_livros
        WHERE Id_Livro = varId_Livro;
        SELECT 'Procedimento realizado com sucesso! ;D';
    END$$
    DELIMITER ;

    CALL verPreco(3);
    -- Saída (janela 1):
        -- | Preço            |
        -- | O preço é: 61.45 |
    -- Saída (janela 2):
        -- | Procedimento realizado com sucesso! ;D |
        -- | Procedimento realizado com sucesso! ;D |
        