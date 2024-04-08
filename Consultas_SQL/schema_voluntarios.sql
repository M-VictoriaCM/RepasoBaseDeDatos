CREATE TABLE CONTINENTE(
    id_continente integer NOT NULL,
    nombre_continente varchar(60),
    CONSTRAINT PK_CONTINENTE PRIMARY KEY (id_continente)
);
CREATE TABLE PAIS(
    id_pais char(2) NOT NULL,
    nombre_pais varchar(100),
    id_continente integer NOT NULL,
    CONSTRAINT PK_PAIS PRIMARY KEY (id_pais)
);
CREATE TABLE DIRECCION(
    id_direccion integer NOT NULL,
    calle varchar(40),
    codigo_postal varchar(12),
    provincia varchar(25),
    ciudad varchar(30) NOT NULL,
    id_pais char(2) NOT NULL,
    CONSTRAINT PK_DIRECCION PRIMARY KEY (id_direccion)
);
CREATE TABLE INSTITUCION(
    id_institucion integer NOT NULL,
    nombre_institucion varchar(60) NOT NULL,
    id_direccion integer,
    id_director integer,
    CONSTRAINT PK_INSTITUCION PRIMARY KEY (id_institucion)
);
CREATE TABLE TAREA(
    id_tarea varchar(100) NOT NULL,
    nombre_tarea varchar(40) NOT NULL,
    min_horas integer,
    max_horas integer,
    CONSTRAINT PK_TAREA PRIMARY KEY (id_tarea)
);
CREATE TABLE VOLUNTARIO(
    nro_voluntario integer NOT NULL,
    nombre varchar(20),
    apellido varchar(25) NOT NULL,
    e_mail varchar(25)NOT NULL,
    telefono varchar(20),
    fecha_nacimiento date NOT NULL,
    id_tarea char(10) NOT NULL,
    horas_aportadas decimal(8,2),
    porcentaje decimal(8,2),
    id_institucion integer,
    id_coordinador integer,
    CONSTRAINT PK_VOLUNTARIO PRIMARY KEY (nro_voluntario)
);
CREATE TABLE HISTORICO(
    nro_voluntario integer NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    id_tarea varchar(100) NOT NULL,
    id_institucion integer,
    CONSTRAINT PK_HISTORICO PRIMARY KEY (nro_voluntario, fecha_inicio)
);
--Tabla: PAIS
ALTER TABLE PAIS ADD CONSTRAINT FK_PAIS_CONTINENTE
FOREIGN KEY (id_continente)
REFERENCES CONTINENTE(id_continente);
--Tabla: DIRECCION
ALTER TABLE DIRECCION ADD CONSTRAINT FK_DIRECCION_PAIS
FOREIGN KEY (id_pais)
REFERENCES PAIS(id_pais);
--Tabla: INSTITUCION
ALTER TABLE INSTITUCION ADD CONSTRAINT FK_INSTITUCION_DIRECCION
FOREIGN KEY (id_direccion)
REFERENCES DIRECCION(id_direccion);
ALTER TABLE INSTITUCION ADD CONSTRAINT FK_INSTITUCION_VOLUNTARIO
FOREIGN KEY (id_director)
REFERENCES VOLUNTARIO(nro_voluntario);
--Tabla:VOLUNTARIO
ALTER TABLE VOLUNTARIO ADD CONSTRAINT FK_VOLUNTARIO_INSTITUCION
FOREIGN KEY (id_institucion)
REFERENCES INSTITUCION(id_institucion);
ALTER TABLE VOLUNTARIO ADD CONSTRAINT FK_VOLUNTARIO_VOLUNTARIO
FOREIGN KEY (id_coordinador)
REFERENCES VOLUNTARIO(nro_voluntario);
ALTER TABLE VOLUNTARIO ADD CONSTRAINT FK_VOLUNTARIO_TAREA
FOREIGN KEY (id_tarea)
REFERENCES TAREA(id_tarea);
--Tabla: HISTORICO
ALTER TABLE HISTORICO ADD CONSTRAINT FK_HISTORICO_INSTITUCION
FOREIGN KEY (id_institucion)
REFERENCES INSTITUCION(id_institucion);
ALTER TABLE HISTORICO ADD CONSTRAINT FK_HISTORICO_TAREA
FOREIGN KEY (id_tarea)
REFERENCES TAREA(id_tarea);