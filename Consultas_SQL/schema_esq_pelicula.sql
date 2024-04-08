CREATE TABLE PAIS(
    id_pais char(2) NOT NULL,
    nombre_pais varchar(40) NOT NULL,
    CONSTRAINT PK_PAIS PRIMARY KEY (id_pais)
);
CREATE TABLE CIUDAD(
    id_ciudad integer NOT NULL,
    nombre_ciudad varchar(100) NOT NULL,
    id_pais char(2) NOT NULL,
    CONSTRAINT PK_CIUDAD PRIMARY KEY (id_ciudad)
);
CREATE TABLE EMPRESA_PRODUCTORA(
    codigo_productora varchar(6) NOT NULL,
    nombre_productoria varchar(60) NOT NULL,
    id_ciudad integer,
    CONSTRAINT PK_EMPRESA_PRODUCTORA PRIMARY KEY (codigo_productora)
);
CREATE TABLE PELICULA(
    codigo_pelicula integer NOT NULL,
    titulo varchar(60) NOT NULL,
    idioma varchar(20) NOT NULL,
    formato varchar(20) NOT NULL,
    genero varchar(30) NOT NULL,
    codigo_productora varchar(6) NOT NULL,
    CONSTRAINT PK_PELICULA PRIMARY KEY (codigo_pelicula)
);
CREATE TABLE TAREA(
    id_tarea varchar(10) NOT NULL,
    nombre_tarea varchar(35) NOT NULL,
    sueldo_maximo integer NOT NULL,
    sueldo_minimo integer NOT NULL,
    CONSTRAINT PK_TAREA PRIMARY KEY (id_tarea)
);
CREATE TABLE DISTRIBUIDOR(
    id_distribuidor integer NOT NULL,
    nombre varchar(80) NOT NULL,
    direccion varchar(120) NOT NULL,
    telefono varchar(20) NOT NULL,
    tipo char(1) NOT NULL,
    CONSTRAINT PK_DISTRIBUIDOR PRIMARY KEY (id_distribuidor)
);
CREATE TABLE DEPARTAMENTO(
    id_departamento integer NOT NULL,
    id_distribuidor integer NOT NULL,
    nombre_departamento varchar(30) NOT NULL,
    calle varchar(40),
    numero integer,
    id_ciudad integer NOT NULL,
    jefe_departamento integer NOT NULL,
    CONSTRAINT PK_DEPARTAMENTO PRIMARY KEY (id_departamento, id_distribuidor)
);
CREATE TABLE EMPLEADO(
    id_empleado integer NOT NULL,
    nombre varchar(30) NOT NULL,
    apellido varchar(30) NOT NULL,
    porc_comision integer,
    sueldo integer,
    e_mail varchar(120) NOT NULL,
    fecha_nacimiento date NOT NULL,
    telefono varchar(20),
    id_tarea varchar(10) NOT NULL,
    id_jefe integer,
    id_departamento integer NOT NULL,
    id_distribuidor integer NOT NULL,
    CONSTRAINT PK_EMPLEADO PRIMARY KEY (id_empleado)
);
CREATE TABLE INTERNACIONAL(
    id_distribuidor integer NOT NULL,
    codigo_pais varchar(5) NOT NULL,
    CONSTRAINT PK_INTERNACIONAL PRIMARY KEY(id_distribuidor)
);
CREATE TABLE NACIONAL(
    id_distribuidor integer NOT NULL,
    nro_inscripcion integer NOT NULL,
    encargado varchar(60) NOT NULL,
    id_distrib_mayorista integer NOT NULL,
    CONSTRAINT PK_NACIONAL PRIMARY KEY (id_distribuidor, id_distrib_mayorista)
);
CREATE TABLE VIDEO(
    id_video integer NOT NULL,
    razon_social varchar(60) NOT NULL,
    direccion varchar(80) NOT NULL,
    telefono varchar(15),
    propietario varchar(60) NOT NULL,
    CONSTRAINT PK_VIDEO PRIMARY KEY (id_video)
);
CREATE TABLE ENTREGA(
    nro_entrega integer NOT NULL,
    fecha_entrega date NOT NULL,
    id_video integer NOT NULL,
    id_distribuidor integer NOT NULL,
    CONSTRAINT PK_ENTREGA PRIMARY KEY (nro_entrega)
);
CREATE TABLE RENGLON_ENTREGA(
    nro_entrega integer NOT NULL,
    codigo_pelicula integer NOT NULL,
    cantidad integer NOT NULL,
    CONSTRAINT PK_RENGLON_ENTREGA PRIMARY KEY (nro_entrega, codigo_pelicula)
);
--Tabla: CIUDAD
ALTER TABLE CIUDAD ADD CONSTRAINT FK_CIUDAD_PAIS
FOREIGN KEY (id_pais)
REFERENCES PAIS(id_pais);

