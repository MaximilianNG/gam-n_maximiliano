-- 2.1
SELECT * FROM pedidos
ORDER BY fecha DESC;

-- 2.2
SELECT * FROM pedidos
ORDER BY cantidad DESC
LIMIT 2;

-- 2.3
SELECT DISTINCT clientes.id FROM clientes
JOIN pedidos ON clientes.id = id_cliente;

-- 2.4
SELECT * FROM pedidos
WHERE YEAR(fecha) >= 2022 AND cantidad > 500;

-- 2.5
SELECT nombre, apellido FROM vendedores
WHERE comisión BETWEEN 0.05 AND 0.11;

-- 2.6
SELECT MAX(comisión) FROM vendedores;

-- 2.7
SELECT id, nombre, apellido FROM clientes
WHERE cuitcuil IS NOT NULL;

-- 2.8
SELECT nombre FROM clientes
WHERE (nombre LIKE "A%" AND nombre LIKE "%N") OR nombre LIKE "P%"
ORDER BY nombre ASC;

-- 2.9
SELECT nombre FROM clientes
WHERE nombre NOT LIKE "A%"
ORDER BY nombre;

-- 2.10
SELECT nombre FROM vendedores
WHERE nombre LIKE "%el" OR nombre like "%o";

-- 2.11
SELECT DISTINCT clientes.id, nombre, apellido FROM clientes
JOIN pedidos ON clientes.id = id_cliente
ORDER BY nombre;

-- 2.12
SELECT * FROM pedidos
JOIN clientes ON clientes.id = id_cliente
ORDER BY nombre;

-- 2.13
SELECT * FROM pedidos
JOIN vendedores ON vendedores.id = id_vendedor
ORDER BY nombre;

-- 2.14
SELECT * FROM clientes
JOIN pedidos ON clientes.id = id_cliente
JOIN vendedores ON vendedores.id = id_vendedor;

-- 2.15
SELECT clientes.* FROM clientes
JOIN pedidos ON clientes.id = id_cliente
WHERE YEAR(fecha) = 2022 AND cantidad BETWEEN 300 AND 1000;

-- 2.16
SELECT vendedores.nombre, vendedores.apellido FROM vendedores
JOIN pedidos ON vendedores.id = id_vendedor
JOIN clientes ON clientes.id = id_cliente
WHERE clientes.id = 6;

-- 2.17
SELECT DISTINCT clientes.nombre FROM clientes
JOIN pedidos ON clientes.id = id_cliente
JOIN vendedores ON vendedores.id = id_vendedor
WHERE vendedores.id = 1;

-- 2.18
SELECT clientes.*, pedidos.* FROM clientes
LEFT JOIN pedidos ON clientes.id = id_cliente
ORDER BY clientes.apellido, clientes.nombre;

-- 2.19
SELECT vendedores.*, pedidos.* FROM vendedores
LEFT JOIN pedidos ON vendedores.id = id_vendedor
ORDER BY vendedores.apellido, vendedores.nombre;

-- 2.20
SELECT clientes.* FROM clientes
LEFT JOIN pedidos ON clientes.id = id_cliente
WHERE id_cliente IS NULL;

-- 2.21
SELECT vendedores.* FROM vendedores
LEFT JOIN pedidos ON vendedores.id = id_vendedor
WHERE id_vendedor IS NULL;

-- 2.22
SELECT c.apellido, c.nombre, "Cliente" AS Tipo FROM clientes c
LEFT JOIN pedidos ON c.id = id_cliente
WHERE id_cliente IS NULL
UNION
SELECT v.apellido, v.nombre, "Vendedor" AS Tipo FROM vendedores v
LEFT JOIN pedidos ON v.id = id_vendedor
WHERE id_vendedor IS NULL
ORDER BY apellido, nombre;

-- 2.23
SELECT sum(cantidad) FROM pedidos;

-- 2.24
SELECT avg(cantidad) FROM pedidos;

-- 2.25
SELECT count(DISTINCT id_vendedor) FROM pedidos;

-- 2.26
SELECT count(DISTINCT id) FROM clientes;

-- 2.27
SELECT MAX(cantidad) FROM pedidos;

-- 2.28
SELECT min(cantidad) FROM pedidos;

-- 2.29
SELECT ciudad, max(categoría) FROM clientes
GROUP BY ciudad;

-- 2.30
SELECT max(pedidos.cantidad) AS "Mayor pedido", fecha, id_cliente, clientes.nombre, clientes.apellido  FROM pedidos 
JOIN clientes ON clientes.id = pedidos.id_cliente
GROUP BY pedidos.id_cliente, fecha
ORDER BY fecha DESC;

-- 2.31
SELECT max(cantidad), clientes.nombre, clientes.apellido, fecha FROM pedidos
JOIN clientes ON id_cliente = clientes.id
WHERE cantidad > 2000
GROUP BY fecha, clientes.id;

-- 2.32
SELECT vendedores. id, vendedores.nombre, vendedores.apellido, max(cantidad) AS Total FROM pedidos
JOIN vendedores ON id_vendedor = vendedores.id
WHERE fecha = "2021-08-17"
GROUP BY vendedores.id;

-- 2.33
SELECT clientes.id, clientes.nombre, clientes.apellido, COUNT(id_cliente) AS "Total de pedidos realizados" FROM clientes
LEFT JOIN pedidos ON clientes.id = id_cliente
GROUP BY clientes.id;

-- 2.34
SELECT clientes.id, clientes.nombre, clientes.apellido, COUNT(id_cliente) FROM clientes
JOIN pedidos ON clientes.id = id_cliente
WHERE YEAR(fecha) = 2020
GROUP BY id_cliente;

-- 2.35
SELECT max(cantidad), YEAR(fecha) AS Año FROM pedidos
GROUP BY YEAR(fecha)
ORDER BY fecha DESC;

-- 2.36
SELECT count(id) AS "Total de pedidos", YEAR(fecha) AS Año FROM pedidos
GROUP BY YEAR(fecha)
ORDER BY fecha DESC;

-- 2.37
SELECT pedidos.*, clientes.nombre, clientes.apellido FROM pedidos
LEFT JOIN clientes ON id_cliente = clientes.id
WHERE id_cliente = 2;

-- 2.38
SELECT count(pedidos.id) AS "Número de pedidos de Daniel Sáez" FROM pedidos
LEFT JOIN vendedores ON vendedores.id = id_vendedor
WHERE id_vendedor = 1
GROUP BY id_vendedor;

-- 2.39
SELECT clientes.* FROM clientes
LEFT JOIN pedidos ON clientes.id = id_cliente
WHERE YEAR(fecha) = 2020 AND cantidad =
	(SELECT max(cantidad) FROM pedidos WHERE YEAR(fecha) = 2020);

-- 2.40
SELECT fecha, min(cantidad) FROM pedidos
JOIN clientes ON clientes.id = id_cliente
WHERE id_cliente = 8;

-- 2.41
SELECT clientes.* FROM clientes
WHERE clientes.id NOT IN (SELECT pedidos.id_cliente FROM pedidos);

-- 2.42
SELECT vendedores.* FROM vendedores
WHERE vendedores.id NOT IN (SELECT pedidos.id_vendedor FROM pedidos);

-- 2.43
SELECT clientes.* FROM clientes
WHERE NOT EXISTS (SELECT * FROM pedidos WHERE id_cliente = clientes.id);

-- 2.44
SELECT vendedores.* FROM vendedores
WHERE NOT EXISTS (SELECT * FROM pedidos WHERE id_vendedor = vendedores.id);