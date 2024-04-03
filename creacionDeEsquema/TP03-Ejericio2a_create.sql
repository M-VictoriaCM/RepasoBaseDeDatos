--Tabla: FABRICANTE
CREATE TABLE FABRICANTE(
    id_fabricante integer NOT NULL,
    nombre varchar(45) NOT NULL,
    direccion varchar(45) NOT NULL,
    CONSTRAINT PK_FABRICANTE PRIMARY KEY (id_fabricante)
);
CREATE TABLE PRODUCTO(
    id_producto integer NOT NULL,
    id_fabricante integer NOT NULL,
    nombre Varchar(45) NOT NULL,
    precio FLOAT NOT NULL,
    CONSTRAINT PK_PRODUCTO PRIMARY KEY (id_producto, id_fabricante)
);
CREATE TABLE DEPARTAMENTO(
    id_departamento integer NOT NULL,
    nombre varchar(45) NOT NULL,
    id_empleado integer NOT NULL,
    CONSTRAINT PK_DEPARTAMENTO PRIMARY KEY (id_departamento)
);
CREATE TABLE EMPLEADO(
    id_empleado integer NOT NULL,
    nombre varchar(45) NOT NULL,
    apellido varchar(45) NOT NULL,
    direccion varchar(45) NOT NULL,
    puerta integer NOT NULL,
    ciudad varchar(45) NOT NULL,
    id_departamento integer NOT NULL,
    CONSTRAINT PK_EMPLEADO PRIMARY KEY (id_empleado)
);
CREATE TABLE VENDE(
    id_fabricante integer NOT NULL,
    id_producto integer NOT NULL,
    id_departamento integer NOT NULL,
    CONSTRAINT PK_VENDE PRIMARY KEY (id_fabricante, id_producto, id_departamento)
);
--Tabla Producto
ALTER TABLE PRODUCTO ADD CONSTRAINT FK_PRODUCTO_FABRICANTE
FOREIGN KEY (id_fabricante)
REFERENCES FABRICANTE(id_fabricante);

--Tabla Vende
ALTER TABLE VENDE ADD CONSTRAINT FK_VENDE_PRODUCTO
FOREIGN KEY (id_fabricante)
REFERENCES PRODUCTO(id_fabricante, id_producto);

ALTER TABLE VENDE ADD CONSTRAINT FK_VENDE_DEPARTAMENTO
FOREIGN KEY (id_departamento)
REFERENCES DEPARTAMENTO(id_departamento);

--Tabla Departamento
ALTER TABLE DEPARTAMENTO ADD CONSTRAINT FK_DEPARTAMENTO_EMPLEADO
FOREIGN KEY (id_empleado)
REFERENCES EMPLEADO(id_empleado);

--Tabla Empleado
ALTER TABLE EMPLEADO ADD CONSTRAINT FK_EMPLEADO_DEPARTAMENTO
FOREIGN KEY (id_departamento)
REFERENCES DEPARTAMENTO(id_departamento)

