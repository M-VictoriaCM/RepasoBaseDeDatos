INSERT INTO fabricante(id_fabricante, nombre, direccion) values
(1, 'fabricante1', 'calle Luna 789'),
(2, 'fabricante2', 'calle Estrella 101');

INSERT INTO producto(id_producto, id_fabricante, nombre, precio) VALUES
(1, 1, 'Producto1', 100.100),
(2, 1, 'Producto2', 200.00),
(3, 2, 'Producto3', 300.00),
(4, 2, 'Producto3', 300.00),
(5, 2, 'Producto3', 300.00);

INSERT INTO departamento(id_departamento, nombre, id_empleado) VALUES
(1, 'Ventas', 1),
(2, 'Produccion', 2),
(3, 'Administración', 3);

INSERT INTO empleado(id_empleado, nombre, apellido, direccion, puerta, ciudad, id_departamento) VALUES
(1, 'Juan', 'Pérez', 'Calle Mayor 123', 1, 'Buenos Aires', 1),
(2, 'María', 'Gómez', 'Calle del Sol 456', 2, 'Córdoba', 2),
(3, 'Pedro', 'López', 'Calle Luna 789', 3, 'Rosario', 3),
(4, 'Ana', 'Martínez', 'Calle Estrella 1011', 4, 'Mendoza', 1),
(5, 'Luis', 'Fernández', 'Calle San Martín 1234', 5, 'La Plata', 2);

INSERT INTO vende(id_fabricante, id_producto, id_departamento) VALUES
(1, 1, 1),
(1, 2, 1),
(2, 3, 2),
(2, 4, 2),
(2, 5, 3);

SELECT * FROM departamento;
SELECT * FROM empleado;
SELECT * FROM fabricante;
SELECT * FROM producto;
SELECT * FROM vende;