--Tabla: EMPRESA_PRODUCTORA
ALTER TABLE EMPRESA_PRODUCTORA ADD CONSTRAINT FK_EMPRESA_PRODUCTORA_CIUDAD
FOREIGN KEY (id_ciudad)
REFERENCES CIUDAD(id_ciudad);

--Tabla: PELICULA
ALTER TABLE PELICULA ADD CONSTRAINT FK_PELICULA_EMPRESA_PRODUCTORA
FOREIGN KEY (codigo_productora)
REFERENCES EMPRESA_PRODUCTORA(codigo_productora);

--Tabla: ENTREGA
ALTER TABLE ENTREGA ADD CONSTRAINT FK_ENTREGA_VIDEO
FOREIGN KEY (id_video)
REFERENCES VIDEO(id_video);

ALTER TABLE ENTREGA ADD CONSTRAINT FK_ENTREGA_DISTRIBUIDOR
FOREIGN KEY (id_distribuidor)
REFERENCES DISTRIBUIDOR(id_distribuidor);

--Tabla: RENGLON_ENTREGA
ALTER TABLE RENGLON_ENTREGA ADD CONSTRAINT FK_RENGLON_ENTREGA_ENTREGA
FOREIGN KEY (nro_entrega)
REFERENCES ENTREGA(nro_entrega);

ALTER TABLE RENGLON_ENTREGA ADD CONSTRAINT FK_RENGLON_ENTREGA_PELICULA
FOREIGN KEY (codigo_pelicula)
REFERENCES PELICULA(codigo_pelicula);

--Tabla: DEPARTAMENTO
ALTER TABLE DEPARTAMENTO ADD CONSTRAINT FK_DEPARTAMENTO_CIUDAD
FOREIGN KEY (id_ciudad)
REFERENCES CIUDAD(id_ciudad);

ALTER TABLE DEPARTAMENTO ADD CONSTRAINT FK_DEPARTAMENTO_DISTRIBUIDOR
FOREIGN KEY (id_distribuidor)
REFERENCES DISTRIBUIDOR(id_distribuidor);

ALTER TABLE DEPARTAMENTO ADD CONSTRAINT FK_DEPARTAMENTO_EMPLEADO
FOREIGN KEY (jefe_departamento)
REFERENCES EMPLEADO(id_empleado);

--Tabla: NACIONAL
ALTER TABLE NACIONAL ADD CONSTRAINT FK_NACIONAL_DISTRIBUIDOR
FOREIGN KEY (id_distrib_mayorista)
REFERENCES DISTRIBUIDOR(id_distribuidor);

--Tabla: INTERNACIONAL
ALTER TABLE INTERNACIONAL ADD CONSTRAINT FK_INTERNACIOL_DISTRIBUIDOR
FOREIGN KEY (id_distribuidor)
REFERENCES DISTRIBUIDOR(id_distribuidor);

--Tabla: EMPLEADO
ALTER TABLE EMPLEADO ADD CONSTRAINT FK_EMPLEADO_TAREA
FOREIGN KEY (id_tarea)
REFERENCES TAREA(id_tarea);

ALTER TABLE EMPLEADO ADD CONSTRAINT FK_EMPLEADO_DEPARTAMENTO
FOREIGN KEY (id_departamento, id_distribuidor)
REFERENCES DEPARTAMENTO(id_departamento, id_distribuidor);

ALTER TABLE EMPLEADO ADD CONSTRAINT FK_EMPLEADO_EMPLEADO
FOREIGN KEY (id_jefe)
REFERENCES EMPLEADO(id_empleado);


