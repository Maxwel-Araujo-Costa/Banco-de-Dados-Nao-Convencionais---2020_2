create table Empregado (
    cpf integer,
    nome varchar2(30),
    endereco varchar2(40),
    data_inicio date,
    data_final date,
    primary key (cpf),
    Period for empregado_periodo(data_inicio, data_final)
);
/
create table Funcao (
    codigo integer,
    nome varchar2(30),
    cpf integer,
    data_inicio date,
    data_final date,
    primary key (codigo),
    foreign key (cpf) references Empregado(cpf),
    Period for funcao_periodo(data_inicio,data_final)
);
/

