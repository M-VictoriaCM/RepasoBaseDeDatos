# Modelo/Diagrama de Entidades y Relaciones Extendido (MERExt/DERExt)
>[!TIP]
>Las principales ventajas de los modelos ER son que:
>* Es fácil de aprender, fácil de usar, y muy fácil de transformar a especificaciones de tablas SQL
  
## **Ejercicio 1**
Se quiere registrar información para un sistema de clientes con las compras de productos que estos realizan. Construya el DERE que mejor se ajuste a lo siguiente:
1. Se necesita guardar los datos de los clientes, los mismos son, un identificador, nombre y apellido, fecha de nacimiento, dirección y su teléfono
2. Opcionalmente un cliente puede tener otro número de teléfono y varios números de teléfono celular.
3. Los datos de las facturas que se registran son: su tipo y número (que identifica a cada factura), su fecha, el cliente y el importe total. Además, se necesita guardar los productos que compondrán dicha factura.
4. De los productos se conoce su código, la descripción, el precio de costo y el precio de venta.
5. ¿Cómo asociaría los clientes con las facturas cosa de no tener que guardar el nombre de la persona? (recuerde que una persona puede tener muchas facturas)
  a. Analice si su modelo es capaz de respetar el precio de venta de cada producto cuando se modifica el precio de un producto.
  b. Proponga una solución para el DERE al problema del punto anterior, en el caso de que haya alguna solución.
 
 ![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/f8841179-9986-480f-a257-aedcda8924b8)

## **Ejercicio 2**
Se quiere registrar información correspondiente a un depósito, sus departamentos, sus empleados, sus productos y los fabricantes de estos productos. Construya el DERE que mejor se ajuste a lo siguiente:
1. Cada empleado está identificado por un número de empleado, además se debe registrar su nombre, apellido y dirección como calle, puerta, piso y ciudad; adicionalmente se debe saber a qué departamento pertenece.
2. Cada departamento está identificado por su nombre y se sabe que empleados trabajan en él, quién es el empleado jefe del departamento y que productos vende.
3. Cada producto está representado por su nombre, fabricante, precio. Cada producto es identificado tanto por el número de producto asignado por el fabricante como por el número de producto asignado por el almacén
4. Cada fabricante está identificado por un identificador y además se registra su nombre, y se conoce su dirección, productos que suministra al almacén y precios de estos productos.
5. En cada departamento puede haber muchos empleados y cada empleado puede ser jefe de un solo departamento.

![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/6714bfc4-2903-4b04-a895-59c763d72560)

## **Ejercicio 3**
Se desea informatizar la gestión de una empresa de transportes que reparte paquetes por toda la provincia
1.	Los encargados de llevar los paquetes son los camioneros, de los que se quiere guardar el DNI, nombre, teléfono, dirección, salario y ciudad en la que vive.
2.	De los paquetes transportados interesa conocer el código de paquete, descripción, destinatario y dirección del destinatario
3.	Un camionero distribuye muchos paquetes, y un paquete sólo puede ser distribuido por un camionero.
4.	De las ciudades a las que llegan los paquetes interesa guardar el código de ciudad y el nombre. Un paquete sólo puede llegar a una ciudad. Sin embargo, a una ciudad pueden llegar varios paquetes.
5.	De los camiones, interesa conocer la matrícula, modelo, tipo y potencia.
6.	Un camionero puede conducir diferentes camiones en fechas diferentes, y un camión puede ser conducido por varios camioneros.

![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/3e14f6a9-0716-45fc-b899-f8a65bfadc1b)

## **Ejercicio 4**
Se necesita realizar la base de datos de una organización que lleve el control de niños refugiados en distintas instituciones a nivel mundial, por ejemplo, como la base de datos de UNICEF.
La organización necesita tener la información de los niños con sus datos personales, filiatorios (nombre y apellido de los padres), fecha y lugar de nacimiento, parientes, datos sanitarios (enfermedades actuales y pasadas), etc. 
También se desea conocer en qué institución está cada niño, adicionalmente se conoce el país, región y ciudad de la institución.
Se necesita saber si los niños requieren cuidados especiales y quiénes son sus contactos o cuidadores dentro de la institución en la que están.
Por último, se necesita saber la fecha en la que volvió con la familia (si es que lo hizo).

![image](https://github.com/M-VictoriaCM/RepasoBaseDeDatos/assets/70769530/275bea3d-347c-4ed5-83d2-ea1125e719f8)



