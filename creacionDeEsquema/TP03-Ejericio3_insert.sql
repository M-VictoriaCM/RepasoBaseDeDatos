INSERT INTO COLECCION (id_coleccion, titulo_coleccion, descripcion) VALUES
(1, 'Pinturas Argentinas', 'pinturas de artistas argentinos del siglo XX');

INSERT INTO COLECCION (id_coleccion, titulo_coleccion, descripcion) VALUES
(2, 'Instrumentos Musicales', 'instrumentos musicales del mundo');

INSERT INTO COLECCION (id_coleccion, titulo_coleccion, descripcion) VALUES
(3, 'Monedas Históricas', 'monedas argentinas y extranjeras');
--REPOSITORIO
INSERT INTO REPOSITORIO (id_repositorio, nombre, public, descripcion, duenio) VALUES
(1, 'Repositorio Museo Central', TRUE, 'Repositorio principal del museo digital', 'Museo Nacional');

INSERT INTO REPOSITORIO (id_repositorio, nombre, public, descripcion, duenio) VALUES
(2, 'Repositorio Colección Privada', FALSE, 'Colección privada de Juan Pérez', 'Juan Pérez');

INSERT INTO REPOSITORIO (id_repositorio, nombre, public, descripcion, duenio) VALUES
(3, 'Repositorio Biblioteca Nacional', TRUE, 'Repositorio de la Biblioteca Nacional', 'Biblioteca Nacional Argentina');

-- Pintura (usa la tabla OBJETO)
INSERT INTO OBJETO (id_objeto, titulo, fuente, fecha, tipo, id_coleccion, id_repositorio) VALUES
(1, 'El Grito de la Naturaleza', 'Museo Nacional de Bellas Artes', '1985-12-31', 'Pintura', 1, 1);

-- Instrumento Musical (usa la tabla OBJETO)
INSERT INTO OBJETO (id_objeto, titulo, fuente, fecha, tipo, id_coleccion, id_repositorio) VALUES
(2, 'Charango Boliviano', 'Colección personal donada por Maria Gomez', '1900-01-01', 'Instrumento Musical', 2, 2);

-- Documento (usa la tabla OBJETO y DOCUMENTO)
INSERT INTO OBJETO (id_objeto, titulo, fuente, fecha, tipo, id_coleccion, id_repositorio) VALUES
(3, 'Primera Constitución Argentina', 'Biblioteca Nacional Argentina', '1853-05-01', 'Documento', 3, 3);

INSERT INTO DOCUMENTO (id_objeto, id_coleccion, tipo_publicacion, modo_color, resolucion_captura) VALUES
(3, 3, 'Texto legal', 'Blanco y Negro', 300);

-- Audio (usa la tabla OBJETO y AUDIO)
INSERT INTO OBJETO (id_objeto, titulo, fuente, fecha, tipo, id_coleccion, id_repositorio) VALUES
(4, 'Sonidos de la Amazónica', 'Grabación', '2023-10-20', 'Audio', 1, 1);

INSERT INTO AUDIO (id_objeto, id_coleccion, formato, duracion) VALUES
(4, 1, 'MP3', '00:10:23');


