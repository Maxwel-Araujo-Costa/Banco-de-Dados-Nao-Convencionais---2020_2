
-- Classe que será herdada - classe PAI
CREATE OR REPLACE TYPE Funcionarios as object (
    matricula VARCHAR(40),
    nome VARCHAR(30),
    cargo VARCHAR(40),
    MEMBER FUNCTION retornaSalario  RETURN number
) NOT FINAL;
/
-- Classes filhas
CREATE OR REPLACE TYPE Celetistas UNDER Funcionarios
(
 salarioMensal number,
  OVERRIDING MEMBER FUNCTION retornaSalario RETURN NUMBER
) ;
/
CREATE OR REPLACE TYPE Horistas UNDER Funcionarios
(
 horas number,
 valorDaHora number,
    OVERRIDING MEMBER FUNCTION retornaSalario RETURN NUMBER
);
/
CREATE OR REPLACE TYPE BODY Horistas AS
  OVERRIDING MEMBER FUNCTION retornaSalario  RETURN number IS
  BEGIN
    
    RETURN horas*valorDaHora;
  END;
  
END;
/
CREATE OR REPLACE TYPE BODY Celetistas AS
  OVERRIDING MEMBER FUNCTION retornaSalario  RETURN number IS
  BEGIN
    
    RETURN salarioMensal;
  END;
  
END;
/
create table tb_Celetistas of Celetistas;
create table tb_Horistas of Horistas;

select * from tb_Celetistas;
select * from tb_Horistas;

insert into tb_Celetistas values (Celetistas('Bt3000','João', 'Desenvolvedor', 2000));

insert into tb_Horistas values (Horistas('Bt4000','Maria', 'Cantora', 30, 50));

select tc.retornaSalario() from tb_Celetistas tc;

select th.retornaSalario() from tb_Horistas th;

















