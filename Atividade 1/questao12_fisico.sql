/* questao12_logico: */

CREATE TABLE Concurso_Jogo (
    idConcurso integer,
    data date,
    nomeJogo varchar(200),
    apostaMinima integer,
    apostaMaxima integer,
    acertosMinimos integer,
    acertosMaximos integer,
    qtdNumeros integer,
    PRIMARY KEY (idConcurso, nomeJogo)
);

CREATE TABLE Aposta (
    idAposta integer PRIMARY KEY,
    numerosApostados integer,
    fk_Concurso_Jogo_idConcurso integer,
    fk_Concurso_Jogo_nomeJogo varchar(200)
);

CREATE TABLE Premio (
    valorPremio integer PRIMARY KEY,
    numeroSorteado integer,
    fk_Concurso_Jogo_idConcurso integer,
    fk_Concurso_Jogo_nomeJogo varchar(200)
);
 
ALTER TABLE Aposta ADD CONSTRAINT FK_Aposta_2
    FOREIGN KEY (fk_Concurso_Jogo_idConcurso, fk_Concurso_Jogo_nomeJogo)
    REFERENCES Concurso_Jogo (idConcurso, nomeJogo)
    ON DELETE CASCADE;
 
ALTER TABLE Premio ADD CONSTRAINT FK_Premio_2
    FOREIGN KEY (fk_Concurso_Jogo_idConcurso, fk_Concurso_Jogo_nomeJogo)
    REFERENCES Concurso_Jogo (idConcurso, nomeJogo)
    ON DELETE RESTRICT;