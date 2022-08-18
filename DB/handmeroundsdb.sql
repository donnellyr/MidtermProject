-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema handmeroundsdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `handmeroundsdb` ;

-- -----------------------------------------------------
-- Schema handmeroundsdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `handmeroundsdb` DEFAULT CHARACTER SET utf8 ;
USE `handmeroundsdb` ;

-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Wishlist` VARCHAR(45) NULL,
  `address_id` INT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NULL,
  `enabled` TINYINT NULL,
  `role` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_User_address1_idx` (`address_id` ASC),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  CONSTRAINT `fk_User_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `item` ;

CREATE TABLE IF NOT EXISTS `item` (
  `id` INT NOT NULL,
  `clothing_id` VARCHAR(45) NULL,
  `toy_id` VARCHAR(45) NULL,
  `furniture_id` VARCHAR(45) NULL,
  `school_suppiles_id` VARCHAR(45) NULL,
  `address_idlocation` INT NOT NULL,
  INDEX `fk_item_address1_idx` (`address_idlocation` ASC),
  CONSTRAINT `fk_item_address1`
    FOREIGN KEY (`address_idlocation`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS handmeroundsuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'handmeroundsuser'@'localhost' IDENTIFIED BY 'handmeroundsuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'handmeroundsuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `handmeroundsdb`;
INSERT INTO `address` (`id`) VALUES (1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `handmeroundsdb`;
INSERT INTO `user` (`id`, `Wishlist`, `address_id`, `username`, `password`, `enabled`, `role`) VALUES (1, NULL, 1, 'admin', 'admin', 1, NULL);

COMMIT;

