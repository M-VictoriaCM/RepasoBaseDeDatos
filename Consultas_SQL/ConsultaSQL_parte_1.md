# ESQUEMA
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/9a566c40-872b-4df2-94e0-1bcb2f925662)

# CONSULTAS BÁSICAS
***EJEMPLO: Seleccion de los datos completos de las instituciones***

```
SELECT *
FROM institucion;
```
**SALIDA:<br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/d7c2de74-f41b-4a3e-ae3a-3f13334a3258)



***EJEMPLO: Seleccionar el codigo y el nombre de las instituciones***
````
SELECT id_institucion, nombre_institucion
FROM institucion;
````
**SALIDA:<br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/78b5b91c-b5d0-465d-9b99-8d588a28d4ab)


# FILAS DUPLICADAS

***EJEMPLO: Seleccionar los distintos voluntarios que son coordinadores***
```
SELECT DISTINCT id_coordinador
FROM voluntario;
```
**SALIDA:<br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/78ffe1d2-d5fb-4fbb-b867-c29c03d7e587)


# ELIMINAR VALORES REPETIDOS

***EJEMPLO: Seleccionar los voluntarios coordinadores y las distintas instituciones de los empleados coordinados***
```
SELECT DISTINCT id_institucion, id_coordinador
FROM voluntario;
```
**SALIDA:<br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/ce69ded7-2565-4572-a398-e109b1b7ee3d)


## EJERCICIO 1
1. cuantas Instituciones tiene la tabla institucion y cuales son?
```
SELECT DISTINCT id_institucion, nombre_institucion
FROM institucion;
```
**SALIDA:<br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/18dcdc95-4113-4c15-bfa7-0affda2cae17)


2. Compara los resultados de:
* Distintos Identificadores de Instituciones en las que trabajan los voluntarios
```
SELECT DISTINCT id_institucion
FROM voluntario;
```
**SALIDA:<br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/fa3d0772-a51b-4662-b420-e182855c4376)


* Distintos coordinadores
```
SELECT DISTINCT id_coordinador
FROM voluntario;
```
**SALIDA:<br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/89c848db-1d95-4dbe-b733-cda18ac364b8)


* Distintos identificadores de coordinadores con sus instituciones
```
SELECT DISTINCT id_coordinador, id_institucion
FROM voluntario;
```
*SALIDA:<br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/4f2e5d64-095a-4f9a-81e1-217988221c47)


# USO DE OPERADORES ARITMÉTICOS
***EJEMPLO: Seleccionar los nombre de las tareas y los rangos de duracion(diferencia entre horas máximas y minimas) de cada una***
```
SELECT nombre_tarea, max_horas-min_horas as rango_de_horas
FROM tarea;
```
*SALIDA:<br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/77dea1e6-f244-47dc-bd58-b8894a6d20b7)


## EJERCICIO 2:
1. Listar todos los datos de las tareas y la diferencia en las hs máximas y mínimas de las misma.
```
SELECT nombre_tarea, max_horas - min_horas AS diferencia_horaria
FROM tarea;
```
**SALIDA:<br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/53e7a397-9419-4004-8eee-34d9c52d13ab)


