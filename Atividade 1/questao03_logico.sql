/* questao03_logico: */

CREATE TABLE Teste (
    idTeste integer PRIMARY KEY,
    dataGeracao date,
    numQuestoes integer
);

CREATE TABLE Questao (
    idQuestao integer PRIMARY KEY,
    questao varchar(1000),
    gabarito varchar(100),
    bimestre integer,
    fk_Materia_idMateria integer
);

CREATE TABLE Materia (
    idMateria integer PRIMARY KEY,
    nomeMateria varchar(200),
    serie integer,
    fk_Disciplina_idDisciplina integer
);

CREATE TABLE Disciplina (
    idDisciplina integer PRIMARY KEY,
    nomeDisciplina varchar(200)
);

CREATE TABLE possui (
    fk_Teste_idTeste integer,
    fk_Questao_idQuestao integer
);
 
ALTER TABLE Questao ADD CONSTRAINT FK_Questao_2
    FOREIGN KEY (fk_Materia_idMateria)
    REFERENCES Materia (idMateria)
    ON DELETE CASCADE;
 
ALTER TABLE Materia ADD CONSTRAINT FK_Materia_2
    FOREIGN KEY (fk_Disciplina_idDisciplina)
    REFERENCES Disciplina (idDisciplina)
    ON DELETE RESTRICT;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_1
    FOREIGN KEY (fk_Teste_idTeste)
    REFERENCES Teste (idTeste)
    ON DELETE RESTRICT;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_2
    FOREIGN KEY (fk_Questao_idQuestao)
    REFERENCES Questao (idQuestao)
    ON DELETE RESTRICT;