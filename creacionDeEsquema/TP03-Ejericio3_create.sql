CREATE TABLE CAMION(
    id_camion integer NOT NULL,
    matricula varchar(50) NOT NULL,
    tipo varchar(45) NOT NULL,
    potencia integer NOT NULL,
    CONSTRAINT PK_CAMION PRIMARY KEY (id_camion)
);
CREATE TABLE CIUDAD(
    id_ciudad integer NOT NULL,
    nombre varchar(45) NOT NULL,
    CONSTRAINT PK_CIUDAD PRIMARY KEY (id_ciudad)
);
CREATE TABLE CAMIONERO(
    id_camionero integer NOT NULL,
    dni integer NOT NULL,
    Nnombre varchar(45) NOT NULL,
    telefono integer NOT NULL,
    direccion varchar(45) NOT NULL,
    salario FLOAT NOT NULL,
    id_ciudad integer NOT NULL,
    CONSTRAINT PK_CAMIONERON PRIMARY KEY (id_camionero)
);
CREATE TABLE CONDUCIR(
    id_camionero integer NOT NULL,
    id_camion integer NOT NULL,
    fecha date NOT NULL,
    CONSTRAINT PK_CONDUCIR PRIMARY KEY (id_camionero, id_camion)
);
CREATE TABLE PAQUETE(
    id_paquete integer NOT NULL,
    descripcion varchar(100) NOT NULL,
    direccion varchar(45) NOT NULL,
    id_camionero integer NOT NULL,
    id_ciudad integer NOT NULL,
    CONSTRAINT PK_PAQUETE PRIMARY KEY (id_paquete)
);
--Tabla CAMIONERO
ALTER TABLE CAMIONERO ADD CONSTRAINT FK_CAMIONERO_CIUDAD
FOREIGN KEY (id_ciudad)
REFERENCES CIUDAD(id_ciudad);

--Tabla CONDUCIR
ALTER TABLE CONDUCIR ADD CONSTRAINT FK_CONDUCIR_CAMION
FOREIGN KEY (id_camion)
REFERENCES CAMION(id_camion);
ALTER TABLE CONDUCIR ADD CONSTRAINT FK_CONDUCIR_CAMIONERO
FOREIGN KEY (id_camionero)
REFERENCES CAMIONERO(id_camionero);

--Tabla PAQUETE
ALTER TABLE PAQUETE ADD CONSTRAINT FK_PAQUETE_CIUDAD
FOREIGN KEY (id_ciudad)
REFERENCES CIUDAD(id_ciudad);
ALTER TABLE PAQUETE ADD CONSTRAINT FK_PAQUETE_CAMIONERO
FOREIGN KEY (id_camionero)
REFERENCES CAMIONERO(id_camionero);
