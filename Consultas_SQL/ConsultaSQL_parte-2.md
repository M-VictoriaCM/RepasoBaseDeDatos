# Consultas de más de una Tabla

📍***Seleccionar el nombre y apellido de los voluntarios del
estado (provincia) de Texas***
```
SELECT nombre, apellido
FROM voluntario v, institucion i, direccion d
WHERE v.id_institucion = i.id_institucion
AND i.id_direccion = d.id_direccion
AND d.provincia = 'Texas';
```
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/30064fdf-f0c2-4aec-ac58-06570dce578a)

# Consultas anidadas(Subconsulta)
📍***Seleccionar el nombre de la/s instituciones del estado(provincia) de Texas***
```
SELECT i.nombre_institucion
FROM institucion i
WHERE i.id_direccion = (
    SELECT d.id_direccion
    FROM direccion d
    WHERE d.provincia = 'Texas');
```
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/753dd630-b3dd-4cb4-abf9-884c2ed17c8e)

# Subconsultas de una Sola Fila

📍***Se desea seleccionar los voluntarios que realizan la misma tarea que el volutario 141 y que aportan más horas que el voluntario 143***
```
SELECT nombre, id_tarea, horas_aportadas
FROM voluntario
WHERE id_tarea = (
    SELECT id_tarea
    FROM voluntario
    WHERE nro_voluntario =141) AND horas_aportadas > (
        SELECT horas_aportadas
        FROM voluntario
        WHERE nro_voluntario= 143
    );
```
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/52f1e27c-cb7f-4089-9a81-b9fd7001ed0e)

 # CONSULTAS ANIDADAS

 📍***Seleccionar todos los voluntarios que aportan la mínima
cantidad de horas***
```
SELECT nombre, apellido
FROM voluntario
WHERE horas_aportadas = (
    SELECT MIN(horas_aportadas)
    FROM voluntario
    );
```
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/61ec35f6-846e-4c6c-a926-f32abcb10774)

## CONSULTAS ANIDADAS - HAVING
📍***Instituciones donde la mínima cantidad de horas
que aportan sus voluntarios es mayor que la mínima
cantidad de horas que aportan los de la institución 40.***
```
SELECT id_institucion, MIN(horas_aportadas)
FROM voluntario
GROUP BY id_institucion
HAVING MIN(horas_aportadas) >(
    SELECT MIN(horas_aportadas)
    FROM voluntario
    WHERE id_institucion = 40
    );
```
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/aa74d3dc-21cd-4d01-87b1-5461cc6d272b)

📍*** EJERCICIO: Cuales son las tareas cuyo promedio de horas aportadas por tarea de los voluntarios nacidos a partir del año 1995
es superior al promedio general de dicho grupo de voluntarios***
```
SELECT id_tarea, AVG(horas_aportadas) AS porcentaje
FROM voluntario
GROUP BY id_tarea
HAVING AVG(horas_aportadas) >(
    SELECT AVG(horas_aportadas)
    FROM voluntario
    WHERE EXTRACT(YEAR FROM fecha_nacimiento) >=1995
    );
```
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/42b2d7cb-bf55-42fc-9773-d9a85ae250dc)

# SUBCONSULTA CORRELACIONADA
📍***Buscar todos los voluntarios que aportan más horas que el promedio de horas aportadas por los voluntarios de la institución a la que pertenecen.***
```
SELECT v1.apellido, v1.horas_aportadas, v1.id_institucion
FROM voluntario v1
WHERE horas_aportadas >(
    SELECT AVG(horas_aportadas)
    FROM voluntario v2
    WHERE v2.id_institucion= v1.id_institucion
    )
```
![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/dcdc5455-b6e9-40f2-a4ff-71caf4c8afdd)

📍*** ***
```
```