2. Listar las direcciones de manera que se vea la calle, la ciudad y la provincia separadas por comas (,).
```
SELECT  d.calle|| ',' || d.ciudad || ',' || d.provincia AS "Calle, Ciudad, provincia"
FROM direccion d;
```
**SALIDA:<br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/f9b06954-2bc0-4b32-b96a-4fdc93665e04)


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
WHERE  id_tarea= 'ST_MAN';
```
**SALIDA:<br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/5c2a42d9-067d-4406-84d6-0a83bd7bf443)



# OTROS OPERADORES DE COMPARACIÓN

***EJEMPLO: Seleccionar los voluntarios cuyo número se encuentra entre el 10 y 14.***
```
SELECT *
FROM voluntario
WHERE nro_voluntario BETWEEN  100 AND 120;
```
**SALIDA: <br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/20d4aacc-b7c6-4544-ad3e-58767912bd96)


# OPERADOR LIKE

***EJEMPLO: Seleccionar los voluntarios cuya segunda letra del nombre sea M y luego tenga una n como carácter final;***
```
SELECT *
FROM voluntario
WHERE nombre LIKE  '_a%n';
```
**SALIDA: <br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/ba865a9c-d4e6-4470-9176-10481ed2a0eb)


## EJERCICIO 3:
1. Cuales son los voluntarios nacidos antes de la década del '90
```
SELECT nro_voluntario, apellido, fecha_nacimiento
FROM voluntario
WHERE extract(year from fecha_nacimiento) < 1990;
```
**SALIDA: <br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/8261ad2b-83de-4a29-b97d-6dc80e9cfb2a)

2. Cuales son los voluntario con nombre David?
```
SELECT *
FROM voluntario
WHERE nombre ILIKE 'David'
```
**SALIDA: <br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/021a9331-d4d0-4eae-8aca-75e6ec90b725)


3. Cuales son los voluntario con apellido Smith?
```
SELECT *
FROM voluntario
WHERE apellido ILIKE 'Smith';
```
**SALIDA: <br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/55cf4d8e-5a66-4187-af4c-afdbd2f2a260)


# OPERADOR ID [NOT] NULL

***EJEMPLO: Listar los datos completos de los voluntarios que no tengan coordinador***
```
SELECT * 
FROM voluntario
WHERE id_coordinador IS NULL;
```
**SALIDA: <br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/786290a3-dabd-4454-a60d-c5e0591c80ca)


***EJEMEPLO: Listar los datos de los voluntarios cuyo porcentaje sea menor o igual que el 0,10***
```
SELECT *
FROM voluntario
WHERE  porcentaje <= 0.1
OR porcentaje IS NULL;
```
**SALIDA: <br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/94bdbbd7-451a-493d-b854-0b4398551984)


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
**SALIDA: <br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/195a8c7f-7d14-4d9b-9305-11e2719a7b6f)


# ORDEN DE PRESENTACIÓN DE LOS REGISTROS
***EJEMPLO: Listar los apellidos ordenados descendentemente y nombre de los voluntarios que son coordinados por el volunrario 124***
```
SELECT apellido, nombre
FROM voluntario
WHERE id_coordinador = 124
ORDER BY  apellido DESC, nombre;
```
**SALIDA:<br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/6a4f009a-785a-4150-972a-37e69d45f3e9)

***EJEMPLO: Seleccionar los datos de los voluntarios que corresponden a los 10 primeros voluntarios***
```
SELECT *
FROM voluntario
ORDER BY nro_voluntario
LIMIT 10;
```
**SALIDA:<br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/17a69a89-98d4-44a3-a179-2d9dfeab6959)


***EJEMPLO: Seleccionar los datos de los voluntarios a partir del 15to voluntario***
```
SELECT *
FROM voluntario
ORDER BY nro_voluntario
LIMIT ALL
OFFSET 15;
```
**SALIDA:<br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/65581ea7-7263-4aa8-94d5-11364ecfd36f)

## EJERCICIO 5:
1. ¿Cuales son los 10 voluntarios mayores?
```
SELECT nro_voluntario, nombre, apellido
FROM voluntario
ORDER BY fecha_nacimiento ASC
LIMIT 10;
```
**SALIDA: <br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/03859dd8-174e-402e-aac1-df5d112334c1)

2. En orden alfabético quienes son los 5 primeros voluntarios de la institucion 80?
```
SELECT nombre, apellido, fecha_nacimiento, id_institucion
FROM voluntario
WHERE id_institucion =80
ORDER BY apellido, nombre ASC
LIMIT 5;
```
**SALIDA:<br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/72c09cca-b44b-4145-83dc-4586d3627e94)


# FUNCIONES DE GRUPO

>[!IMPORTANT]
> **SUM()** -> sumatoria de la columna especificada <br>
> **AVG()** -> promedio de la columna especificada <br>
> **STDDEV()** -> desvio estándar de la columna especificada<br>
> **MAX()** -> valor máximo de la columna especificada<br>
> **MIN()** -> valor mínimo de la columna especificada<br>
> **COUNT()** -> cantidad de tuplas<br>

***EJEMPLO: Seleccionar el voluntario más joven y el más viejo***
```
SELECT MAX(fecha_nacimiento) AS voluntario_mas_joven,
       MIN(fecha_nacimiento) AS voluntario_mas_viejo
