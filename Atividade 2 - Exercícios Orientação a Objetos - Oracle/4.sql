CREATE or replace TYPE Cubo AS OBJECT(
	num1 NUMBER,
	STATIC PROCEDURE eleva ( p1 NUMBER)

    );
	/
CREATE OR REPLACE TYPE BODY Cubo AS
	STATIC PROCEDURE eleva (p1 NUMBER) is
	BEGIN
		DBMS_OUTPUT.PUT_LINE(concat('Novo número: ', p1*p1*p1));
	END;
    
END;
/
-- Chamada de método Estático
set SERVEROUTPUT ON
BEGIN
	Cubo.eleva(2);
END;
/

create table tb_Cubo of Cubo;
insert into tb_Cubo values (3);