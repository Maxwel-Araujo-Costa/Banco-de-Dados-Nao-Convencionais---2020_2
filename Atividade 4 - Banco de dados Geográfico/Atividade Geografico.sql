--Maxwel Araújo Costa                        Bt 3000184
CREATE TABLE Municipio (
 cod_municipio NUMBER(32) NOT NULL ,
 nome VARCHAR2(200),
 mapa_municipio MDSYS.SDO_GEOMETRY,
 PRIMARY KEY (cod_municipio));
 
 insert into municipio (cod_municipio, nome, mapa_municipio) 
 values (1, 'Boituva', MDSYS.SDO_GEOMETRY(2003, NULL, NULL,
     MDSYS.SDO_ELEM_INFO_ARRAY( 1, 1003, 1),
     MDSYS.SDO_ORDINATE_ARRAY(2,19,13,10,25,15,2,19)));

 insert into municipio (cod_municipio, nome, mapa_municipio) 
 values (2, 'Tatuí', MDSYS.SDO_GEOMETRY(2003, NULL, NULL,
     MDSYS.SDO_ELEM_INFO_ARRAY( 1, 1003, 1),
     MDSYS.SDO_ORDINATE_ARRAY(13,10,25,1,25,15,13,10)));
        
 insert into municipio (cod_municipio, nome, mapa_municipio) 
 values (3, 'Salto', MDSYS.SDO_GEOMETRY(2003, NULL, NULL,
     MDSYS.SDO_ELEM_INFO_ARRAY( 1, 1003, 1),
     MDSYS.SDO_ORDINATE_ARRAY(13,17,25,15,37,1,27,20,13,17)));

 insert into municipio (cod_municipio, nome, mapa_municipio) 
 values (4, 'Iperó', MDSYS.SDO_GEOMETRY(2003, NULL, NULL,
     MDSYS.SDO_ELEM_INFO_ARRAY( 1, 1003, 1),
     MDSYS.SDO_ORDINATE_ARRAY(25,15,25,1,37,1,25,15)));
    
    
CREATE TABLE Sede (
 cod_sede NUMBER(32) NOT NULL ,
 nome VARCHAR2(200),
 mapa_sede MDSYS.SDO_GEOMETRY,
 PRIMARY KEY (cod_sede));
 
 insert into Sede (cod_sede, nome, mapa_sede)
 values 	(100, 'Sede Boituva', MDSYS.SDO_GEOMETRY(2001, NULL, MDSYS.SDO_POINT_TYPE(13, 15, NULL ), NULL, NULL));
 
 insert into Sede (cod_sede, nome, mapa_sede)
 values 	(200, 'Sede Tatuí', MDSYS.SDO_GEOMETRY(2001, NULL, MDSYS.SDO_POINT_TYPE(19, 10, NULL ), NULL, NULL));
 
 insert into Sede (cod_sede, nome, mapa_sede)
 values 	(300, 'Sede Salto', MDSYS.SDO_GEOMETRY(2001, NULL, MDSYS.SDO_POINT_TYPE(25, 16, NULL ), NULL, NULL));
 
 insert into Sede (cod_sede, nome, mapa_sede)
 values 	(400, 'Sede Iperó', MDSYS.SDO_GEOMETRY(2001, NULL, MDSYS.SDO_POINT_TYPE(29, 6, NULL ), NULL, NULL));
 
 
CREATE TABLE Rio (
 cod_rio NUMBER(32) NOT NULL ,
 nome VARCHAR2(200),
 mapa_rio MDSYS.SDO_GEOMETRY,
 PRIMARY KEY (cod_rio));
 
 Insert into rio (cod_rio, nome, mapa_rio) values
	(1000, 'Rio Água Funda', MDSYS.SDO_GEOMETRY(2002, NULL, NULL,
							MDSYS.SDO_ELEM_INFO_ARRAY( 1, 2, 1 ),
			MDSYS.SDO_ORDINATE_ARRAY(10,16,24,18, 30,12, 27,5, 34,0)));
            
--a)
            
INSERT INTO USER_SDO_GEOM_METADATA
    VALUES ( 'Municipio' ,'mapa_municipio' ,
    MDSYS.SDO_DIM_ARRAY(
    MDSYS.SDO_DIM_ELEMENT('X',-180,180,0.0005),
    MDSYS.SDO_DIM_ELEMENT('Y',-180,180,0.0005)),
    NULL);
    
INSERT INTO USER_SDO_GEOM_METADATA
    VALUES ( 'Sede' ,'mapa_sede' ,
    MDSYS.SDO_DIM_ARRAY(
    MDSYS.SDO_DIM_ELEMENT('X',-180,180,0.0005),
    MDSYS.SDO_DIM_ELEMENT('Y',-180,180,0.0005)),
    NULL);
    
INSERT INTO USER_SDO_GEOM_METADATA
    VALUES ( 'Rio' ,'mapa_rio' ,
    MDSYS.SDO_DIM_ARRAY(
    MDSYS.SDO_DIM_ELEMENT('X',-180,180,0.0005),
    MDSYS.SDO_DIM_ELEMENT('Y',-180,180,0.0005)),
    NULL);
  
    
CREATE INDEX Municipio_IX ON
    Municipio(mapa_municipio) INDEXTYPE IS
    MDSYS.SPATIAL_INDEX;
    
CREATE INDEX Sede_IX ON
    Sede(mapa_sede) INDEXTYPE IS
    MDSYS.SPATIAL_INDEX;
  
CREATE INDEX Rio_IX ON
    Rio(mapa_rio) INDEXTYPE IS
    MDSYS.SPATIAL_INDEX;
  
--b)

SELECT  *
FROM municipio t1, municipio t2
WHERE t1.cod = 1 and t2.cod = 2 and 
SDO_TOUCH (t1.mapa_municipio, t2.mapa_municipio) =
'TRUE';

--c)

SELECT  *
FROM sede t1, municipio t2
WHERE t1.cod = 100 and t2.cod = 1 and 
SDO_INSIDE (t1.mapa_sede, t2.mapa_municipio) =
'TRUE';

--d)
--Boituva
SELECT  *
FROM sede t1, sede t2
WHERE t1.cod = 400 and t2.cod = 100 and 
SDO_GEOM.SDO_DISTANCE (t1.mapa_sede, t2.mapa_municipio, 0.00005) > 0;
--Tatui
SELECT  *
FROM sede t1, sede t2
WHERE t1.cod = 400 and t2.cod = 200 and 
SDO_GEOM.SDO_DISTANCE (t1.mapa_sede, t2.mapa_municipio, 0.00005) > 0;
--Salto
SELECT  *
FROM sede t1, sede t2
WHERE t1.cod = 400 and t2.cod = 300 and 
SDO_GEOM.SDO_DISTANCE (t1.mapa_sede, t2.mapa_municipio, 0.00005) > 0;

--e)
SELECT  *
FROM municipio t1, municipio t2
WHERE SDO_TOUCH (t1.mapa_municipio, t2.mapa_municipio) =
'TRUE';

--f)
SELECT *
FROM rio t1, municipio t2
WHERE t1.nome = 'Rio Água Funda' and
SDO_ANYINTERACT (t1.mapa_rio, t2.mapa_municipio) =
'TRUE';

--g)
SELECT t1., t2., SDO_GEOM.SDO_DISTANCE (t1.mapa_rio, t2.mapa_sede, 0.00005) as distancia
FROM rio t1, Sede t2
WHERE SDO_GEOM.SDO_DISTANCE (t1.mapa_rio, t2.mapa_sede, 0.00005) > 1
order by distancia;


