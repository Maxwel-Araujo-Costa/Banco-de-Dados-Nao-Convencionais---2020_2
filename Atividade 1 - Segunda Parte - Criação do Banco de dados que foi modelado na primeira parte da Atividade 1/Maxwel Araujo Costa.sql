create type CENA as Object(
    pontuacao number,
    nome varchar(30),
    id_cena number,
    -- Retirado atributo Heroi:Heroi, a relação não faz sentido como "n" para 1. 
    -- A relação entre Cena e Heroi será conciderada como 1 para 1.
    member function retornaPontucao return number,
    member function retornarNome return varchar
)
/
create type INIMIGOS as Object (
    tipo varchar(30),
    hp number,
    ataque number,
    id_inimigo number,
    cena CENA,
    
    member function retornarTipo return varchar,
    member function retornarAtaque return number,
    member function retornarId return number
)
/
create type body INIMIGOS as
    
    member function retornarTipo return varchar is
    begin
        return tipo;
    end;
    member function retornarAtaque return number is
    begin
        return ataque;
    end;
    member function retornarId return number is
    begin
        return id_inimigo;
    end;
end;
/
create type body CENA as
    member function retornarNome return varchar is
    begin
        return nome;
    end;
    member function retornaPontucao return number is
    begin
        return pontuacao;
    end;
end;
/
create type HEROI as Object(
    hp number,
    mp number,
    vidas number,
    ataque number,
    id_heroi number,
    member function retornarHp return number,
    member function retornarAtaque return number,
    member function retornarId return number
)
/
create type ITENS as Object (
    itemNome varchar(30),
    itemQuantidade number,
    itemValor number,
    id_item number,
    heroi HEROI,
    
    member PROCEDURE aumentarQuantidade (itemQuantidade number),
    member function retornarId return number
)
/
create type body ITENS as
    member PROCEDURE aumentarQuantidade (itemQuantidade number) is
    begin
        itemQuantidade := itemQuantidade+1;
    end;
    
    member function retornarId return number is
    begin
        return id_item;
    end;
end;
/
create type body HEROI as
    member function retornarHp return number is
    begin
        return hp;
    end;
    member function retornarAtaque return number is
    begin
        return ataque;
    end;
    member function retornarId return number is
    begin
        return id_heroi;
    end;
end;
/
create table tb_inimigos of INIMIGOS;
/
create table tb_cena of CENA;
/
create table tb_heroi of HEROI;
/
create table tb_itens of ITENS;
/
create table tb_inventario (
    id_heroi REF HEROI SCOPE IS tb_heroi,
    id_item REF ITENS SCOPE IS tb_itens
);
/
create table tb_fauna (
    nome REF CENA SCOPE IS tb_cena,
    id_inimigo REF INIMIGOS SCOPE IS tb_inimigos
);
/