FROM voluntario;
```
**SALIDA:<br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/467cd43d-ea88-4020-a7f2-446c1428e7cb)

***EJEMPLO: Liste el número de ciudades en la tabla de dirección, excluyendo los valores nulos.
```
SELECT COUNT(ciudad) AS cantidad_de_ciudades
FROM direccion;
```
**SALIDA:<br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/1fa8cc77-b42f-4bd5-95e8-d91a6f1f24bd)

```
SELECT AVG(porcentaje) AS porcentaje_promedio
FROM voluntario;
```
**SALIDA: <br>
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/e0b68083-68e5-4005-aa7d-8362685750f4)

# FUNCIONES DE GRUPO Y VALORES NULOS

```
SELECT AVG(COALESCE(porcentaje, 0)) AS porcentaje_promedio
FROM voluntario
```
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/4b2a584f-275c-473b-86ab-b19e6b3aef5b)


## EJEMPLOS DE FUNCIONES DE GRUPO

```
SELECT count(*) AS cantidad_voluntarios
FROM voluntario;
```
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/41fb669c-081f-4699-976d-eea9f663a8ea)

```
SELECT SUM(horas_aportadas)  AS horas_trabajadas
FROM voluntario v
WHERE v.id_coordinador=120;
```
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/635f748d-872d-4892-854d-9d2d69078bc7)

```
SELECT MAX(v.horas_aportadas) AS maximo, 
       MIN(v.horas_aportadas) AS minimo,
       MAX(v.horas_aportadas) -MIN(v.horas_aportadas) AS diferencia
FROM voluntario v
WHERE v.id_coordinador = 120;
```
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/6c89a8ba-fc5a-4896-9afe-f8bf2e5df5a3)

# CREACIÓN DE GRUPOS DE DATOS

```
SELECT v.id_institucion, COUNT(*) AS cantidad_voluntarios
FROM voluntario v
GROUP BY  v.id_institucion;
```
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/3402a9d5-9e03-4237-b271-5c2da50f67f9)

# SINTAXIS DE LA CLÁUSULA GROUP BY

***EJEMPLO: Liste las diferentes instituciones y el máximo de horas aportadas a cada una de ellas***

```
SELECT v.id_institucion, MAX(v.horas_aportadas)
FROM voluntario v
GROUP BY v.id_institucion;
```
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/e400535f-bf4b-4dc6-8d4a-d6442dfb4651)

***EJEPLO: determine los porcentajes promedio de voluntarios por institución***
```
SELECT avg(porcentaje)
FROM voluntario
GROUP BY id_institucion;
```
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/119982e4-b877-4248-b175-c2607490574e)

## EJERCICIO 6
1. ¿Cuántos voluntarios realizan cada tarea?
```
SELECT  count(*) AS cantidad_de_voluntarios, id_tarea
FROM voluntario
GROUP BY id_tarea;
```
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/2fac9ea4-57a8-4ede-95e0-16b51717b88f)

2. ¿Cuál es el promedio de horas aportadas por tarea?
```
SELECT AVG(horas_aportadas) AS promedio_de_horas, id_tarea
FROM voluntario
GROUP BY id_tarea;
```
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/44af151b-cdd6-4456-be45-e75f29d30fc0)

# RESTRINGIR LOS RESULTADOS DE LOS GRUPOS
```
SELECT id_coordinador, COUNT(*) AS cantidad_de_voluntarios
FROM voluntario
GROUP BY id_coordinador
HAVING count(*)>7;
```
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/b59a443f-084b-4745-af2f-afab06587207)

## FUNCIONES DE GRUPO NO VALIDAS

>[!CAUTION]
> * WHERE
> * No se puede utilizar las cláusulas **WHERE**, cuando se utiliza HAVING

```
SELECT id_coordinador, COUNT(*) AS cantidad_de_voluntarios
FROM voluntario
GROUP BY id_coordinador
HAVING count(*)>7;
```
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/2b29a11e-9152-4dda-928d-6d465a5e6f60)

## ***EJERCICIO: 7***
1. ¿Cuales son las tareas que tienen más de 10 voluntarios?
```
SELECT id_tarea, count(*) AS cantidad_de_voluntarios
FROM voluntario
GROUP BY id_tarea
HAVING count(nro_voluntario)> 10
```
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/ae1a5bee-ddf5-4034-bdb0-08c26d42a202)

2. ¿Cuál es el promedio de horas aportadas por tarea, solo de aquellos voluntarios nacidos a partir del año 2000?
```
SELECT id_tarea, AVG(horas_aportadas) AS promedio_horas_aportadas
FROM voluntario
WHERE extract(YEAR FROM fecha_nacimiento) > 1990
group by id_tarea;
```
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/499eef7a-a10c-4856-837b-0bb8a30d1698)
