# ESQUEMA
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/9a566c40-872b-4df2-94e0-1bcb2f925662)

# CONSULTAS BÁSICAS
***EJEMPLO: Seleccion de los datos completos de las instituciones***

```
SELECT *
FROM institucion;
```
**SALIDA:<br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/3ab1389a-3e4a-4e81-80b4-7867a9abe045)


***EJEMPLO: Seleccionar el codigo y el nombre de las instituciones***
````
SELECT id_institucion, nombre_institucion
FROM institucion;
````
**SALIDA:<br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/e7389e12-6947-46f6-975b-db925a0b6c1f)

# FILAS DUPLICADAS

***EJEMPLO: Seleccionar los distintos voluntarios que son coordinadores***
```
SELECT DISTINCT id_coordinador
FROM voluntario;
```
**SALIDA:<br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/1878d9b8-6fec-45b1-9ec4-d1527c7337d3)

# ELIMINAR VALORES REPETIDOS

***EJEMPLO: Seleccionar los voluntarios coordinadores y las distintas instituciones de los empleados coordinados***
```
SELECT DISTINCT id_institucion, id_coordinador
FROM voluntario;
```
**SALIDA:<br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/218b6c86-6c46-45e4-8404-f02f718f0c67)

## EJERCICIO 1
1. cuantas Instituciones tiene la tabla institucion y cuales son?
```
SELECT DISTINCT id_institucion, nombre_institucion
FROM institucion;
```
**SALIDA:<br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/478c5024-b946-4018-ae7c-53d64db0ffa2)

2. Compara los resultados de:
* Distintos Identificadores de Instituciones en las que trabajan los voluntarios
```
SELECT DISTINCT id_institucion
FROM voluntario;
```
**SALIDA:<br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/ef03aa02-b889-44ad-9fcd-d5f22507d2d2)

* Distintos coordinadores
```
SELECT DISTINCT id_coordinador
FROM voluntario;
```
**SALIDA:<br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/92e066e0-17c6-41b0-836b-cbb02e468a12)

* Distintos identificadores de coordinadores con sus instituciones
```
SELECT DISTINCT id_coordinador, id_institucion
FROM voluntario;
```
*SALIDA:<br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/2a5a1f5a-0780-441b-99fa-df1e48683a6b)

# USO DE OPERADORES ARITMÉTICOS
***EJEMPLO: Seleccionar los nombre de las tareas y los rangos de duracion(diferencia entre horas máximas y minimas) de cada una***
```
SELECT nombre_tarea, max_horas-min_horas as rango_de_horas
FROM tarea;
```
*SALIDA:<br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/0ea8f84a-cbca-4836-9f5d-8d3a72f70a65)

## EJERCICIO 2:
1. Listar todos los datos de las tareas y la diferencia en las hs máximas y mínimas de las misma.
```
SELECT nombre_tarea, max_horas - min_horas AS diferencia_horaria
FROM tarea;
```
**SALIDA:<br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/ca7517b4-8ed1-4874-a5f6-a06234947575)

2. Listar las direcciones de manera que se vea la calle, la ciudad y la provincia separadas por comas (,).
```
SELECT  d.calle|| ',' || d.ciudad || ',' || d.provincia AS "Calle, Ciudad, provincia"
FROM direccion d;
```
**SALIDA:<br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/052655b6-3955-4088-b6ac-2897f497594e)

# RESTRINGIR LAS FILAS RECUPERADAS
***EJEMPLO: Recuperar el nro de voluntario, nombre y apellido de los voluntarios que trabajan en las institucion cuyo identificador 60***
```
SELECT nro_voluntario, nombre, apellido
FROM voluntario
WHERE id_institucion =60;
```

# CONDICIONES DE COMPARACIÓN
```
SELECT *
FROM voluntario
WHERE  id_tarea= 'EVENTOS';
```
**SALIDA:<br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/5a093ea8-1b4b-4ffd-a1bb-4549caebc028)

# OTROS OPERADORES DE COMPARACIÓN

***EJEMPLO: Seleccionar los voluntarios cuyo número se encuentra entre el 10 y 14.***
```
SELECT *
FROM voluntario
WHERE nro_voluntario BETWEEN  10 AND 14;
```
**SALIDA: <br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/4412f6f1-8feb-4e46-9e9d-9367a682dff8)

# OPERADOR LIKE

***EJEMPLO: Seleccionar los voluntarios cuya segunda letra del nombre sea M y luego tenga una n como carácter final;***
```
SELECT *
FROM voluntario
WHERE nombre LIKE  '_M%n';
```
**SALIDA: <br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/a7e2cb5a-28c6-4ae2-9baa-fe3df0699b0b)

## EJERCICIO 3:
1. Cuales son los voluntarios nacidos antes de la década del '90
```
SELECT nro_voluntario, apellido, fecha_nacimiento
FROM voluntario
WHERE extract(year from fecha_nacimiento) < 1990;
```
**SALIDA: <br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/00855c69-f8cf-4e3c-be41-0f5cecea4609)

2. Cuales son los voluntario con nombre Juan?
```
SELECT *
FROM voluntario
WHERE nombre ILIKE 'juan'
```
**SALIDA: <br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/79414a1f-5428-45f7-a361-6b51ddbd340d)

3. Cuales son los voluntario con apellido Ruiz?
```
SELECT *
FROM voluntario
WHERE apellido ILIKE 'ruiz';
```
**SALIDA:
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/ed62d9cc-0ecb-4f9b-8412-7ed7131c7a4f)

# OPERADOR ID [NOT] NULL

***EJEMPLO: Listar los datos completos de los voluntarios que no tengan coordinador***
```
SELECT * 
FROM voluntario
WHERE id_coordinador IS NULL;
```
**SALIDA: <br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/c168fff1-920f-44a8-9c10-3d44c6161768)

***EJEMEPLO: Listar los datos de los voluntarios cuyo porcentaje sea menor o igual que el 50%***
```
SELECT *
FROM voluntario
WHERE  porcentaje <= 50.00
OR porcentaje IS NULL;
```
**SALIDA: <br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/263be52a-ae68-4546-9b85-bdc36db07f96)

# CONDICIONES DE COMPARACIÓN COMPUESTA
***EJEMPLO: Seleccionar los voluntarios que son coordinados por los voluntarios nro 100 o 124 y están trabajando para la institucion cuyo código es 50
```
SELECT nro_voluntario,
       apellido,
       id_institucion,
       id_coordinador
FROM voluntario
WHERE (id_coordinador =100
OR id_coordinador= 124)
AND id_institucion= 50;
```

# ORDEN DE PRESENTACIÓN DE LOS REGISTROS
***EJEMPLO: Listar los apellidos ordenados descendentemente y nombre de los voluntarios que son coordinados por el volunrario 124***
```
SELECT apellido, nombre
FROM voluntario
WHERE id_coordinador = 14
ORDER BY  apellido DESC, nombre;
```
**SALIDA:<br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/0231d3da-2b37-48bc-83c4-6e2f6714afc9)
```
```
***EJEMPLO: Seleccionar los datos de los voluntarios que corresponden a los 10 primeros voluntarios***
```
SELECT *
FROM voluntario
ORDER BY nro_voluntario
LIMIT 10;
```
***EJEMPLO: Seleccionar los datos de los voluntarios a partir del 15to voluntario***
```
SELECT *
FROM voluntario
ORDER BY nro_voluntario
LIMIT ALL
OFFSET 15;
```

## EJERCICIO 5:
1. ¿Cuales son los 10 voluntarios mayores?
2. En orden alfabético quienes son los 5 primeros voluntarios de la institucion 80?
