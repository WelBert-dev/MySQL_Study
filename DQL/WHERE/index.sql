-- Conceituando: Aqui contém um resumão dos Operadores de filtragem utilizados em conjuntoda cláusula WHERE, 
    -- para mais informações e exercicíos mais profundos ir na pasta relacionada.

-- Fontes: 
    -- https://www.devmedia.com.br/clausula-where-e-seus-operadores-no-sql/17291
    -- Boson Treinamentos - playlist MySQL

-- Caminhos/Resumo:
    -- Operadores de Filtragem (LIKE, IN, BETWEEN): ./OperadoresDeFiltragem
    -- Operadores Lógicos (NOT, AND, OR): ./OperadoresLogicos
    -- Operadores Relacionais (>, >=, <, <=, <>, !=): Mesma lógica de todas linguagens (./OperadoresRelacionais) 
    -- Operadores Booleanos (0, false, 1, true): Mesma lógica de todas linguagens.
    -- Operadores Aritméticos (math): Mesma lógica de todas linguagens.
    -- Expressões regulares: REGEXP: Mais informações em breve.

-- Operadores de Filtragem utilizados em conjunto com a cláusula WHERE (./OperadoresDeFiltragem):
   -- LIKE '%_' (e NOT LIKE) REGEX
   -- IN  (e NOT IN) 
   -- BETWEEN intervaloInicial AND intervaloFinal (e NOT BETWEEN)

-- Operadores Relacionais (mesma lógica de todas linguagens) (./OperadoresRelacionais):
    -- > (Maior que)
    -- >= (Maior ou igual)
    -- < (Menor que)
    -- <= (Menor ou igual)
    -- <> ou != (Diferente de)

-- Operadores Lógicos (mesma lógica de todas linguagens) (./OperadoresLogicos):
    -- NOT (Negação)
    -- AND (E, obrigatoriedade)
    -- OR (OU, um dos)

-- Operadores Aritméticos (math) (mesma lógica de todas linguagens):
    -- * (Multiplicação)
    -- / (Divisão)
    -- % (Módulo)
    -- + (Adição)
    -- - (Subtração)

-- Operadores Booleanos (mesma lógca de todas linguagens):
    -- 0 (false)
    -- 1 (true)

-- Ordem de Precedência dos Operadores:
    -- | Nível 	| Operadores                                                                                                 
    -- | 1      | ~ (Não de bit a bit)
    -- | 2      | * (Multiplicação), / (Divisão), % (Módulo)
    -- | 3 	    | + (Positivo), – (Negativo), + (Adição), + (Concatenação), – (Subtração), & (AND bit a bit), ^ (OR exclusivo bit a bit) e | (OR bit a bit)
    -- | 4      | =, >, <, >=, <=, <>, !=, !>, !< (Operadores de comparação)
    -- | 5      | NOT
    -- | 6      | AND
    -- | 7      | ALL, ANY, BETWEEN, IN, LIKE, OR, SOME
    -- | 8      | = (Atribuição)

    -- obs: Quando dois operadores em uma expressão tiverem o mesmo nível de precedência, 
        -- eles serão avaliados da esquerda para a direita em sua posição na expressão. 
        -- Por exemplo, na expressão usada na seguinte instrução SET, 
        -- o operador de subtração é avaliado antes do operador de adição.

-- ~ RESUMÃO dos Operadores de Filtragem (./OperadoresDeFiltragem): 
  
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

-- * LIKE(%_) % = Vários ou nada, _ = Um e obrigatório.
    -- Conceituando: Filtragem utilizado para burcar algo com algum padrão, quando não se tem o valor exato (REGEX)
    -- Sintaxe:
        SELECT colunas
        FROM tabela 
        WHERE coluna expressão | valor LIKE '%algo' | 'algo%' | 'al%go' | '_lgo' | 'alg_' | 'al_o'; -- REGEX
    -- Exemplo: 
        SELECT Nome_Livro, Id_Autor
        FROM tbl_livros
        WHERE Nome_Livro LIKE '%shell%';
        -- Saída:
            -- [tbl_livros]
            -- | Nome_Livro              | Id_Autor |
            -- | Linux cmd and shellScrp | 5        | 
            -- | SSH, the secure shell   | 1        |


