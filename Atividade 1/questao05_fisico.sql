/* questao05_logico: */

CREATE TABLE Professores (
    idProfessor integer PRIMARY KEY,
    Nome varchar(200),
    celular varchar(20),
    valorHoraAula float
);

CREATE TABLE Alunos_Endereco (
    matricula integer,
    numIdentidade integer,
    dataNasc date,
    nome varchar(200),
    CPF varchar(14),
    telefone varchar(20),
    idEndereco integer,
    cidade varchar(200),
    estado varchar(2),
    bairro varchar(200),
    numero integer,
    complemento varchar(200),
    logradouro varchar(1000),
    PRIMARY KEY (matricula, idEndereco)
);

CREATE TABLE Cursos (
    nome varchar(200) PRIMARY KEY,
    cargaHoraria integer,
    conteudo varchar(1000),
    valor float
);

CREATE TABLE Turma (
    horarioTermino time,
    horarioInicio time,
    dataTermino date,
    dataInicio date,
    idTurma integer PRIMARY KEY,
    fk_Professores_idProfessor integer,
    fk_Cursos_nome varchar(200)
);

CREATE TABLE possui (
    fk_Cursos_nome varchar(200),
    fk_Alunos_Endereco_matricula integer
);
 
ALTER TABLE Turma ADD CONSTRAINT FK_Turma_2
    FOREIGN KEY (fk_Professores_idProfessor)
    REFERENCES Professores (idProfessor)
    ON DELETE CASCADE;
 
ALTER TABLE Turma ADD CONSTRAINT FK_Turma_3
    FOREIGN KEY (fk_Cursos_nome)
    REFERENCES Cursos (nome)
    ON DELETE CASCADE;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_1
    FOREIGN KEY (fk_Cursos_nome)
    REFERENCES Cursos (nome)
    ON DELETE SET NULL;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_2
    FOREIGN KEY (fk_Alunos_Endereco_matricula, ???)
    REFERENCES Alunos_Endereco (matricula, ???)
    ON DELETE SET NULL;