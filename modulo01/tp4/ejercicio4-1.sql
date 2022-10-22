CREATE SCHEMA `tp4-ej1` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE `tp4-ej1`.`alumno` (
  `Cod_Matrícula` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `DNI` VARCHAR(45) NOT NULL,
  `FechaNacimiento` DATETIME NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cod_Matrícula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE `tp4-ej1`.`curso` (
  `Cod_Curso` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cod_Curso`))
DEFAULT CHARACTER SET = utf8;;

CREATE TABLE `tp4-ej1`.`profesor` (
  `ID_Profesor` INT NOT NULL AUTO_INCREMENT,
  `Especialidad` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_Profesor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE `tp4-ej1`.`alumno_curso` (
  `ID_Inscripción` INT NOT NULL AUTO_INCREMENT,
  `Cod_Matrícula` INT NOT NULL,
  `Cod_Curso` INT NOT NULL,
  PRIMARY KEY (`ID_Inscripción`),
  INDEX `Cod_Matrícula_idx` (`Cod_Matrícula` ASC) VISIBLE,
  INDEX `FK_Cod_Curso_idx` (`Cod_Curso` ASC) VISIBLE,
  CONSTRAINT `FK_Cod_Matrícula`
    FOREIGN KEY (`Cod_Matrícula`)
    REFERENCES `tp4-ej1`.`alumno` (`Cod_Matrícula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Cod_Curso`
    FOREIGN KEY (`Cod_Curso`)
    REFERENCES `tp4-ej1`.`curso` (`Cod_Curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE `tp4-ej1`.`curso_profesor` (
  `ID_Clase` INT NOT NULL AUTO_INCREMENT,
  `Cod_Curso` INT NOT NULL,
  `ID_Profesor` INT NOT NULL,
  PRIMARY KEY (`ID_Clase`),
  INDEX `FK_Cod_Curso_idx` (`Cod_Curso` ASC) VISIBLE,
  INDEX `FK_ID_Profesor_idx` (`ID_Profesor` ASC) VISIBLE,
  CONSTRAINT `FK_Cod_Curso(clase)`
    FOREIGN KEY (`Cod_Curso`)
    REFERENCES `tp4-ej1`.`curso` (`Cod_Curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ID_Profesor`
    FOREIGN KEY (`ID_Profesor`)
    REFERENCES `tp4-ej1`.`profesor` (`ID_Profesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `tp4-ej1`.`alumno` (`Nombre`, `DNI`, `FechaNacimiento`, `Email`) VALUES ('Maximiliano Gamón', '37110672', '08/10/1992', 'maximilianogamon@gmail.com');
INSERT INTO `tp4-ej1`.`alumno` (`Nombre`, `DNI`, `FechaNacimiento`, `Email`) VALUES ('Luciano Rottoli', '41578963', '07/09/1995', 'lucianorottoli@gmail.com');
INSERT INTO `tp4-ej1`.`alumno` (`Nombre`, `DNI`, `FechaNacimiento`, `Email`) VALUES ('Javier Torres', '40125896', '06/08/1996', 'javiertorres@gmail.com');

INSERT INTO `tp4-ej1`.`curso` (`Nombre`) VALUES ('ESI');
INSERT INTO `tp4-ej1`.`curso` (`Nombre`) VALUES ('Física');
INSERT INTO `tp4-ej1`.`curso` (`Nombre`) VALUES ('Química');

INSERT INTO `tp4-ej1`.`profesor` (`Especialidad`, `Email`, `Nombre`) VALUES ('ESI', 'profe1@gmail.com', 'Profesor Uno');
INSERT INTO `tp4-ej1`.`profesor` (`Especialidad`, `Email`, `Nombre`) VALUES ('Física', 'profe2@gmail.com', 'Profesor Dos');
INSERT INTO `tp4-ej1`.`profesor` (`Especialidad`, `Email`, `Nombre`) VALUES ('Química', 'profe3@gmail.com', 'Profesor Tres');

INSERT INTO `tp4-ej1`.`alumno_curso` (`Cod_Matrícula`, `Cod_Curso`) VALUES ('1', '2');
INSERT INTO `tp4-ej1`.`alumno_curso` (`Cod_Matrícula`, `Cod_Curso`) VALUES ('2', '1');
INSERT INTO `tp4-ej1`.`alumno_curso` (`Cod_Matrícula`, `Cod_Curso`) VALUES ('3', '3');

INSERT INTO `tp4-ej1`.`curso_profesor` (`Cod_Curso`, `ID_Profesor`) VALUES ('1', '3');
INSERT INTO `tp4-ej1`.`curso_profesor` (`Cod_Curso`, `ID_Profesor`) VALUES ('2', '1');
INSERT INTO `tp4-ej1`.`curso_profesor` (`Cod_Curso`, `ID_Profesor`) VALUES ('3', '2');




