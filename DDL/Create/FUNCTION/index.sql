-- Conceituando: Rotinas Armazenadas é a possibilidade de criar funções no mysql

-- Sintaxe para criação:
    CREATE FUNCTION nome_função (parâmetro1 <TIPO>, parâmetro2 <TIPO>)
    RETURNS <TIPO-DE-RETORNO>
    RETURN calculo;

-- Exemplo:
    CREATE FUNCTION fn_somaInt(val1 INT, val2 INT)
    RETURNS INT
    RETURN val1 + val2;

-- Para invocar (rodar a função):
    SELECT fn_somaInt(5, 5) AS 'Resultado'
    -- Saída:
        -- | Resultado |
        -- | 10        |

-- Tabelas:
    -- [tbl_livros]
    -- | Id_Livro | Nome_Livro              | ISBN | Data_Pub   | Preco_Livro | Id_Autor | Id_Editora |
    -- | 1        | Linux cmd and shellScrp | 1414 | 2009-12-21 | 68.35       | 5        | 4          |
    -- | 2        | SSH, the secure shell   | 1212 | 2009-12-21 | 58.30       | 1        | 2          |
    -- | 3        | Using samba             | 1313 | 2000-12-21 | 61.45       | 2        | 2          |
    -- | 4        | Python essentials       | 1515 | 2015-12-22 | 75.30       | 6        | 5          |

-- Utilidades/possibilidades:
    SELECT Nome_Livro, fn_somaInt(tbl_livros.Preco_Livro, 6) AS 'Valor de 6 unidades'
    FROM tbl_livros
    WHERE tbl_livros.Id_Livro = 2;
    -- Saída:
        -- | Nome_Livro            | Valor de 6 unidades |
        -- | SSH, the secure shell | 348                 | -> arredonda pois a declaração do TIPO de retorno foi INT.

-- Para EXCLUIR uma função:
    DROP FUNCTION nome-da-função;
    