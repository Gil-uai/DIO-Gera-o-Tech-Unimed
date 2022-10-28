# Narrativa - Escopo Universidade - :speaking_head:

## Narrativa Alunos :man_student:

A universidade possui diversos alunos que podem estar matriculados em mais de um curso (graduação);

Os alunos podem fazer cursos extras fornecidos externa e internamente (universidade) para contar como horas complementares;

Não há restrição quanto ao numero de matérias puxadas se não houver sobreposição de horário;

Os alunos são submetidos a duas provas por semestre para cada disciplina. Eventuais trabalhos devem ser tratados pelo professor compor a nota da prova;

Cada disciplina é fornecida por um professor. Restrição: apenas por este professor;

Algumas disciplinas possuem pré-requisito. um mesmo pré-requisito pode ser associado a mais de uma disciplina



## Narrativa Professores :man_teacher:

Os professores que ministram as disciplinas estão associados as coordenações de seus respectivos cursos. Ex. Computação, Física, Engenharia...



# Considerações do Modelamento - :construction:

Realizada a generalização criando a classe pessoa para especificar Aluno e Professor;

Criado a tabela Periodo para determinar que uma Disciplina pode ser ofertada em um Periodo especifico;

Criada a tabela Extensão para atender a narrativa em que o alunos pode realizar cursos extras