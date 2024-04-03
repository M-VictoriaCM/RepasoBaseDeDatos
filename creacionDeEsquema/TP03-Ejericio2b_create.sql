CREATE TABLE COLECCION(
    id_coleccion integer NOT NULL,
    titulo_coleccion varchar(45) NOT NULL,
    descripcion varchar(45) NOT NULL,
    CONSTRAINT PK_COLECCION PRIMARY KEY (id_coleccion)
);
CREATE TABLE REPOSITORIO(
    id_repositorio integer NOT NULL,
    nombre varchar(45) NOT NULL,
    public BOOLEAN NOT NULL,
    descripcion varchar(45) NOT NULL,
    duenio varchar(45),
    CONSTRAINT PK_REPOSITORIO PRIMARY KEY (id_repositorio)
);
CREATE TABLE OBJETO(
    id_objeto integer NOT NULL,
    titulo varchar(45) NOT NULL,
    fuente varchar(45) NOT NULL,
    fecha date NOT NULL,
    tipo varchar(45) NOT NULL,
    id_coleccion integer NOT NULL,
    id_repositorio integer NOT NULL,
    CONSTRAINT PK_OBJETO PRIMARY KEY (id_objeto,id_coleccion)
);
CREATE TABLE VIDEO(
    id_objeto integer NOT NULL,
    id_coleccion integer NOT NULL,
    resolucion integer NOT NULL,
    frames_x_segundo varchar(45) NOT NULL,
    CONSTRAINT PK_VIDEO PRIMARY KEY (id_objeto, id_coleccion)
);
CREATE TABLE AUDIO(
    id_objeto integer NOT NULL,
    id_coleccion integer NOT NULL,
    formato varchar(45) NOT NULL,
    duracion time NOT NULL,
    CONSTRAINT PK_AUDIO PRIMARY KEY (id_objeto, id_coleccion)
);
CREATE TABLE DOCUMENTO(
    id_objeto integer NOT NULL,
    id_coleccion integer NOT NULL,
    tipo_publicacion varchar(45) NOT NULL,
    modo_color varchar(45) NOT NULL,
    resolucion_captura integer NOT NULL,
    CONSTRAINT PK_DOCUMENTO PRIMARY KEY (id_objeto, id_coleccion)
);
--Table OBJETO
ALTER TABLE OBJETO ADD CONSTRAINT FK_OBJETO_COLECCION
FOREIGN KEY (id_coleccion)
REFERENCES COLECCION(id_coleccion);
ALTER TABLE OBJETO ADD CONSTRAINT FK_OBJETO_REPOSITORIO
FOREIGN KEY (id_repositorio)
REFERENCES REPOSITORIO(id_repositorio);

--Tabla Video
ALTER TABLE VIDEO ADD CONSTRAINT FK_VIDEO_OBJETO
FOREIGN KEY (id_objeto, id_coleccion)
REFERENCES OBJETO(id_objeto, id_coleccion);

--Tabla Audio
ALTER TABLE AUDIO ADD CONSTRAINT FK_AUDIO_OBJETO
FOREIGN KEY (id_objeto, id_coleccion)
REFERENCES OBJETO(id_objeto, id_coleccion);

--Tabla Documento
ALTER TABLE DOCUMENTO ADD CONSTRAINT FK_DOCUMENTO_OBJETO
FOREIGN KEY (id_objeto, id_coleccion)
REFERENCES OBJETO(id_objeto, id_coleccion);

