create table Paciente (
    cpf integer,
    nome varchar2(30),
    idade integer,
    sexo varchar2(10),
    endereco varchar2(40),
    primary key (cpf)
);
/
create table Prontuario (
    codigo integer,
    sintomas varchar2(60),
    medico varchar2(30),
    paciente varchar2(30),
    data_inicio date,
    data_final date,
    primary key (codigo),
    foreign key (paciente) references Paciente(nome),
    Period for prontuario_periodo(data_inicio,data_final)
);
/

