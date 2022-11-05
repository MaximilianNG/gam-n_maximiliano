/* (1) - Agregar las entidades paises (id, nombre), provincias (id, nombre, idpais) y localidades
(id,nombre, cp,id_provincia). Tener en cuenta que:
● En un país hay muchas provincias.
● En una provincia hay muchas localidades.*/

CREATE TABLE `elsistema`.`países` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE `elsistema`.`provincias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `id_país` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_país_provinciasFK_idx` (`id_país` ASC) VISIBLE,
  CONSTRAINT `id_país_provinciasFK`
    FOREIGN KEY (`id_país`)
    REFERENCES `elsistema`.`países` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE `elsistema`.`localidades` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `cp` VARCHAR(20) NOT NULL,
  `id_provincia` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `cp_UNIQUE` (`cp` ASC) VISIBLE,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE,
  INDEX `id_provincias_localidadesFK_idx` (`id_provincia` ASC) VISIBLE,
  CONSTRAINT `id_provincias_localidadesFK`
    FOREIGN KEY (`id_provincia`)
    REFERENCES `elsistema`.`provincias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

/* (2) - Modificar la tabla empleados usando ALTER TABLE y agregar los campos:
● direccion (varchar)
● id_localidad (pk localidad) –Esta es un relación con la tabla localidades
● email
● telefono
● fecha_ingreso
● tms (timestamp)*/

ALTER TABLE `elsistema`.`empleados` 
ADD COLUMN `dirección` VARCHAR(100) NULL AFTER `estado`,
ADD COLUMN `id_localidad` INT NULL AFTER `dirección`,
ADD COLUMN `email` VARCHAR(45) NULL AFTER `id_localidad`,
ADD COLUMN `teléfono` VARCHAR(45) NULL AFTER `email`,
ADD COLUMN `fecha_ingreso` DATE NULL AFTER `teléfono`,
ADD COLUMN `tms` TIMESTAMP NULL DEFAULT current_timestamp() AFTER `fecha_ingreso`,
ADD INDEX `id_localidad_empleadosFK_idx` (`id_localidad` ASC) VISIBLE;
;
ALTER TABLE `elsistema`.`empleados` 
ADD CONSTRAINT `id_localidad_empleadosFK`
  FOREIGN KEY (`id_localidad`)
  REFERENCES `elsistema`.`localidades` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  /* (3) - Modificar la tabla de departamentos usando ALTER TABLE y agregar los campos:
● gasto (double)
● tms (timestamp). */

ALTER TABLE `elsistema`.`departamentos` 
ADD COLUMN `gasto` DOUBLE NULL AFTER `estado`,
ADD COLUMN `tms` TIMESTAMP NULL DEFAULT current_timestamp() AFTER `gasto`;

/* (4) - Insertar 5 registros en cada tabla de: paises, provincias, localidades, departamentos,
empleados. */

INSERT INTO `elsistema`.`países` (`nombre`) VALUES ('Fiyi');
INSERT INTO `elsistema`.`países` (`nombre`) VALUES ('Nueva Zelanda');
INSERT INTO `elsistema`.`países` (`nombre`) VALUES ('Vanuatu');
INSERT INTO `elsistema`.`países` (`nombre`) VALUES ('Palaos');
INSERT INTO `elsistema`.`países` (`nombre`) VALUES ('Australia');
INSERT INTO `elsistema`.`provincias` (`nombre`, `id_país`) VALUES ('Queensland', '5');
INSERT INTO `elsistema`.`provincias` (`nombre`, `id_país`) VALUES ('Tasmania', '5');
INSERT INTO `elsistema`.`provincias` (`nombre`, `id_país`) VALUES ('Victoria', '5');
INSERT INTO `elsistema`.`provincias` (`nombre`, `id_país`) VALUES ('New South Wales', '5');
INSERT INTO `elsistema`.`provincias` (`nombre`, `id_país`) VALUES ('South Australia', '5');
INSERT INTO `elsistema`.`localidades` (`nombre`, `cp`, `id_provincia`) VALUES ('Brisbane', '4000', '1');
INSERT INTO `elsistema`.`localidades` (`nombre`, `cp`, `id_provincia`) VALUES ('Surfers Paradise', '4217', '1');
INSERT INTO `elsistema`.`localidades` (`nombre`, `cp`, `id_provincia`) VALUES ('Ipswich', '4305', '1');
INSERT INTO `elsistema`.`localidades` (`nombre`, `cp`, `id_provincia`) VALUES ('Gatton', '4343', '1');
INSERT INTO `elsistema`.`localidades` (`nombre`, `cp`, `id_provincia`) VALUES ('Esk', '4312', '1');
INSERT INTO `elsistema`.`departamentos` (`nombre`, `presupuesto`, `estado`, `gasto`) VALUES ('HR', '1000', '1', '0');
INSERT INTO `elsistema`.`departamentos` (`nombre`, `presupuesto`, `estado`, `gasto`) VALUES ('R&D', '1000', '1', '0');
INSERT INTO `elsistema`.`departamentos` (`nombre`, `presupuesto`, `estado`, `gasto`) VALUES ('Seguridad', '1000', '1', '0');
INSERT INTO `elsistema`.`departamentos` (`nombre`, `presupuesto`, `estado`, `gasto`) VALUES ('Ventas', '1000', '1', '0');
INSERT INTO `elsistema`.`departamentos` (`nombre`, `presupuesto`, `estado`, `gasto`) VALUES ('IT', '1000', '1', '0');
INSERT INTO `elsistema`.`empleados` (`cuil_cuit`, `nombre`, `apellido`, `id_departamento`, `estado`, `dirección`, `id_localidad`, `email`, `teléfono`, `fecha_ingreso`) VALUES ('20302357484', 'Charlotte', 'Jensen', '1', '1', 'Main Av. 500', '1', 'charjen@gmail.com', '3256147589', '2022-10-20');
INSERT INTO `elsistema`.`empleados` (`cuil_cuit`, `nombre`, `apellido`, `id_departamento`, `estado`, `dirección`, `id_localidad`, `email`, `teléfono`, `fecha_ingreso`) VALUES ('20305697454', 'Ava', 'Smith', '2', '1', 'Main Av. 600', '2', 'avsmeemee@gmail.com', '3458741265', '2022-10-21');
INSERT INTO `elsistema`.`empleados` (`cuil_cuit`, `nombre`, `apellido`, `id_departamento`, `estado`, `dirección`, `id_localidad`, `email`, `teléfono`, `fecha_ingreso`) VALUES ('20354128964', 'Isla', 'Simpson', '3', '1', 'Secondary Av. 300', '3', 'islapoe@gmail.com', '3589214963', '2022-10-22');
INSERT INTO `elsistema`.`empleados` (`cuil_cuit`, `nombre`, `apellido`, `id_departamento`, `estado`, `dirección`, `id_localidad`, `email`, `teléfono`, `fecha_ingreso`) VALUES ('20418513694', 'Olivia', 'Metzger', '4', '1', 'Main Av. 1230', '4', 'haveyoumetmetzger@gmail.com', '3652149273', '2022-10-23');
INSERT INTO `elsistema`.`empleados` (`cuil_cuit`, `nombre`, `apellido`, `id_departamento`, `estado`, `dirección`, `id_localidad`, `email`, `teléfono`, `fecha_ingreso`) VALUES ('20295134784', 'Mia', 'Hansen', '5', '1', 'Tertiary Av. 1515', '5', 'itsmianotyoua@gmail.com', '3152847523', '2022-10-24');

/* (5) - Modificar el nombre de la tabla “pedidos” por “movimientos”. RENAME TABLE */

ALTER TABLE `elsistema`.`pedidos` 
RENAME TO  `elsistema`.`movimientos` ;

/*  (6) - Agregar las entidades:
● Productos (id, nombre, descripcion, id_marca fk, stock, precio, estado, tms)
● Marcas (id, nombre, descripción, imagen, id_proveedor, estado, tms)
● Proveedores (id, razon_social, nombre, apellido, naturaleza (fisica o juridica),
cuit,id_localidad fk, estado,tms)
● Cajas (id,horainicio(datatime),horacierre(datatime), estado, tms)
Notas: Muchos productos tienen una sola marca, o una marca tiene uno o muchos productos.
Un proveedor está en una localidad. */

CREATE TABLE `elsistema`.`cajas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `hora_inicio` DATETIME NULL,
  `hora_cierre` DATETIME NULL,
  `estado` TINYINT NOT NULL DEFAULT 0,
  `tms` TIMESTAMP NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE `elsistema`.`proveedores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `razón_social` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `naturaleza` TINYINT NOT NULL DEFAULT 0 COMMENT '0 - física\n1 - jurídica',
  `cuit` VARCHAR(45) NOT NULL,
  `id_localidad` INT NOT NULL,
  `estado` TINYINT NOT NULL DEFAULT 0,
  `tms` TIMESTAMP NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  INDEX `id_localidad_proveedorFK_idx` (`id_localidad` ASC) VISIBLE,
  CONSTRAINT `id_localidad_proveedorFK`
    FOREIGN KEY (`id_localidad`)
    REFERENCES `elsistema`.`localidades` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE `elsistema`.`marcas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripción` VARCHAR(300) NULL,
  `imagen` BLOB NULL,
  `id_proveedor` INT NOT NULL,
  `estado` TINYINT NOT NULL DEFAULT 0,
  `tms` TIMESTAMP NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  INDEX `id_proveedor_marcasFK_idx` (`id_proveedor` ASC) VISIBLE,
  CONSTRAINT `id_proveedor_marcasFK`
    FOREIGN KEY (`id_proveedor`)
    REFERENCES `elsistema`.`proveedores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE `elsistema`.`productos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripción` VARCHAR(300) NULL,
  `id_marca` INT NOT NULL,
  `stock` INT NULL,
  `precio` DOUBLE NULL,
  `estado` TINYINT NOT NULL DEFAULT 0,
  `tms` TIMESTAMP NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  INDEX `id_marca_productosFK_idx` (`id_marca` ASC) VISIBLE,
  CONSTRAINT `id_marca_productosFK`
    FOREIGN KEY (`id_marca`)
    REFERENCES `elsistema`.`marcas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

/* (7) - Insertar 5 registros en cada tabla del punto 6. Tener en cuenta que el script debe ejecutarse
secuencialmente y no fallar. */

INSERT INTO `elsistema`.`cajas` (`hora_inicio`, `hora_cierre`, `estado`) VALUES ('2022-10-29 07:01:20', '2022-10-29 08:20:30', '1');
INSERT INTO `elsistema`.`cajas` (`hora_inicio`, `hora_cierre`, `estado`) VALUES ('2022-10-29 08:15:03', '2022-10-29 09:02:26', '1');
INSERT INTO `elsistema`.`cajas` (`hora_inicio`, `hora_cierre`, `estado`) VALUES ('2022-10-29 09:02:26', '2022-10-29 11:23:45', '1');
INSERT INTO `elsistema`.`cajas` (`hora_inicio`, `hora_cierre`, `estado`) VALUES ('2022-10-29 11:23:45', '2022-10-29 12:10:10', '1');
INSERT INTO `elsistema`.`cajas` (`hora_inicio`, `hora_cierre`, `estado`) VALUES ('2022-10-29 12:10:10', '2022-10-29 12:25:16', '1');
INSERT INTO `elsistema`.`proveedores` (`razón_social`, `nombre`, `apellido`, `naturaleza`, `cuit`, `id_localidad`, `estado`) VALUES ('Le Purveyeur', 'Matías', 'Romero', '0', '20362896454', '1', '1');
INSERT INTO `elsistema`.`proveedores` (`razón_social`, `nombre`, `apellido`, `naturaleza`, `cuit`, `id_localidad`, `estado`) VALUES ('He Who Provides', 'Matías', 'Odzomek', '0', '20312568454', '1', '1');
INSERT INTO `elsistema`.`proveedores` (`razón_social`, `nombre`, `apellido`, `naturaleza`, `cuit`, `id_localidad`, `estado`) VALUES ('Dios los cría', 'Matías', 'Matioli', '0', '20389657824', '1', '1');
INSERT INTO `elsistema`.`proveedores` (`razón_social`, `nombre`, `apellido`, `naturaleza`, `cuit`, `id_localidad`, `estado`) VALUES ('Y el Viento', 'Matías', 'Romero Spinelli', '0', '20371106724', '1', '1');
INSERT INTO `elsistema`.`proveedores` (`razón_social`, `nombre`, `apellido`, `naturaleza`, `cuit`, `id_localidad`, `estado`) VALUES ('Los Amontona', 'Matías ', 'Laszlo', '0', '20312546664', '1', '1');
INSERT INTO `elsistema`.`marcas` (`nombre`, `descripción`, `id_proveedor`, `estado`) VALUES ('Auss', 'Edible cookies with the shape of Australia', '1', '1');
INSERT INTO `elsistema`.`marcas` (`nombre`, `descripción`, `id_proveedor`, `estado`) VALUES ('Cepeetah', 'Fruit juices.', '2', '1');
INSERT INTO `elsistema`.`marcas` (`nombre`, `descripción`, `id_proveedor`, `estado`) VALUES ('Pathfinder', 'Global positioning service provider.', '3', '1');
INSERT INTO `elsistema`.`marcas` (`nombre`, `descripción`, `id_proveedor`, `estado`) VALUES ('Dungeons and Dragons', 'Fantasy themed parties service provider', '4', '1');
INSERT INTO `elsistema`.`marcas` (`nombre`, `descripción`, `id_proveedor`, `estado`) VALUES ('Anima', 'Future-reading and assorted mysticisms.', '5', '1');
INSERT INTO `elsistema`.`productos` (`nombre`, `descripción`, `id_marca`, `stock`, `precio`, `estado`) VALUES ('Queensie', 'Cookie with the shape of the state of Queensland', '1', '100', '35', '1');
INSERT INTO `elsistema`.`productos` (`nombre`, `descripción`, `id_marca`, `stock`, `precio`, `estado`) VALUES ('O-Jay', 'Orange Juice', '2', '120', '40', '1');
INSERT INTO `elsistema`.`productos` (`nombre`, `descripción`, `id_marca`, `stock`, `precio`, `estado`) VALUES ('Know your place', 'Standard 24h GPS service', '3', '50', '55', '1');
INSERT INTO `elsistema`.`productos` (`nombre`, `descripción`, `id_marca`, `stock`, `precio`, `estado`) VALUES ('Final Boss Birthday', 'Premium birthday decoration service', '4', '20', '150', '1');
INSERT INTO `elsistema`.`productos` (`nombre`, `descripción`, `id_marca`, `stock`, `precio`, `estado`) VALUES ('Date of Death', 'Literally tells you when you\'ll die', '5', '15', '2000', '1');

/* (8) - Listar el nombre, presupuesto, gastos y diferencia(presupuesto-gasto) de todos los
departamentos con estado activo o 1. */

SELECT nombre, presupuesto, gasto, SUM(presupuesto-gasto) AS Diferencia FROM departamentos
WHERE estado = 1
GROUP BY nombre;

/* (9) -  Listar todas todas las localidades agrupadas por pais. En la vista se deberia ver el nombre
del pais y el nombre de la localidad */

SELECT países.nombre, localidades.nombre FROM localidades, países
GROUP BY localidades.nombre;

/* (10) - Modificar (UPADTE):
● el telefono de un empleado cuando el id es igual a uno que hayan declarado.
● el fecha_ingreso y la localidad de otro empleado. */

UPDATE `elsistema`.`empleados` SET `teléfono` = '3256478596' WHERE (`idemplaedo` = '1');
UPDATE `elsistema`.`empleados` SET `id_localidad` = '1', `fecha_ingreso` = '2022-10-19' WHERE (`idemplaedo` = '2');

/* (11) - Insertar 5 vendedores. */

INSERT INTO `elsistema`.`vendedores` (`nombre`, `apellido`, `cuitcuil`, `comisión`) VALUES ('Oliver', 'Jones', '20357815524', '0.15');
INSERT INTO `elsistema`.`vendedores` (`nombre`, `apellido`, `cuitcuil`, `comisión`) VALUES ('Noah', 'Kelly', '20308874494', '0.12');
INSERT INTO `elsistema`.`vendedores` (`nombre`, `apellido`, `cuitcuil`, `comisión`) VALUES ('Leo', 'Martin', '20299996634', '0.13');
INSERT INTO `elsistema`.`vendedores` (`nombre`, `apellido`, `cuitcuil`, `comisión`) VALUES ('Thomas', 'Brown', '201234564', '0.16');
INSERT INTO `elsistema`.`vendedores` (`nombre`, `apellido`, `cuitcuil`, `comisión`) VALUES ('Henry', 'Ciji', '20415125234', '0.18');

/* (12) - Modificar la tabla movimientos y agregar los campos: id_producto fk, estado,
tms(timestamp), tipo_movimiento (ingreso, egreso, pedido) */

ALTER TABLE `elsistema`.`movimientos` 
ADD COLUMN `id_producto` INT NOT NULL AFTER `id_vendedor`,
ADD COLUMN `estado` TINYINT NOT NULL DEFAULT 0 AFTER `id_producto`,
ADD COLUMN `tms` TIMESTAMP NULL DEFAULT current_timestamp() AFTER `estado`,
ADD COLUMN `tipo_movimiento` TINYINT NOT NULL COMMENT '0 - ingreso\n1 - egreso\n2 - pedido' AFTER `tms`,
ADD INDEX `id_producto_movimientoFK_idx` (`id_producto` ASC) VISIBLE;
;
ALTER TABLE `elsistema`.`movimientos` 
ADD CONSTRAINT `id_producto_movimientoFK`
  FOREIGN KEY (`id_producto`)
  REFERENCES `elsistema`.`productos` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
/* (13) - Insertar 5 movimientos distintos. */

INSERT INTO `elsistema`.`clientes` (`nombre`, `apellido`, `cuitcuil`) VALUES ('Maximiliano', 'Gamón', '20371106744');
INSERT INTO `elsistema`.`movimientos` (`cantidad`, `fecha`, `id_cliente`, `id_vendedor`, `id_producto`, `estado`, `tipo_movimiento`) VALUES ('5', '2022-10-28', '1', '1', '1', '1', '0');
INSERT INTO `elsistema`.`movimientos` (`cantidad`, `fecha`, `id_cliente`, `id_vendedor`, `id_producto`, `estado`, `tipo_movimiento`) VALUES ('7', '2022-10-27', '1', '2', '2', '1', '0');
INSERT INTO `elsistema`.`movimientos` (`cantidad`, `fecha`, `id_cliente`, `id_vendedor`, `id_producto`, `estado`, `tipo_movimiento`) VALUES ('4', '2022-10-25', '1', '2', '1', '1', '0');
INSERT INTO `elsistema`.`movimientos` (`cantidad`, `fecha`, `id_cliente`, `id_vendedor`, `id_producto`, `estado`, `tipo_movimiento`) VALUES ('15', '2022-10-19', '1', '4', '4', '1', '0');
INSERT INTO `elsistema`.`movimientos` (`cantidad`, `fecha`, `id_cliente`, `id_vendedor`, `id_producto`, `estado`, `tipo_movimiento`) VALUES ('2', '2022-09-29', '1', '5', '3', '1', '0');

/* (14) - Borrar lógicamente (UPDATE de la columna estado):
● 2 movimientos que fueron cargados mal
● un pais que tenga al menos 3 localidades */

UPDATE `elsistema`.`movimientos` SET `estado` = '0' WHERE (`id` = '6');
UPDATE `elsistema`.`movimientos` SET `estado` = '0' WHERE (`id` = '7');
INSERT INTO `elsistema`.`países` (`nombre`) VALUES ('Argentina');
INSERT INTO `elsistema`.`provincias` (`nombre`, `id_país`) VALUES ('Misiones', '6');
INSERT INTO `elsistema`.`localidades` (`nombre`, `cp`, `id_provincia`) VALUES ('Wanda', 'N3376', '6');
INSERT INTO `elsistema`.`localidades` (`nombre`, `cp`, `id_provincia`) VALUES ('Pindapoy', 'N3306', '6');
INSERT INTO `elsistema`.`localidades` (`nombre`, `cp`, `id_provincia`) VALUES ('Colonia Aparecida', 'N3307', '6');
ALTER TABLE `elsistema`.`provincias` 
DROP FOREIGN KEY `id_país_provinciasFK`;
ALTER TABLE `elsistema`.`provincias` 
ADD CONSTRAINT `id_país_provinciasFK`
  FOREIGN KEY (`id_país`)
  REFERENCES `elsistema`.`países` (`id`)
  ON DELETE CASCADE;
ALTER TABLE `elsistema`.`localidades` 
DROP FOREIGN KEY `id_provincias_localidadesFK`;
ALTER TABLE `elsistema`.`localidades` 
ADD CONSTRAINT `id_provincias_localidadesFK`
  FOREIGN KEY (`id_provincia`)
  REFERENCES `elsistema`.`provincias` (`id`)
  ON DELETE CASCADE;
DELETE FROM `elsistema`.`países` WHERE (`id` = '6');

/* (15) - Modificar el campo stock de la tabla productos teniendo en cuenta la cantidad de la tabla
de movimientos. Sumar el stock si es un ingreso, restar si es un egreso. Esto hacerlo de
manera manual en base los 5 movimientos insertados en el punto 13. Es decir deben haber
5 updates de la tabla producto. */

UPDATE `elsistema`.`productos` SET `stock` = '109' WHERE (`id` = '1');
-- Dos movimientos fueron sobre el id 1, por eso hay solo 4.
UPDATE `elsistema`.`productos` SET `stock` = '127' WHERE (`id` = '2');
UPDATE `elsistema`.`productos` SET `stock` = '35' WHERE (`id` = '4');
UPDATE `elsistema`.`productos` SET `stock` = '17' WHERE (`id` = '5');

/* (16) - Cear la tabla parametros (id, tms,cosas(json), id_usuario) */

CREATE TABLE `elsistema`.`parámetros` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tms` TIMESTAMP NULL DEFAULT current_timestamp(),
  `cosas` JSON NULL,
  `id_usuario` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

