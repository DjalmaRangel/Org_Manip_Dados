/* questao01_logico: */

CREATE TABLE Tarefa (
    id_tarefa integer PRIMARY KEY,
    prioridade float,
    nome_tarefa varchar(200),
    data_limite date,
    percentual_concluido float,
    detalhamento_tarefa varchar(1000),
    status_conclusao boolean
);

CREATE TABLE Item (
    id_item integer PRIMARY KEY,
    descricao_item varchar(500),
    data_exec date,
    percentual_item float,
    fk_Tarefa_id_tarefa integer
);
 
ALTER TABLE Item ADD CONSTRAINT FK_Item_2
    FOREIGN KEY (fk_Tarefa_id_tarefa)
    REFERENCES Tarefa (id_tarefa)
    ON DELETE RESTRICT;/* questao01_logico: */

CREATE TABLE Tarefa (
    id_tarefa integer PRIMARY KEY,
    prioridade float,
    nome_tarefa varchar(200),
    data_limite date,
    percentual_concluido float,
    detalhamento_tarefa varchar(1000),
    status_conclusao boolean
);

CREATE TABLE Item (
    id_item integer PRIMARY KEY,
    descricao_item varchar(500),
    data_exec date,
    percentual_item float,
    fk_Tarefa_id_tarefa integer
);
 
ALTER TABLE Item ADD CONSTRAINT FK_Item_2
    FOREIGN KEY (fk_Tarefa_id_tarefa)
    REFERENCES Tarefa (id_tarefa)
    ON DELETE RESTRICT;