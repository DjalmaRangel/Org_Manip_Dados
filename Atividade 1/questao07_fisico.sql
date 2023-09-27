/* questao07_logico: */

CREATE TABLE PalavrasFrases (
    palavra_frase varchar(400),
    fk_Tema_nomeTema varchar(200)
);

CREATE TABLE Tema (
    nomeTema varchar(200) PRIMARY KEY
);

CREATE TABLE Rodada_maioresEscores_controleJogo (
    idRodada integer,
    qtdAcertoPalavras integer,
    qtdAcertoLetras integer,
    nomeJogador varchar(200),
    pontuacao integer,
    letrasErradas varchar(20),
    jogoFinalizado boolean,
    PRIMARY KEY (idRodada, nomeJogador)
);

CREATE TABLE sorteia (
    fk_Rodada_maioresEscores_controleJogo_idRodada integer
);
 
ALTER TABLE PalavrasFrases ADD CONSTRAINT FK_PalavrasFrases_1
    FOREIGN KEY (fk_Tema_nomeTema)
    REFERENCES Tema (nomeTema)
    ON DELETE CASCADE;
 
ALTER TABLE sorteia ADD CONSTRAINT FK_sorteia_1
    FOREIGN KEY (fk_Rodada_maioresEscores_controleJogo_idRodada, ???)
    REFERENCES Rodada_maioresEscores_controleJogo (idRodada, ???)
    ON DELETE SET NULL;