-- * NOT LIKE(%_) % = Vários ou nada, _ Um e obrigatório.
    -- Conceituando: NEGAÇÃO utilizado para buscar algo com algum padrão, quando não se tem o valor exato (REGEX). 
    -- Sintaxe:
        SELECT colunas
        FROM tabela
        WHERE coluna expressão | valor NOT LIKE '%algo' | 'algo%' | 'al%go' | '_lgo' | 'alg_' | 'al_o'; -- REGEX
    -- Exemplo:
        SELECT Nome_Livro, Id_Autor
        FROM tbl_livros
        WHERE Nome_Livro NOT LIKE '%shell%';
        -- Saída:
            -- [tbl_livros]
            -- | Nome_Livro              | Id_Autor |
            -- | Using samba             | 2        |
            -- | Python essentials       | 6        |

-- * IN (Lista_Valores)
    -- Conceituando: Filtragem utilizando lista de valores. 
    -- Sintaxe:
        SELECT colunas
        FROM tabela
        WHERE coluna expressão | valor IN (lista_valores);
    -- Exemplo:
        SELECT Nome_Livro, Id_Editora
        FROM tbl_livros
        WHERE Id_Editora IN (2, 4); -- tambem poderia passar outro SELECT no corpo do IN.
        -- Saída:
            -- [tbl_livros]
            -- | Nome_Livro              | Id_Editora |
            -- | Linux cmd and shellScrp | 4          |
            -- | SSH, the secure shell   | 2          |
            -- | Using samba             | 2          |


-- * NOT IN
    -- Conceituando: NEGAÇÂO de Filtragem utilizando lista de valores.
    -- Sintaxe:
        SELECT colunas
        FROM tabela
        WHERE coluna expressão | valor NOT IN (lista_valores);
    -- Exemplo:
        SELECT Nome_Livro, Id_Editora
        FROM tbl_livros
        WHERE Id_Editora NOT IN (2, 4); -- tambem poderia passar outro SELECT no corpo do IN.  
        -- Saída:
            -- [tbl_livros]
            -- | Nome_Livro              | Id_Editora |
            -- | Python essentials       | 5          |


-- * BEETWEEN intervaloInicial AND intervaloFinal
    -- Conceituando: Filtragem utilizando intervalos (serve para qualquer tipo que suporta ASC e DESC).
    -- Sintaxe:
        SELECT colunas
        FROM tabela
        WHERE coluna BETWEEN intervaloInicial AND intervaloFinal;
    -- Exemplo: 
        SELECT *
        FROM tbl_livros
        WHERE Data_Pub BETWEEN '2004-05-17' AND '2011-05-17';    
        -- Saída:
            -- [tbl_livros]
            -- | Id_Livro | Nome_Livro              | ISBN | Data_Pub   | Preco_Livro | Id_Autor | Id_Editora |
            -- | 1        | Linux cmd and shellScrp | 1414 | 2009-12-21 | 68.35       | 5        | 4          |
            -- | 2        | SSH, the secure shell   | 1212 | 2009-12-21 | 58.30       | 1        | 2          | 


-- NOT BEETWEEN
    -- Conceituando: NEGAÇÂO de Filtragem utilizando intervalos (serve para qualquer tipo que suporta ASC e DESC).
    -- Sintaxe:
        SELECT colunas
        FROM tabela
        WHERE coluna NOT BETWEEN intervaloInicial AND intervaloFinal;
    -- Exemplo: 
        SELECT *
        FROM tbl_livros
        WHERE Data_Pub NOT BETWEEN '2004-05-17' AND '2011-05-17';    
        -- Saída:
            -- [tbl_livros]
            -- | Id_Livro | Nome_Livro              | ISBN | Data_Pub   | Preco_Livro | Id_Autor | Id_Editora |
            -- | 3        | Using samba             | 1313 | 2000-12-21 | 61.45       | 2        | 2          |
            -- | 4        | Python essentials       | 1515 | 2015-12-22 | 75.30       | 6        | 5          |
