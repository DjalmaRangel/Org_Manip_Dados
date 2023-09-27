/* questao11_logico: */

CREATE TABLE Consultorio (
    logradouro varchar(400),
    numero integer,
    bairro varchar(400),
    municipio varchar(400),
    estado varchar(400),
    complemento varchar(400),
    horarioInicio time,
    horarioFechamento time,
    idConsultorio integer PRIMARY KEY,
    diaFuncionamento varchar(100),
    horarioAlmoco time
);

CREATE TABLE Consulta (
    dataConsulta date,
    horarioConsulta time,
    dataLimiteConsulta date,
    idConsulta integer PRIMARY KEY,
    consultaRevisao boolean,
    encaixe boolean,
    fk_Paciente_IdPaciente integer,
    fk_Consultorio_idConsultorio integer,
    fk_agenda_idAgendamento integer
);

CREATE TABLE Paciente (
    IdPaciente integer PRIMARY KEY,
    nomePaciente varchar(200),
    telefone varchar(13),
    dataNasc date,
    email varchar(200),
    consultaParticular boolean,
    primeiraConsulta boolean,
    nConsultasMes integer,
    logradouro varchar(400),
    numero integer,
    complemento varchar(400),
    bairro varchar(400),
    municipio varchar(400),
    estado varchar(400),
    fk_PlanoDeSaude_nomePlano varchar(200)
);

CREATE TABLE agenda (
    idAgendamento integer PRIMARY KEY,
    diaSemana varchar(20),
    horarioConsulta time,
    nEncaixeDia integer,
    intervaloConsulta integer
);

CREATE TABLE PlanoDeSaude (
    nomePlano varchar(200) PRIMARY KEY,
    limiteDeConsulta integer
);
 
ALTER TABLE Consulta ADD CONSTRAINT FK_Consulta_2
    FOREIGN KEY (fk_Paciente_IdPaciente)
    REFERENCES Paciente (IdPaciente)
    ON DELETE CASCADE;
 
ALTER TABLE Consulta ADD CONSTRAINT FK_Consulta_3
    FOREIGN KEY (fk_Consultorio_idConsultorio)
    REFERENCES Consultorio (idConsultorio)
    ON DELETE CASCADE;
 
ALTER TABLE Consulta ADD CONSTRAINT FK_Consulta_4
    FOREIGN KEY (fk_agenda_idAgendamento)
    REFERENCES agenda (idAgendamento)
    ON DELETE CASCADE;
 
ALTER TABLE Paciente ADD CONSTRAINT FK_Paciente_2
    FOREIGN KEY (fk_PlanoDeSaude_nomePlano)
    REFERENCES PlanoDeSaude (nomePlano)
    ON DELETE SET NULL;