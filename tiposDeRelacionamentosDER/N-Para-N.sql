-- Conceituando: Em um relacionamento do tipo N:N (Vários para Vários) cria-se uma tabela separada, 

  -- N:N Simples:
     -- Uma escola precisa de um banco de dados para armazenar informações sobre seus estudantes.
     -- De cada estudante, é preciso armazenar o prontuário, o nome e a idade.
     -- Cada estudante pode estar associado a vários cursos, e um curso pode estar associado a vários estudantes. 
        É preciso armazenar a data de início de cada uma dessas associações.
     -- De cada curso, deve-se guardar um código e o nome.
  
        ---- Então cria-se uma tabela de relacionamento: [Aluno]n <Cursar> n[Curso]
             -- Aonde <Cursar> guarda as seguintes informações:
             -- cursoCod, idAluno, idCurso, dataInicio (id's referenciam a chave primária dos alunos) ou seja chave estrangeira.
             -- A chave primária vai referênciar as 3 (cursoCod, idAluno, idCurso) - Chave primária composta.
