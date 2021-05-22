create type Contato_agenda as Object (
    telefone_res varchar(25),
    telefone_cel varchar(25),
    telefone_com varchar(25)
)
/

create type Endereco_Agenda as Object(
    logradouro varchar(30),
    numero int(10),
    complemento varchar(30),
    cidade varchar(30),
    estado varchar(30),
    cep varchar(30)
)
/
create type Agenda as Object (
nome varchar(30),
aniversario date,
cont Contato_agenda,
endr Endereco_Agenda
)
/
create table tb_agenda of Agenda;
/
insert into tb_agenda values ('Nome pessoa 1','2020-21-01',
Contato_agenda('55 11 1111-1111','55 11 91111-1111', '55 11 1111-1110'),
Endereco_Agenda('rua1','1','perto do posto 1', 'cidade1', 'SP', '11111-111'));
insert into tb_agenda values ('Nome pessoa 2','2020-21-02',
Contato_agenda('55 11 2222-2222','55 11 92222-2222', '55 11 2222-2220'),
Endereco_Agenda('rua2','2','perto do posto 2', 'cidade2', 'SP', '22222-222'));

select * from tb_agenda;