/* questao08_logico: */

CREATE TABLE Caso_de_Uso (
    idCaso varchar(200) PRIMARY KEY,
    nomeArquivo varchar(200),
    texto varchar(1000),
    casoUsoExtensaoUCE boolean,
    fk_Status_idStatus integer
);

CREATE TABLE Pacote (
    nomePasta varchar(200) PRIMARY KEY
);

CREATE TABLE Status (
    idStatus integer PRIMARY KEY,
    descricaoStatus varchar(100)
);

CREATE TABLE Relacionamento_1 (
    fk_Caso_de_Uso_idCaso varchar(200),
    fk_Pacote_nomePasta varchar(200)
);
 
ALTER TABLE Caso_de_Uso ADD CONSTRAINT FK_Caso_de_Uso_2
    FOREIGN KEY (fk_Status_idStatus)
    REFERENCES Status (idStatus)
    ON DELETE CASCADE;
 
ALTER TABLE Relacionamento_1 ADD CONSTRAINT FK_Relacionamento_1_1
    FOREIGN KEY (fk_Caso_de_Uso_idCaso)
    REFERENCES Caso_de_Uso (idCaso)
    ON DELETE RESTRICT;
 
ALTER TABLE Relacionamento_1 ADD CONSTRAINT FK_Relacionamento_1_2
    FOREIGN KEY (fk_Pacote_nomePasta)
    REFERENCES Pacote (nomePasta)
    ON DELETE RESTRICT;