CREATE SCHEMA `tp4-ej2` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE `tp4-ej2`.`empleado` (
  `ID_Empleado` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `DNI` VARCHAR(30) NOT NULL,
  `Email` VARCHAR(45) NULL,
  `Fecha_Alta` DATETIME NOT NULL,
  `Teléfono` INT NULL,
  `Localidad` INT NOT NULL,
  PRIMARY KEY (`ID_Empleado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE `tp4-ej2`.`localidad` (
  `Cod_Localidad` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Código_Postal` INT NOT NULL,
  `Provincia` INT NOT NULL,
  PRIMARY KEY (`Cod_Localidad`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

ALTER TABLE `tp4-ej2`.`empleado` 
ADD INDEX `FK_empleado_localidad_idx` (`Localidad` ASC) VISIBLE;
;
ALTER TABLE `tp4-ej2`.`empleado` 
ADD CONSTRAINT `FK_empleado_localidad`
  FOREIGN KEY (`Localidad`)
  REFERENCES `tp4-ej2`.`localidad` (`Cod_Localidad`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

CREATE TABLE `tp4-ej2`.`provincia` (
  `ID_Provincia` INT NOT NULL,
  `Nombre_Provincia` VARCHAR(45) NOT NULL,
  `País` INT NOT NULL,
  PRIMARY KEY (`ID_Provincia`));

ALTER TABLE `tp4-ej2`.`provincia` 
CHANGE COLUMN `ID_Provincia` `ID_Provincia` INT NOT NULL AUTO_INCREMENT ;

ALTER TABLE `tp4-ej2`.`localidad` 
ADD INDEX `FK_localidad_provincia_idx` (`Provincia` ASC) VISIBLE;
;
ALTER TABLE `tp4-ej2`.`localidad` 
ADD CONSTRAINT `FK_localidad_provincia`
  FOREIGN KEY (`Provincia`)
  REFERENCES `tp4-ej2`.`provincia` (`ID_Provincia`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

CREATE TABLE `tp4-ej2`.`país` (
  `ID_País` INT NOT NULL,
  `Nombre_País` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_País`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

ALTER TABLE `tp4-ej2`.`país` 
CHANGE COLUMN `ID_País` `ID_País` INT NOT NULL AUTO_INCREMENT ;

ALTER TABLE `tp4-ej2`.`provincia` 
ADD INDEX `FK_provincia_país_idx` (`País` ASC) VISIBLE;
;
ALTER TABLE `tp4-ej2`.`provincia` 
ADD CONSTRAINT `FK_provincia_país`
  FOREIGN KEY (`País`)
  REFERENCES `tp4-ej2`.`país` (`ID_País`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

INSERT INTO `tp4-ej2`.`país` (`Nombre_País`) VALUES ('Belice');
INSERT INTO `tp4-ej2`.`país` (`Nombre_País`) VALUES ('Rwanda');
INSERT INTO `tp4-ej2`.`país` (`Nombre_País`) VALUES ('Armenia');

INSERT INTO `tp4-ej2`.`provincia` (`Nombre_Provincia`, `País`) VALUES ('Cayo', '1');
INSERT INTO `tp4-ej2`.`provincia` (`Nombre_Provincia`, `País`) VALUES ('Orange Walk', '1');
INSERT INTO `tp4-ej2`.`provincia` (`Nombre_Provincia`, `País`) VALUES ('Kigali', '2');
INSERT INTO `tp4-ej2`.`provincia` (`Nombre_Provincia`, `País`) VALUES ('Amajyepfo', '2');
INSERT INTO `tp4-ej2`.`provincia` (`Nombre_Provincia`, `País`) VALUES ('Tavush ', '3');
INSERT INTO `tp4-ej2`.`provincia` (`Nombre_Provincia`, `País`) VALUES ('Vayots Dzor', '3');

INSERT INTO `tp4-ej2`.`localidad` (`Nombre`, `Código_Postal`, `Provincia`) VALUES ('Yeghegnadzor', '3601', '6');
INSERT INTO `tp4-ej2`.`localidad` (`Nombre`, `Código_Postal`, `Provincia`) VALUES ('Areni', '3604', '6');
INSERT INTO `tp4-ej2`.`localidad` (`Nombre`, `Código_Postal`, `Provincia`) VALUES ('Artabuynk ', '3605', '6');

INSERT INTO `tp4-ej2`.`empleado` (`Nombre`, `DNI`, `Fecha_Alta`, `Localidad`) VALUES ('Anahit', '2153620', '2022-10-21', '1');
INSERT INTO `tp4-ej2`.`empleado` (`Nombre`, `DNI`, `Fecha_Alta`, `Localidad`) VALUES ('Nane', '3145888', '2022-10-20', '3');
INSERT INTO `tp4-ej2`.`empleado` (`Nombre`, `DNI`, `Fecha_Alta`, `Localidad`) VALUES ('Milena', '1442335', '2022-10-20', '2');

