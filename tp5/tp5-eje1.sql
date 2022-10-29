-- 1.1
SELECT apellido FROM empleados;

-- 1.2
SELECT DISTINCT apellido FROM empleados;

-- 1.3
SELECT column_name FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'empleados';

-- 1.4
SELECT nombre, apellido FROM empleados;

-- 1.5: los departamentos no tienen cuit/cuil ._.

-- 1.6
SELECT CONCAT(nombre, " ", apellido) AS "Nombre y apellido" FROM empleados;

-- 1.7
SELECT UPPER(CONCAT(nombre, " ", apellido)) AS "Nombre y apellido" FROM empleados;

-- 1.8
SELECT LOWER(CONCAT(nombre, " ", apellido)) AS "Nombre y apellido" FROM empleados;

-- 1.9
SELECT nombre, presupuesto FROM departamentos
ORDER BY presupuesto ASC;

-- 1.10
SELECT nombre FROM departamentos
ORDER BY nombre ASC;

-- 1.11
SELECT nombre FROM departamentos
ORDER BY nombre DESC;

-- 1.12
SELECT apellido, nombre FROM empleados
ORDER BY apellido, nombre ASC;

-- 1.13
SELECT nombre, presupuesto FROM departamentos
ORDER BY presupuesto DESC
LIMIT 3;

-- 1.14
SELECT nombre, presupuesto FROM departamentos
ORDER BY presupuesto ASC
LIMIT 3;

-- 1.15
SELECT nombre, presupuesto FROM departamentos
WHERE presupuesto >= 150000;

-- 1.16
SELECT nombre, presupuesto FROM departamentos
WHERE presupuesto >= 100000 AND presupuesto <= 200000;

-- 1.17
SELECT nombre, presupuesto FROM departamentos
WHERE presupuesto < 100000 OR presupuesto > 200000;

-- 1.18
SELECT nombre, presupuesto FROM departamentos
WHERE presupuesto BETWEEN 100000 AND 200000;

-- 1.19
SELECT nombre, presupuesto FROM departamentos
WHERE presupuesto NOT BETWEEN 100000 AND 200000;

-- 1.20
SELECT * FROM empleados
INNER JOIN departamentos ON id_departamento = iddepartamento;

-- 1.21
SELECT * FROM empleados
INNER JOIN departamentos ON id_departamento = iddepartamento
ORDER BY departamentos.nombre, empleados.nombre, apellido ASC;

-- 1.22
SELECT DISTINCT iddepartamento, departamentos.nombre FROM departamentos
INNER JOIN empleados ON id_departamento = iddepartamento;

-- 1.23
SELECT departamentos.nombre FROM departamentos
INNER JOIN empleados ON iddepartamento = id_departamento
WHERE cuil_cuit = "27-38382980-3";

-- 1.24
SELECT departamentos.nombre FROM departamentos
INNER JOIN empleados ON iddepartamento = id_departamento
WHERE empleados.nombre = "Pepe" AND empleados.apellido = "Ruiz";

-- 1.25
SELECT empleados.* FROM empleados
JOIN departamentos ON id_departamento = iddepartamento
WHERE departamentos.nombre = "I+D"
ORDER BY empleados.apellido ASC;

-- 1.26
SELECT empleados.* FROM empleados
JOIN departamentos ON id_departamento = iddepartamento
WHERE departamentos.nombre = "I+D" OR departamentos.nombre = "Sistemas" OR departamentos.nombre = "Contabilidad" 
ORDER BY empleados.apellido ASC;

-- 1.27
SELECT empleados.nombre FROM empleados
JOIN departamentos ON id_departamento = iddepartamento
WHERE departamentos.presupuesto NOT BETWEEN 100000 AND 200000 
ORDER BY empleados.nombre ASC;