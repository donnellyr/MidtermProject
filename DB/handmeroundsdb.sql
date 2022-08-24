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
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NULL,
  `street2` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state_province` VARCHAR(45) NULL,
  `postal_code` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address_id` INT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NULL,
  `enabled` TINYINT(1) NULL DEFAULT '1',
  `role` INT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `image` VARCHAR(2000) NULL,
  `about_me` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_User_address1_idx` (`address_id` ASC),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  CONSTRAINT `fk_User_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `type` ;

CREATE TABLE IF NOT EXISTS `type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(200) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `item_condition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `item_condition` ;

CREATE TABLE IF NOT EXISTS `item_condition` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL,
  `description` VARCHAR(200) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `size`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `size` ;

CREATE TABLE IF NOT EXISTS `size` (
  `id` INT NOT NULL,
  `size` VARCHAR(45) NULL,
  `description` VARCHAR(200) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `item` ;

CREATE TABLE IF NOT EXISTS `item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `available` TINYINT NULL,
  `type_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `condition_id` INT NOT NULL,
  `trade` TINYINT NULL,
  `size_id` INT NULL,
  `date_posted` DATETIME NULL,
  `description` VARCHAR(200) NULL,
  `image` VARCHAR(2000) NULL,
  `active` TINYINT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  INDEX `fk_item_type1_idx` (`type_id` ASC),
  INDEX `fk_item_user1_idx` (`user_id` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_item_condition1_idx` (`condition_id` ASC),
  INDEX `fk_item_size1_idx` (`size_id` ASC),
  CONSTRAINT `fk_item_type1`
    FOREIGN KEY (`type_id`)
    REFERENCES `type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_condition1`
    FOREIGN KEY (`condition_id`)
    REFERENCES `item_condition` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_size1`
    FOREIGN KEY (`size_id`)
    REFERENCES `size` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delivery_option`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `delivery_option` ;

CREATE TABLE IF NOT EXISTS `delivery_option` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL,
  `description` VARCHAR(200) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trade_request`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trade_request` ;

CREATE TABLE IF NOT EXISTS `trade_request` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `trade_request` TINYINT NULL,
  `remarks` VARCHAR(300) NULL,
  `item_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `request_date` DATETIME NULL,
  `image` VARCHAR(2000) NULL,
  `decision` INT NULL DEFAULT '0',
  `active` TINYINT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  INDEX `fk_trade_request_item1_idx` (`item_id` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_trade_request_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_trade_request_item1`
    FOREIGN KEY (`item_id`)
    REFERENCES `item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trade_request_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delivery_option_has_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `delivery_option_has_item` ;

CREATE TABLE IF NOT EXISTS `delivery_option_has_item` (
  `delivery_option_id` INT NOT NULL,
  `item_id` INT NOT NULL,
  PRIMARY KEY (`delivery_option_id`, `item_id`),
  INDEX `fk_delivery_option_has_item_item1_idx` (`item_id` ASC),
  INDEX `fk_delivery_option_has_item_delivery_option1_idx` (`delivery_option_id` ASC),
  CONSTRAINT `fk_delivery_option_has_item_delivery_option1`
    FOREIGN KEY (`delivery_option_id`)
    REFERENCES `delivery_option` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_option_has_item_item1`
    FOREIGN KEY (`item_id`)
    REFERENCES `item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trade_request_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trade_request_comment` ;

CREATE TABLE IF NOT EXISTS `trade_request_comment` (
  `id` INT NOT NULL,
  `owner_comment` VARCHAR(1000) NULL,
  `requestor_comment` VARCHAR(1000) NULL,
  `comment_date` DATETIME NULL,
  `trade_request_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_trade_request_comments_trade_request1_idx` (`trade_request_id` ASC),
  INDEX `fk_trade_request_comment_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_trade_request_comments_trade_request1`
    FOREIGN KEY (`trade_request_id`)
    REFERENCES `trade_request` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trade_request_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meeting_location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `meeting_location` ;

CREATE TABLE IF NOT EXISTS `meeting_location` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` TEXT NULL,
  `image` VARCHAR(2000) NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_meeting_location_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_meeting_location_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exchange`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exchange` ;

CREATE TABLE IF NOT EXISTS `exchange` (
  `id` INT NOT NULL,
  `exchange_date` VARCHAR(45) NULL,
  `trade_request_id` INT NOT NULL,
  `meeting_location_id` INT NULL,
  `delivery_option_id` INT NOT NULL,
  `owner_rating` INT NULL,
  `owner_rating_comment` VARCHAR(200) NULL,
  `requestor_rating` INT NULL,
  `requestor_rating_comment` VARCHAR(200) NULL,
  `iscomplete` TINYINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_exchange_trade_request1_idx` (`trade_request_id` ASC),
  INDEX `fk_exchange_meeting_location1_idx` (`meeting_location_id` ASC),
  INDEX `fk_exchange_delivery_option1_idx` (`delivery_option_id` ASC),
  CONSTRAINT `fk_exchange_trade_request1`
    FOREIGN KEY (`trade_request_id`)
    REFERENCES `trade_request` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exchange_meeting_location1`
    FOREIGN KEY (`meeting_location_id`)
    REFERENCES `meeting_location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exchange_delivery_option1`
    FOREIGN KEY (`delivery_option_id`)
    REFERENCES `delivery_option` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wishlist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wishlist` ;

CREATE TABLE IF NOT EXISTS `wishlist` (
  `item_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`item_id`, `user_id`),
  INDEX `fk_item_has_user_user1_idx` (`user_id` ASC),
  INDEX `fk_item_has_user_item1_idx` (`item_id` ASC),
  CONSTRAINT `fk_item_has_user_item1`
    FOREIGN KEY (`item_id`)
    REFERENCES `item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `report`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `report` ;

CREATE TABLE IF NOT EXISTS `report` (
  `id` INT NOT NULL,
  `report_date` DATETIME NULL,
  `reason` VARCHAR(200) NULL,
  `image` VARCHAR(2000) NULL,
  `user_id` INT NOT NULL,
  `reported_by_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_report_user1_idx` (`user_id` ASC),
  INDEX `fk_report_user2_idx` (`reported_by_id` ASC),
  CONSTRAINT `fk_report_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_report_user2`
    FOREIGN KEY (`reported_by_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `additional_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `additional_image` ;

CREATE TABLE IF NOT EXISTS `additional_image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `image` VARCHAR(2000) NULL,
  `item_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_additional_image_item1_idx` (`item_id` ASC),
  CONSTRAINT `fk_additional_image_item1`
    FOREIGN KEY (`item_id`)
    REFERENCES `item` (`id`)
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
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state_province`, `postal_code`) VALUES (1, '123 Elm St', NULL, 'SomeCity', 'SomeState', 80000);
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state_province`, `postal_code`) VALUES (2, '222 EZ St', NULL, 'SomeCity', 'SomeState', 80000);
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state_province`, `postal_code`) VALUES (3, '555 Downing Ave', NULL, 'SomeCity', 'SomeState', 80000);
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state_province`, `postal_code`) VALUES (4, '777 Van St', NULL, 'SomeCity', 'SomeState', 80000);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `handmeroundsdb`;
INSERT INTO `user` (`id`, `address_id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `image`, `about_me`) VALUES (1, 1, 'admin', 'admin', 1, 1, 'bob', 'dobbs', NULL, NULL);
INSERT INTO `user` (`id`, `address_id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `image`, `about_me`) VALUES (2, 2, 'admin2', 'admin2', 1, 1, 'frank', 'sanders', NULL, NULL);
INSERT INTO `user` (`id`, `address_id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `image`, `about_me`) VALUES (3, 3, 'employee', 'employee', 1, 2, 'sally', 'green', NULL, NULL);
INSERT INTO `user` (`id`, `address_id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `image`, `about_me`) VALUES (4, 4, 'user', 'user', 1, 3, 'dan', 'vanman', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `type`
-- -----------------------------------------------------
START TRANSACTION;
USE `handmeroundsdb`;
INSERT INTO `type` (`id`, `name`, `description`) VALUES (1, 'Clothing', NULL);
INSERT INTO `type` (`id`, `name`, `description`) VALUES (2, 'Toy', NULL);
INSERT INTO `type` (`id`, `name`, `description`) VALUES (3, 'Furniture', NULL);
INSERT INTO `type` (`id`, `name`, `description`) VALUES (4, 'School Supplies', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `item_condition`
-- -----------------------------------------------------
START TRANSACTION;
USE `handmeroundsdb`;
INSERT INTO `item_condition` (`id`, `name`, `description`) VALUES (1, 'New', 'New with tags or in box');
INSERT INTO `item_condition` (`id`, `name`, `description`) VALUES (2, 'Like New', NULL);
INSERT INTO `item_condition` (`id`, `name`, `description`) VALUES (3, 'Used-Good', NULL);
INSERT INTO `item_condition` (`id`, `name`, `description`) VALUES (4, 'Used-Fair', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `size`
-- -----------------------------------------------------
START TRANSACTION;
USE `handmeroundsdb`;
INSERT INTO `size` (`id`, `size`, `description`) VALUES (1, 'Newborn', NULL);
INSERT INTO `size` (`id`, `size`, `description`) VALUES (2, '0-6 Months', NULL);
INSERT INTO `size` (`id`, `size`, `description`) VALUES (3, '6-12 Months', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `item`
-- -----------------------------------------------------
START TRANSACTION;
USE `handmeroundsdb`;
INSERT INTO `item` (`id`, `name`, `available`, `type_id`, `user_id`, `condition_id`, `trade`, `size_id`, `date_posted`, `description`, `image`, `active`) VALUES (1, 'Diaper Changing Table', 1, 3, 1, 1, 1, NULL, '2014-05-26 23:57:41', 'Almost new modern style diaper changing table', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `delivery_option`
-- -----------------------------------------------------
START TRANSACTION;
USE `handmeroundsdb`;
INSERT INTO `delivery_option` (`id`, `name`, `description`) VALUES (1, 'Meet up', 'Firestation or Police station');
INSERT INTO `delivery_option` (`id`, `name`, `description`) VALUES (2, 'Shipping', 'Willing to pay for shipping');
INSERT INTO `delivery_option` (`id`, `name`, `description`) VALUES (3, 'Drop off', 'Firestation or Police station');

COMMIT;


-- -----------------------------------------------------
-- Data for table `trade_request`
-- -----------------------------------------------------
START TRANSACTION;
USE `handmeroundsdb`;
INSERT INTO `trade_request` (`id`, `trade_request`, `remarks`, `item_id`, `user_id`, `request_date`, `image`, `decision`, `active`) VALUES (1, 1, 'Willing to trade locally', 1, 1, '2014-05-26 23:57:41', NULL, NULL, NULL);
INSERT INTO `trade_request` (`id`, `trade_request`, `remarks`, `item_id`, `user_id`, `request_date`, `image`, `decision`, `active`) VALUES (2, 2, 'I can meet you at the van', 1, 1, '2014-05-26 23:57:41', NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `delivery_option_has_item`
-- -----------------------------------------------------
START TRANSACTION;
USE `handmeroundsdb`;
INSERT INTO `delivery_option_has_item` (`delivery_option_id`, `item_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `trade_request_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `handmeroundsdb`;
INSERT INTO `trade_request_comment` (`id`, `owner_comment`, `requestor_comment`, `comment_date`, `trade_request_id`, `user_id`) VALUES (1, NULL, 'Would like to meet at Firehouse #2', '2014-05-26 23:57:41', 1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `meeting_location`
-- -----------------------------------------------------
START TRANSACTION;
USE `handmeroundsdb`;
INSERT INTO `meeting_location` (`id`, `name`, `description`, `image`, `address_id`) VALUES (1, 'Firehouse #2', 'Firehouse in downtown SomeCity', NULL, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `exchange`
-- -----------------------------------------------------
START TRANSACTION;
USE `handmeroundsdb`;
INSERT INTO `exchange` (`id`, `exchange_date`, `trade_request_id`, `meeting_location_id`, `delivery_option_id`, `owner_rating`, `owner_rating_comment`, `requestor_rating`, `requestor_rating_comment`, `iscomplete`) VALUES (1, '2014-05-26 23:57:41', 1, 1, 1, 3, 'It\'s ok', 3, 'We exchange stuff', 1);
INSERT INTO `exchange` (`id`, `exchange_date`, `trade_request_id`, `meeting_location_id`, `delivery_option_id`, `owner_rating`, `owner_rating_comment`, `requestor_rating`, `requestor_rating_comment`, `iscomplete`) VALUES (2, '2014-05-26 23:57:41', 2, 1, 1, NULL, NULL, NULL, NULL, 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `report`
-- -----------------------------------------------------
START TRANSACTION;
USE `handmeroundsdb`;
INSERT INTO `report` (`id`, `report_date`, `reason`, `image`, `user_id`, `reported_by_id`) VALUES (1, NULL, 'Trying to Sell', NULL, 2, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `additional_image`
-- -----------------------------------------------------
START TRANSACTION;
USE `handmeroundsdb`;
INSERT INTO `additional_image` (`id`, `image`, `item_id`) VALUES (1, NULL, 1);

COMMIT;

