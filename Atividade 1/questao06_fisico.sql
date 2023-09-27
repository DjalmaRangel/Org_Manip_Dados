/* questao06_logico: */

CREATE TABLE Anuncio (
    titulo varchar(200),
    valor float,
    textoAnuncio varchar(1000),
    nomeContato varchar(200),
    imagem varchar(1000),
    dataPublicacao date,
    obsTelefone varchar(200),
    fk_telefoneContato_telefoneContato_PK varchar(200),
    fk_Cliente_idCliente integer,
    fk_TipoAnuncio_nomeTipo varchar(100),
    fk_secoes_nomeSecao varchar(200)
);

CREATE TABLE Cliente (
    idCliente integer PRIMARY KEY,
    nome varchar(200),
    email varchar(200),
    telefone varchar(20)
);

CREATE TABLE TipoAnuncio (
    nomeTipo varchar(100) PRIMARY KEY,
    numPalavras integer,
    imagem boolean,
    valor float
);

CREATE TABLE secoes (
    nomeSecao varchar(200) PRIMARY KEY
);

CREATE TABLE telefoneContato (
    telefoneContato_PK varchar(200) NOT NULL PRIMARY KEY,
    telefoneContato varchar(20),
    telefoneContato varchar(20)
);

CREATE TABLE interessa (
    fk_Cliente_idCliente integer,
    fk_secoes_nomeSecao varchar(200)
);
 
ALTER TABLE Anuncio ADD CONSTRAINT FK_Anuncio_1
    FOREIGN KEY (fk_telefoneContato_telefoneContato_PK)
    REFERENCES telefoneContato (telefoneContato_PK)
    ON DELETE CASCADE;
 
ALTER TABLE Anuncio ADD CONSTRAINT FK_Anuncio_2
    FOREIGN KEY (fk_Cliente_idCliente)
    REFERENCES Cliente (idCliente)
    ON DELETE CASCADE;
 
ALTER TABLE Anuncio ADD CONSTRAINT FK_Anuncio_3
    FOREIGN KEY (fk_TipoAnuncio_nomeTipo)
    REFERENCES TipoAnuncio (nomeTipo)
    ON DELETE CASCADE;
 
ALTER TABLE Anuncio ADD CONSTRAINT FK_Anuncio_4
    FOREIGN KEY (fk_secoes_nomeSecao)
    REFERENCES secoes (nomeSecao)
    ON DELETE CASCADE;
 
ALTER TABLE interessa ADD CONSTRAINT FK_interessa_1
    FOREIGN KEY (fk_Cliente_idCliente)
    REFERENCES Cliente (idCliente)
    ON DELETE SET NULL;
 
ALTER TABLE interessa ADD CONSTRAINT FK_interessa_2
    FOREIGN KEY (fk_secoes_nomeSecao)
    REFERENCES secoes (nomeSecao)
    ON DELETE SET NULL;