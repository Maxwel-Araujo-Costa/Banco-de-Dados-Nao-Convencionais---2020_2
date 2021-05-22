create type Departamento as Object(
    nome varchar(30),
    localização varchar(30),
    member function retornarDepartamento return varchar
)
/
create type Funcionario as Object (
    nome varchar(30),
    salario number,
    dataEntrada date,
    RG varchar(30),
    departa Departamento,
    
    member PROCEDURE recebeAumento (aumento number),
    member function retornarGanhoAnual return number
)
/
create type body Funcionario as
    member PROCEDURE recebeAumento (aumento number) is
    begin
        salario := salario+aumento;
    end;
    
    member function retornarGanhoAnual return number is
    begin
        return salario*12;
    end;
end;
/
create type body Departamento as
    member function retornarDepartamento return varchar is
    begin
        return nome;
    end;
end;
/
create table tb_funcionario of Funcionario;
/