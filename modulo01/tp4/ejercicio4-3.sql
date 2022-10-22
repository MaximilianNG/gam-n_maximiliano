CREATE SCHEMA `tp4-ej3` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE `tp4-ej3`.`automóvil` (
  `ID_Automóvil` INT NOT NULL AUTO_INCREMENT,
  `Matrícula` VARCHAR(45) NOT NULL,
  `Modelo` VARCHAR(45) NOT NULL,
  `Precio_Por_Hora` INT NOT NULL,
  `Color` VARCHAR(45) NOT NULL,
  `Marca` VARCHAR(45) NOT NULL,
  `Litros_En_Depósito` INT NULL,
  PRIMARY KEY (`ID_Automóvil`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE `tp4-ej3`.`reserva` (
  `ID_Reserva` INT NOT NULL AUTO_INCREMENT,
  `Precio` INT NOT NULL,
  `Fecha_Inicio` DATETIME NOT NULL,
  `Fecha_Fin` DATETIME NOT NULL,
  `Cliente` INT NOT NULL,
  PRIMARY KEY (`ID_Reserva`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

ALTER TABLE `tp4-ej3`.`automóvil` 
ADD COLUMN `Reserva` INT NULL AFTER `Litros_En_Depósito`,
ADD INDEX `FK_Automóvil_Reserva_idx` (`Reserva` ASC) VISIBLE;
;
ALTER TABLE `tp4-ej3`.`automóvil` 
ADD CONSTRAINT `FK_Automóvil_Reserva`
  FOREIGN KEY (`Reserva`)
  REFERENCES `tp4-ej3`.`reserva` (`ID_Reserva`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

CREATE TABLE `tp4-ej3`.`cliente` (
  `ID_Cliente` INT NOT NULL AUTO_INCREMENT,
  `DNI` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Dirección` VARCHAR(45) NOT NULL,
  `Teléfono` VARCHAR(45) NULL,
  `ID_Aval` INT NULL,
  PRIMARY KEY (`ID_Cliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

ALTER TABLE `tp4-ej3`.`cliente` 
ADD INDEX `FK_cliente_avalCliente_idx` (`ID_Aval` ASC) VISIBLE;
;
ALTER TABLE `tp4-ej3`.`cliente` 
ADD CONSTRAINT `FK_cliente_avalCliente`
  FOREIGN KEY (`ID_Aval`)
  REFERENCES `tp4-ej3`.`cliente` (`ID_Cliente`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `tp4-ej3`.`reserva` 
ADD INDEX `FK_reserva_cliente_idx` (`Cliente` ASC) VISIBLE;
;
ALTER TABLE `tp4-ej3`.`reserva` 
ADD CONSTRAINT `FK_reserva_cliente`
  FOREIGN KEY (`Cliente`)
  REFERENCES `tp4-ej3`.`cliente` (`ID_Cliente`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

INSERT INTO `tp4-ej3`.`automóvil` (`Matrícula`, `Modelo`, `Precio_Por_Hora`, `Color`, `Marca`, `Litros_En_Depósito`) VALUES ('SPZ257', 'Corolla', '100', 'Azul', 'Toyota', '9');
INSERT INTO `tp4-ej3`.`automóvil` (`Matrícula`, `Modelo`, `Precio_Por_Hora`, `Color`, `Marca`, `Litros_En_Depósito`) VALUES ('KIK444', 'Silvia', '150', 'Verde', 'Silvia', '10');
INSERT INTO `tp4-ej3`.`automóvil` (`Matrícula`, `Modelo`, `Precio_Por_Hora`, `Color`, `Marca`, `Litros_En_Depósito`) VALUES ('ASF741', 'Trueno', '120', 'Blanco', 'Toyota', '2');

INSERT INTO `tp4-ej3`.`cliente` (`DNI`, `Nombre`, `Dirección`, `Teléfono`) VALUES ('37110672', 'Maximiliano', 'San Martín 1485', '3764291656');
INSERT INTO `tp4-ej3`.`cliente` (`DNI`, `Nombre`, `Dirección`, `Teléfono`, `ID_Aval`) VALUES ('32514745', 'Susana', 'Mitre 1120', '3764587410', '1');
INSERT INTO `tp4-ej3`.`cliente` (`DNI`, `Nombre`, `Dirección`, `Teléfono`, `ID_Aval`) VALUES ('45263985', 'Claudia', 'Alberdi 444', '3764102030', '1');

INSERT INTO `tp4-ej3`.`reserva` (`Precio`, `Fecha_Inicio`, `Fecha_Fin`, `Cliente`) VALUES ('4800', '2022-10-10', '2022-10-12', '1');
INSERT INTO `tp4-ej3`.`reserva` (`Precio`, `Fecha_Inicio`, `Fecha_Fin`, `Cliente`) VALUES ('3600', '2022-10-08', '2022-10-09', '2');
INSERT INTO `tp4-ej3`.`reserva` (`Precio`, `Fecha_Inicio`, `Fecha_Fin`, `Cliente`) VALUES ('8640', '2022-10-07', '2022-10-10', '3');

UPDATE `tp4-ej3`.`automóvil` SET `Reserva` = '1' WHERE (`ID_Automóvil` = '1');
UPDATE `tp4-ej3`.`automóvil` SET `Reserva` = '2' WHERE (`ID_Automóvil` = '2');
UPDATE `tp4-ej3`.`automóvil` SET `Reserva` = '3' WHERE (`ID_Automóvil` = '3');
