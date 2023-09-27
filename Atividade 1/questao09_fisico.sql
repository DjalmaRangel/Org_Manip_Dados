/* questao09_logico: */

CREATE TABLE Revista (
    idRevista integer PRIMARY KEY,
    numeroEdicao integer,
    ano integer,
    fk_Caixa_numeroCaixa integer
);

CREATE TABLE Emprestimo (
    idEmprestimo integer PRIMARY KEY,
    dataEmprestimo date,
    dataDevolucao date,
    fk_Revista_idRevista integer
);

CREATE TABLE Colecao (
    nomeColecao varchar(200) PRIMARY KEY
);

CREATE TABLE Amigo (
    idAmigo integer,
    nomeAmigo varchar(200),
    nomeMae varchar(200),
    telefone varchar(13)
);

CREATE TABLE Caixa (
    numeroCaixa integer PRIMARY KEY,
    cor varchar(100),
    etiqueta varchar(100)
);

CREATE TABLE pertence_a (
    fk_Revista_idRevista integer,
    fk_Colecao_nomeColecao varchar(200)
);
 
ALTER TABLE Revista ADD CONSTRAINT FK_Revista_2
    FOREIGN KEY (fk_Caixa_numeroCaixa)
    REFERENCES Caixa (numeroCaixa)
    ON DELETE CASCADE;
 
ALTER TABLE Emprestimo ADD CONSTRAINT FK_Emprestimo_2
    FOREIGN KEY (fk_Revista_idRevista)
    REFERENCES Revista (idRevista)
    ON DELETE CASCADE;
 
ALTER TABLE pertence_a ADD CONSTRAINT FK_pertence_a_1
    FOREIGN KEY (fk_Revista_idRevista)
    REFERENCES Revista (idRevista)
    ON DELETE SET NULL;
 
ALTER TABLE pertence_a ADD CONSTRAINT FK_pertence_a_2
    FOREIGN KEY (fk_Colecao_nomeColecao)
    REFERENCES Colecao (nomeColecao)
    ON DELETE SET NULL;