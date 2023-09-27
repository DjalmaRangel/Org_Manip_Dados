/* questao10_logico: */

CREATE TABLE Apartamento (
    numeroPorta integer PRIMARY KEY,
    nQuartos integer,
    fk_Proprietario_idProprietario integer,
    fk_TipoOcupacao_idOcupacao integer,
    fk_Condominio_idCondominio integer
);

CREATE TABLE Proprietario (
    nomeProprietario varchar(200),
    telefone varchar(13),
    idProprietario integer PRIMARY KEY
);

CREATE TABLE TipoOcupacao (
    nomeTipoOcupacao varchar(100),
    idOcupacao integer PRIMARY KEY
);

CREATE TABLE Condominio (
    idCondominio integer PRIMARY KEY,
    dataPagamento date,
    valorPago float,
    mesAnoCond varchar(10)
);

CREATE TABLE ItemCondominio (
    idItemCondominio integer PRIMARY KEY,
    valor float,
    referencia varchar(100)
);

CREATE TABLE Despesa (
    idDespesa integer PRIMARY KEY,
    nomeDespesa varchar(100),
    valor float,
    mesAno varchar(10),
    fk_TipoDespesa_nomeTipoDespesa varchar(100)
);

CREATE TABLE TipoDespesa (
    nomeTipoDespesa varchar(100) PRIMARY KEY
);

CREATE TABLE e_composto (
    fk_Condominio_idCondominio integer,
    fk_ItemCondominio_idItemCondominio integer
);

CREATE TABLE eh_composto (
    fk_Despesa_idDespesa integer,
    fk_ItemCondominio_idItemCondominio integer
);
 
ALTER TABLE Apartamento ADD CONSTRAINT FK_Apartamento_2
    FOREIGN KEY (fk_Proprietario_idProprietario)
    REFERENCES Proprietario (idProprietario)
    ON DELETE RESTRICT;
 
ALTER TABLE Apartamento ADD CONSTRAINT FK_Apartamento_3
    FOREIGN KEY (fk_TipoOcupacao_idOcupacao)
    REFERENCES TipoOcupacao (idOcupacao)
    ON DELETE CASCADE;
 
ALTER TABLE Apartamento ADD CONSTRAINT FK_Apartamento_4
    FOREIGN KEY (fk_Condominio_idCondominio)
    REFERENCES Condominio (idCondominio)
    ON DELETE CASCADE;
 
ALTER TABLE Despesa ADD CONSTRAINT FK_Despesa_2
    FOREIGN KEY (fk_TipoDespesa_nomeTipoDespesa)
    REFERENCES TipoDespesa (nomeTipoDespesa)
    ON DELETE CASCADE;
 
ALTER TABLE e_composto ADD CONSTRAINT FK_e_composto_1
    FOREIGN KEY (fk_Condominio_idCondominio)
    REFERENCES Condominio (idCondominio)
    ON DELETE RESTRICT;
 
ALTER TABLE e_composto ADD CONSTRAINT FK_e_composto_2
    FOREIGN KEY (fk_ItemCondominio_idItemCondominio)
    REFERENCES ItemCondominio (idItemCondominio)
    ON DELETE RESTRICT;
 
ALTER TABLE eh_composto ADD CONSTRAINT FK_eh_composto_1
    FOREIGN KEY (fk_Despesa_idDespesa)
    REFERENCES Despesa (idDespesa)
    ON DELETE RESTRICT;
 
ALTER TABLE eh_composto ADD CONSTRAINT FK_eh_composto_2
    FOREIGN KEY (fk_ItemCondominio_idItemCondominio)
    REFERENCES ItemCondominio (idItemCondominio)
    ON DELETE SET NULL;