/* (17) - Insertar en la tabla parametros teniendo en cuenta la columna cosas:
● {"idDeLaCosa": 101, "permisos": "PUT, GET"}
● {"vistasPermitidas":"menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente",
“grupo": "ventas"}
● {"zonaHoraria": "America/Argentina/BuenosAires"}
● {"fechaInicioActividades": 01/01/2019, "mesAperturaCaja": "Enero", "mesCierreCaja":
"Diciembre"}
● {"balancesAniosAnteriores": {"2019": {"ingreso": "7374901.93","egreso":
"3732538,75"},"2020":{"ingreso": "27442665,12","egreso": "8522331,82"},"2021": {"ingreso":
"31634912,57","egreso": "9757142,66"}}}
Nota: Rellenar a criterio los campos id, tms,id_usuario */

INSERT INTO `elsistema`.`parámetros` (`cosas`) VALUES ('{\"idDeLaCosa\": 101, \"permisos\": \"PUT, GET\"}');
INSERT INTO `elsistema`.`parámetros` (`cosas`) VALUES ('{"vistasPermitidas":"menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente",
"grupo": "ventas"}
');
INSERT INTO `elsistema`.`parámetros` (`cosas`) VALUES (' {\"zonaHoraria\": \"America/Argentina/BuenosAires\"}');
INSERT INTO `elsistema`.`parámetros` (`cosas`) VALUES ('{\"fechaInicioActividades\": \"01/01/2019\", \"mesAperturaCaja\": \"Enero\", \"mesCierreCaja\":\"Diciembre\"}');
INSERT INTO `elsistema`.`parámetros` (`cosas`) VALUES ('{\"balancesAniosAnteriores\": \n  {\"2019\": \n    {\"ingreso\": \"7374901.93\",\"egreso\":\"3732538,75\"},\n    \"2020\":{\"ingreso\": \"27442665,12\",\"egreso\":\"8522331,82\"},\n    \"2021\": {\"ingreso\":\"31634912,57\",\"egreso\": \"9757142,66\"}}}');

