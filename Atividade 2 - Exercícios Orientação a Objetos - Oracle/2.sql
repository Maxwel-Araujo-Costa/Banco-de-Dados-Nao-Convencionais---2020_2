create type Localizacao as Object (
    cidade varchar(30),
    estado varchar(30),
    pais varchar(30)
)
/

create type Informacoes_Gerais as Object(
    ISBN varchar(25),
    capítulos int(10),
    locali Localizacao
)
/
create type Livro as Object (
    titulo varchar(30),
    autor varchar(30),
    categoria varchar(30),
    informacoes Informacoes_Gerais
)
/
create table tb_livro of Livro;
/
insert into tb_livro values ('Nome livro 1', 'Autor 1', 'Categoria 1',
Informacoes_Gerais('ISBN 1','50', 
Localizacao('cidade 1', 'SP', 'Brasil')));
insert into tb_livro values ('Nome livro 2', 'Autor 2', 'Categoria 2',
Informacoes_Gerais('ISBN 2','50', 
Localizacao('cidade 2', 'SP', 'Brasil')));


select * from tb_livro;