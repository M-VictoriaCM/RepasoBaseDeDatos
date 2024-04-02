# **Ejercicio 1:**
Dado los siguientes Diagramas de Entidades y Relaciones, construya el diagrama y genere el script con las sentencias SQL que: 
1. Creen las tablas que lo representan.
2. Realice el borrado de las tablas al inicio del script. <br>
***Nota:*** Para todos los casos asuma los tipos de datos que crea convenientes:

**Diagrama 1:** Modela la información de un repositorios de archivos digitales (audios, videos y documentos) que se encuentran agrupados de acuerdo a su temática en colecciones.<br>

<img src="https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/19adcd1a-8e38-49cb-8028-660ad9460196" alt="500" width="500"/>

Diagrama entidad de relacion <br>
<img src="https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/4156699b-5fc6-4984-b584-430068158d3b" alt="500" width="700"/>

**Diagrama 2:** Modela la información de los préstamos de libros en una biblioteca <br>
<img src="https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/3d048f49-635f-481c-9ac6-1eb1dadf047b" alt="500" width="500"/>

Diagrama entidad de relación <br>
<img src="https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/465238f8-d29d-43fc-947a-65cb18b5adb3" alt="500" width="700"/>

**Diagrama 3:** Modela la información de envíos de productos químicos a diferentes clientes de una empresa. <br>
<img src="https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/a462bba8-06ab-45a7-b6de-5654c2bc28e6" alt="500" width="500"/>

Diagrama entidad de relación:<br>
<img src="https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/46fa5481-b18f-4283-ad61-160b61c458cb" alt="500" width="700"/>

# Ejercicio 2
Cree las tablas correspondientes a los DEREs de los ejercicios 2 y 3 del Práctico 02. Asuma los tipos de datos más convenientes.

```
CREATE TABLE USUARIO(
    id_usuario integer NOT NULL,
    tipo_documento varchar(45) NOT NULL,
    nro_documento integer NOT NULL,
    apellido varchar(45) NOT NULL,
    nombre varchar(45) NOT NULL,
    e_mail varchar(45) NOT NULL,
    CONSTRAINT PK_USUARIO PRIMARY KEY (id_usuario)
);
--Tabla: sin carnet
CREATE TABLE SIN_CARNET(
    id_usuario integer NOT NULL,
    CONSTRAINT PK_SIN_CARNET PRIMARY KEY (id_usuario)
);

CREATE TABLE CON_CARNET(
    id_usuario integer NOT NULL,
    CONSTRAINT PK_CON_CARNET PRIMARY KEY (id_usuario)
);

CREATE TABLE PRESTAMO(
    id_prestamo integer NOT NULL,
    fecha_desde date NOT NULL,
    fecha_hasta date NOT NULL,
    id_usuario integer NOT NULL,
    CONSTRAINT PK_PRESTAMO PRIMARY KEY (id_prestamo)
);

CREATE TABLE CATALOGO_LIBRO(
    cod_catalogo integer NOT NULL,
    titulo varchar(45) NOT NULL,
    formato varchar(45) NOT NULL,
    editorial varchar(45) NOT NULL,
    CONSTRAINT PK_CATALOGO_LIBRO PRIMARY KEY (cod_catalogo)
);
CREATE TABLE EJEMPLAR_LIB(
    nro_ejemplar integer NOT NULL,
    anio_edicion date NOT NULL,
    nro_edicion integer NOT NULL,
    cod_catalogo integer NOT NULL,
    CONSTRAINT PK_EJEMPLAR_LIB PRIMARY KEY (nro_ejemplar)
);

CREATE TABLE LO_INTEGRAN(
    id_pretamo integer NOT NULL,
    nro_ejemplar integer NOT NULL,
    cod_catalogo integer NOT NULL,
    CONSTRAINT PK_LO_INTEGRAN PRIMARY KEY (id_pretamo, nro_ejemplar, cod_catalogo)
);

CREATE TABLE AUTOR(
    id_autor integer NOT NULL,
    nombre varchar(45) NOT NULL,
    cod_catalogo integer NOT NULL,
    CONSTRAINT PK_AUTOR PRIMARY KEY (id_autor)
);
--------Claves foraneas
ALTER TABLE SIN_CARNET ADD CONSTRAINT FK_SIN_CARNET_USUARIO
FOREIGN KEY (id_usuario)
REFERENCES USUARIO(id_usuario);
--Tablas con carnet
ALTER TABLE CON_CARNET ADD CONSTRAINT FK_CON_CARNET_USUARIO
FOREIGN KEY (id_usuario)
REFERENCES USUARIO(id_usuario);
-- Prestamo
ALTER TABLE PRESTAMO ADD CONSTRAINT FK_PRESTAMO_SIN_CARNET
FOREIGN KEY (id_prestamo)
REFERENCES SIN_CARNET(id_usuario);
--ejemplar_lib
ALTER TABLE EJEMPLAR_LIB ADD CONSTRAINT FK_EJEMPLAR_LIB_CATALOGO_LIBRO
FOREIGN KEY (cod_catalogo)
REFERENCES CATALOGO_LIBRO(cod_catalogo);

--Lo integran
ALTER TABLE LO_INTEGRAN ADD CONSTRAINT FK_LO_INTEGRAN_PRESTAMO
FOREIGN KEY (id_pretamo)
REFERENCES PRESTAMO(id_prestamo);

ALTER TABLE LO_INTEGRAN ADD CONSTRAINT FK_lO_INTEGRAN_EJEMPLAR_LIB
FOREIGN KEY (nro_ejemplar)
REFERENCES EJEMPLAR_LIB(nro_ejemplar);

ALTER TABLE LO_INTEGRAN ADD CONSTRAINT FK_lO_INTEGRAN_CATALOGO_LIBRO
FOREIGN KEY (cod_catalogo)
REFERENCES CATALOGO_LIBRO(cod_catalogo);
--Autor
ALTER TABLE AUTOR ADD CONSTRAINT FK_AUTOR_CATALOGO_LIBRO
FOREIGN KEY (cod_catalogo)
REFERENCES CATALOGO_LIBRO(cod_catalogo);
```


