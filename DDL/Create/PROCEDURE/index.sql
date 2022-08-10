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

    -- [tbl_editoras]
    -- | Id_Editora | Nome_Editora    | 
    -- | 1          | Prentice Hall   |
    -- | 2          | O´Reilly        |
    -- | 3          | Microsoft Press | 
    -- | 4          | Wiley           |
    -- | 5          | WEC             |

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

-- Utilizando Parâmetros em PROCEDURES 
    -- IN: É o modo padrão, do tipo passagem por valor (segue a mesma lógica de outras linguagens POO)
        -- Ou seja: O valor passado não é alterado na variável, mas sim feito uma "cópia" para utilizar no procedimento
        -- O Valor da variável não é alterada. (Passagem por valor).
        -- São semelhantes aos valores passados para funções.

    -- OUT: Ao contrário de parâmetros IN, este pode ser alterado ao longo da execução do procedimento, 
        -- E ao finalizar o valor NOVO é passado para a variável de entrada (ou seja, altera a variável "pai", passada no parâmetro).
        -- O procedimento armazenado não pode acessar o valor inicial do parâmetro OUT passado (variável), então o programa define como NULL
        -- Procedimentos OUT são semelhantes aos INOUT com a diferença significativa:
            -- No valor do parâmetros, ou seja, o valor da variável cujo valor é passado como parâmetro
                -- é ajustado para NULL no inicio da execução do procedimento

    -- INTOUT: Trata-se de uma combinação das duas possibilidades anteriores (IN e OUT),
        -- Ou seja, o procedimento é execultado e recebe uma referência da variável passada como parâmetro,
            -- E ao longo da execução do procedimento, a variável pode ser alterada,
            -- Sendo possível ao final da execução alterar a variável passada no parâmetro para fora do procedimento.
            -- Segue o mesmo conceito de POO (Passagem por referência).
            -- Resumo: A Variável passada tem seu valor alterado fora, ao final da execução do procedimento.

-- Sintaxe de um parâmetro:
    <IN | OUT | INOUT> nome-parametro <TIPO-PRIMITIVO>(Tamanho-do-Parametro)

-- Exemplo com parâmetro IN (default):

DELIMITER $$
CREATE PROCEDURE proc_editora_livro (IN editoraParam VARCHAR('50'))
BEGIN
    SELECT L.Nome_Livro, E.Nome_Editora
    FROM tbl_livros AS L
    INNER JOIN tbl_editoras AS E ON (L.Id_Editora = E.Id_Editora)
    WHERE E.Nome_Editora = editoraParam;
END$$
DELIMITER ;

CALL proc_editora_livro('Wiley');

-- Criando uma variável:
    SET @minhaEditora = 'Wiley';
CALL proc_editora_livro(@minhaEditora);
-- Saída:
    -- | Nome_Livro              | Nome_Editora |
    -- | Linux cmd and shellScrp | Wiley        |

-- Exemplo com parâmetro OUT:

DELIMITER $$
CREATE PROCEDURE proc_testeOut (IN idParam INT, OUT livroParam VARCHAR('50'))
BEGIN
    SELECT Nome_Livro
    INTO livroParam 
    FROM tbl_livros
    WHERE tbl_livros.Id_Livro = idParam;
END$$
DELIMITER ;

CALL proc_testeOut(3, @livroParam);
SELECT @livroParam;
-- Saída: Muda a variável após a execução do procedure.
    -- | @livroParam |
    -- | Using Samba |

-- Exemplo com parâmetro INOUT:

DELIMITER $$
CREATE PROCEDURE proc_aumentaPrecoEmPercent(INOUT valorParam DECIMAL(10, 2), taxa DECIMAL(10, 2))
BEGIN 
    SET valorParam = valorParam + valorParam * taxa / 100;
END$$
DELIMITER ;

SET @valorInicial = 20.00;
-- Valor em memória:
    -- | @valorInicial |
    -- | 20.00         |

CALL proc_aumentaPrecoEmPercent(@valorInicial, 15.00);
-- Novo Valor em memória:
    -- | @valorInicial |
    -- | 23.00         |
    