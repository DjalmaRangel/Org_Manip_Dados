/* questao02_logico: */

CREATE TABLE Ligacao (
    id_ligacao integer PRIMARY KEY,
    data_ligacao date,
    hora_inicio time,
    hora_termino time,
    total_minutos integer,
    total_pulsos integer,
    telefone_digitado varchar(20),
    fk_Contato_id_contato integer
);

CREATE TABLE Contato (
    id_contato integer PRIMARY KEY,
    nome varchar(200),
    telefone varchar(20)
);
 
ALTER TABLE Ligacao ADD CONSTRAINT FK_Ligacao_2
    FOREIGN KEY (fk_Contato_id_contato)
    REFERENCES Contato (id_contato)
    ON DELETE SET NULL;