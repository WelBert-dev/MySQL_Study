-- Conceituando: MySQL suporta expressões regulares (Busca por padrão) nas consultas em conjunto da cláusula WHERE, com o operador REGEXP.

-- [...] Qualquer caracter único no interválo ou conjunto especificado ([a-h];[aeiou])

-- [^...] Qualquer caracter único que NÂO esteja no interválo ou conjunto especificado ([^a-h];[^aeiou])

-- ^ inicio da string

-- $ fim da string

-- a|b|c Alteração (a ou b ou c)

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


-- Sintaxe:
    SELECT colunas
    FROM tabela
    WHERE colunas expressão | valor REGEXP '^[FS]';

-- Exemplo1: Retornar os livros que Nome_Livro começe com os caracteres 'F' ou 'S'.
    SELECT Nome_livro
    FROM tbl_livros
    WHERE Nome_Livro REGEXP '^[FS]';
    -- Saída:
        -- [tbl_livros]
        -- | Nome_Livro              |
        -- | Linux cmd and shellScrp |
        -- | SSH, the secure shell   |

-- Exemplo2: Retornar os livros que Nome_Livro NÃO começe com os caracteres 'F' ou 'S'.
    SELECT Nome_livro
    FROM tbl_livros
    WHERE Nome_Livro REGEXP '^[^FS]';
    -- Saída:
        -- [tbl_livros]
        -- | Id_Livro | Nome_Livro              | 
        -- | 3        | Using samba             |
        -- | 4        | Python essentials       |

-- Exemplo3: Retornar os livros que Nome_Livro acabe com os caracteres 'n' ou 'g'.
    SELECT Nome_Livro 
    FROM tbl_livros
    WHERE Nome_Livro REGEXP '[ps]$';
    -- Saída:
        -- [tbl_livros]
        -- | Nome_Livro              |
        -- | Linux cmd and shellScrp |
        -- | Python essentials       |

-- Exemplo4: Retornar os livros que Nome_Livro começe com 'L' ou 'S' ou com a sequência 'Py'.
    SELECT Nome_Livro
    FROM tbl_livros
    WHERE Nome_Livro REGEXP '^[LS]|Py';
    -- Saída:
        -- [tbl_livros]
        -- | Nome_Livro              |
        -- | Linux cmd and shellScrp | -> ^[LS]
        -- | SSH, the secure shell   | -> ^[LS]
        -- | Python essentials       | -> |Py
