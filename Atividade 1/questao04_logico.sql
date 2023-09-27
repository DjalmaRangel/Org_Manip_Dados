/* questao04_logico: */

CREATE TABLE Cliente (
    idCliente integer PRIMARY KEY,
    nomeCliente varchar(200),
    telefone varchar(20)
);

CREATE TABLE Festa_Endereco (
    idFesta integer,
    dataFesta date,
    horarioInicio time,
    horarioFim time,
    valorFinal float,
    fk_Cliente_idCliente integer,
    fk_Tema_nomeTema varchar(200),
    idEndereco integer,
    logradouro varchar(1000),
    numero integer,
    complemento varchar(200),
    bairro varchar(200),
    cidade varchar(200),
    estado varchar(2),
    PRIMARY KEY (idFesta, idEndereco)
);

CREATE TABLE Tema (
    nomeTema varchar(200) PRIMARY KEY,
    valor float,
    corToalha varchar(200)
);

CREATE TABLE Itens (
    idItem integer PRIMARY KEY,
    nomeItem varchar(200),
    descricao varchar(300)
);

CREATE TABLE possui (
    fk_Tema_nomeTema varchar(200),
    fk_Itens_idItem integer
);
 
ALTER TABLE Festa_Endereco ADD CONSTRAINT FK_Festa_Endereco_2
    FOREIGN KEY (fk_Cliente_idCliente)
    REFERENCES Cliente (idCliente)
    ON DELETE RESTRICT;
 
ALTER TABLE Festa_Endereco ADD CONSTRAINT FK_Festa_Endereco_3
    FOREIGN KEY (fk_Tema_nomeTema)
    REFERENCES Tema (nomeTema)
    ON DELETE CASCADE;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_1
    FOREIGN KEY (fk_Tema_nomeTema)
    REFERENCES Tema (nomeTema)
    ON DELETE RESTRICT;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_2
    FOREIGN KEY (fk_Itens_idItem)
    REFERENCES Itens (idItem)
    ON DELETE RESTRICT;