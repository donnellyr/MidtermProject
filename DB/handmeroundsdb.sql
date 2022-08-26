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
-- Table `item_condition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `item_condition` ;

CREATE TABLE IF NOT EXISTS `item_condition` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `description` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `size`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `size` ;

CREATE TABLE IF NOT EXISTS `size` (
  `id` INT(11) NOT NULL,
  `size` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `type` ;

CREATE TABLE IF NOT EXISTS `type` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NULL DEFAULT NULL,
  `street2` VARCHAR(45) NULL DEFAULT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `state_province` VARCHAR(45) NULL DEFAULT NULL,
  `postal_code` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `address_id` INT(11) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  `enabled` TINYINT(1) NULL DEFAULT '1',
  `role` INT(11) NULL DEFAULT NULL,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `image` VARCHAR(10000) NULL DEFAULT NULL,
  `about_me` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_User_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_User_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `item` ;

CREATE TABLE IF NOT EXISTS `item` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `available` TINYINT(4) NULL DEFAULT NULL,
  `type_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  `condition_id` INT(11) NOT NULL,
  `trade` TINYINT(4) NULL DEFAULT NULL,
  `size_id` INT(11) NULL DEFAULT NULL,
  `date_posted` DATETIME NULL DEFAULT NULL,
  `description` VARCHAR(200) NULL DEFAULT NULL,
  `image` VARCHAR(2000) NULL DEFAULT NULL,
  `active` TINYINT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_item_type1_idx` (`type_id` ASC),
  INDEX `fk_item_user1_idx` (`user_id` ASC),
  INDEX `fk_item_condition1_idx` (`condition_id` ASC),
  INDEX `fk_item_size1_idx` (`size_id` ASC),
  CONSTRAINT `fk_item_condition1`
    FOREIGN KEY (`condition_id`)
    REFERENCES `item_condition` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_size1`
    FOREIGN KEY (`size_id`)
    REFERENCES `size` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_type1`
    FOREIGN KEY (`type_id`)
    REFERENCES `type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `additional_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `additional_image` ;

CREATE TABLE IF NOT EXISTS `additional_image` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `image` VARCHAR(20000) NULL DEFAULT NULL,
  `item_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_additional_image_item1_idx` (`item_id` ASC),
  CONSTRAINT `fk_additional_image_item1`
    FOREIGN KEY (`item_id`)
    REFERENCES `item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `delivery_option`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `delivery_option` ;

CREATE TABLE IF NOT EXISTS `delivery_option` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `description` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `delivery_option_has_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `delivery_option_has_item` ;

CREATE TABLE IF NOT EXISTS `delivery_option_has_item` (
  `delivery_option_id` INT(11) NOT NULL,
  `item_id` INT(11) NOT NULL,
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
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `meeting_location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `meeting_location` ;

CREATE TABLE IF NOT EXISTS `meeting_location` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `image` VARCHAR(2000) NULL DEFAULT NULL,
  `address_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_meeting_location_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_meeting_location_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `trade_request`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trade_request` ;

CREATE TABLE IF NOT EXISTS `trade_request` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `trade_request` TINYINT(4) NULL DEFAULT NULL,
  `remarks` VARCHAR(300) NOT NULL,
  `item_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  `request_date` DATETIME NULL DEFAULT NULL,
  `image` VARCHAR(20000) NULL DEFAULT NULL,
  `decision` INT(11) NULL DEFAULT '0',
  `active` TINYINT(4) NULL DEFAULT '1',
  PRIMARY KEY (`id`, `remarks`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_trade_request_item1_idx` (`item_id` ASC),
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
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `exchange`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exchange` ;

CREATE TABLE IF NOT EXISTS `exchange` (
  `id` INT(11) NOT NULL,
  `exchange_date` VARCHAR(45) NULL DEFAULT NULL,
  `trade_request_id` INT(11) NOT NULL,
  `meeting_location_id` INT(11) NULL DEFAULT NULL,
  `delivery_option_id` INT(11) NOT NULL,
  `owner_rating` INT(11) NULL DEFAULT NULL,
  `owner_rating_comment` VARCHAR(200) NULL DEFAULT NULL,
  `requestor_rating` INT(11) NULL DEFAULT NULL,
  `requestor_rating_comment` VARCHAR(200) NULL DEFAULT NULL,
  `iscomplete` TINYINT(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_exchange_trade_request1_idx` (`trade_request_id` ASC),
  INDEX `fk_exchange_meeting_location1_idx` (`meeting_location_id` ASC),
  INDEX `fk_exchange_delivery_option1_idx` (`delivery_option_id` ASC),
  CONSTRAINT `fk_exchange_delivery_option1`
    FOREIGN KEY (`delivery_option_id`)
    REFERENCES `delivery_option` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exchange_meeting_location1`
    FOREIGN KEY (`meeting_location_id`)
    REFERENCES `meeting_location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exchange_trade_request1`
    FOREIGN KEY (`trade_request_id`)
    REFERENCES `trade_request` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `report`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `report` ;

CREATE TABLE IF NOT EXISTS `report` (
  `id` INT(11) NOT NULL,
  `report_date` DATETIME NULL DEFAULT NULL,
  `reason` VARCHAR(200) NULL DEFAULT NULL,
  `image` VARCHAR(2000) NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  `reported_by_id` INT(11) NOT NULL,
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
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `trade_request_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trade_request_comment` ;

CREATE TABLE IF NOT EXISTS `trade_request_comment` (
  `id` INT(11) NOT NULL,
  `owner_comment` VARCHAR(1000) NULL DEFAULT NULL,
  `requestor_comment` VARCHAR(1000) NULL DEFAULT NULL,
  `comment_date` DATETIME NULL DEFAULT NULL,
  `trade_request_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_trade_request_comments_trade_request1_idx` (`trade_request_id` ASC),
  INDEX `fk_trade_request_comment_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_trade_request_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trade_request_comments_trade_request1`
    FOREIGN KEY (`trade_request_id`)
    REFERENCES `trade_request` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wishlist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wishlist` ;

CREATE TABLE IF NOT EXISTS `wishlist` (
  `item_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
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
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SET SQL_MODE = '';
DROP USER IF EXISTS handmeroundsuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'handmeroundsuser'@'localhost' IDENTIFIED BY 'handmeroundsuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'handmeroundsuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `item_condition`
-- -----------------------------------------------------
START TRANSACTION;
USE `handmeroundsdb`;
INSERT INTO `item_condition` (`id`, `name`, `description`) VALUES (1, 'New', 'New with tags or in box');
INSERT INTO `item_condition` (`id`, `name`, `description`) VALUES (2, 'Like New', 'No damage');
INSERT INTO `item_condition` (`id`, `name`, `description`) VALUES (3, 'Used - Good', '');
INSERT INTO `item_condition` (`id`, `name`, `description`) VALUES (4, 'Used - Fair', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `size`
-- -----------------------------------------------------
START TRANSACTION;
USE `handmeroundsdb`;
INSERT INTO `size` (`id`, `size`, `description`) VALUES (1, 'Newborn', NULL);
INSERT INTO `size` (`id`, `size`, `description`) VALUES (2, '0-6 Months', NULL);
INSERT INTO `size` (`id`, `size`, `description`) VALUES (3, '6-12 Months', NULL);
INSERT INTO `size` (`id`, `size`, `description`) VALUES (4, '12-18 Months', NULL);
INSERT INTO `size` (`id`, `size`, `description`) VALUES (5, '18-24 Months', NULL);
INSERT INTO `size` (`id`, `size`, `description`) VALUES (6, '2T', NULL);
INSERT INTO `size` (`id`, `size`, `description`) VALUES (7, '2T', NULL);
INSERT INTO `size` (`id`, `size`, `description`) VALUES (8, '3T', NULL);
INSERT INTO `size` (`id`, `size`, `description`) VALUES (9, '4T', NULL);
INSERT INTO `size` (`id`, `size`, `description`) VALUES (10, '5T', NULL);
INSERT INTO `size` (`id`, `size`, `description`) VALUES (11, 'Child - small', NULL);
INSERT INTO `size` (`id`, `size`, `description`) VALUES (12, 'Child - medium', NULL);
INSERT INTO `size` (`id`, `size`, `description`) VALUES (13, 'Child - large', NULL);
INSERT INTO `size` (`id`, `size`, `description`) VALUES (14, 'Child - XL', NULL);
INSERT INTO `size` (`id`, `size`, `description`) VALUES (15, 'Adult-Men-small', NULL);
INSERT INTO `size` (`id`, `size`, `description`) VALUES (16, 'Adult-Men-medium', NULL);
INSERT INTO `size` (`id`, `size`, `description`) VALUES (17, 'Adult-Men-large', NULL);
INSERT INTO `size` (`id`, `size`, `description`) VALUES (18, 'Adult-Men-XL', NULL);
INSERT INTO `size` (`id`, `size`, `description`) VALUES (19, 'Adult-Women-small', NULL);
INSERT INTO `size` (`id`, `size`, `description`) VALUES (20, 'Adult-Women-medium', NULL);
INSERT INTO `size` (`id`, `size`, `description`) VALUES (21, 'Adult-Women-large', NULL);
INSERT INTO `size` (`id`, `size`, `description`) VALUES (22, 'Adult-Women-XL', NULL);

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
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `handmeroundsdb`;
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state_province`, `postal_code`) VALUES (1, '123 Elm St', NULL, 'Denver', 'Colorado', 80205);
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state_province`, `postal_code`) VALUES (2, '222 Ez St', '', 'Denver', 'Colorado', 80205);
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state_province`, `postal_code`) VALUES (3, '555 Downing Ave', NULL, 'Denver', 'Colorado', 80205);
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state_province`, `postal_code`) VALUES (4, '777 Van St', NULL, 'Denver', 'Colorado', 80205);
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state_province`, `postal_code`) VALUES (5, '789 Luna Way', NULL, 'Denver', 'Colorado', 80205);
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state_province`, `postal_code`) VALUES (6, '9283 Grant Way', NULL, 'Denver', 'Colorado', 80205);
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state_province`, `postal_code`) VALUES (7, '345 Long Lane', NULL, 'Denver', 'Colorado', 80205);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `handmeroundsdb`;
INSERT INTO `user` (`id`, `address_id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `image`, `about_me`) VALUES (1, 1, 'admin', 'pass', 1, 1, 'Lisa', 'Sandler', '', NULL);
INSERT INTO `user` (`id`, `address_id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `image`, `about_me`) VALUES (2, 2, 'admin2', 'pass', 1, 1, 'Bob', 'Dobbs', NULL, NULL);
INSERT INTO `user` (`id`, `address_id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `image`, `about_me`) VALUES (3, 3, 'employee', 'pass', 1, 2, 'Sally', 'Green', NULL, NULL);
INSERT INTO `user` (`id`, `address_id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `image`, `about_me`) VALUES (4, 4, 'danny', 'pass', 1, 3, 'Dan', 'Vans', 'data:image/jpeg;base64,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', 'Hi I\'m Dan');
INSERT INTO `user` (`id`, `address_id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `image`, `about_me`) VALUES (5, 5, 'coconut', 'pass', 1, 3, 'Leslie', 'Coconut', 'data:image/jpeg;base64,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', 'I\'m Nuts!');
INSERT INTO `user` (`id`, `address_id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `image`, `about_me`) VALUES (6, 6, 'traderguy', 'pass', 1, 3, 'Guy', 'Emeril', NULL, NULL);
INSERT INTO `user` (`id`, `address_id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `image`, `about_me`) VALUES (7, 7, 'forsale', 'pass', 1, 3, 'Steve', 'Works', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `item`
-- -----------------------------------------------------
START TRANSACTION;
USE `handmeroundsdb`;
INSERT INTO `item` (`id`, `name`, `available`, `type_id`, `user_id`, `condition_id`, `trade`, `size_id`, `date_posted`, `description`, `image`, `active`) VALUES (1, 'Diaper Changing Table', 1, 3, 4, 1, 1, NULL, '2014-05-26 23:57:41', 'Almost new modern style diaper changing table', NULL, 1);
INSERT INTO `item` (`id`, `name`, `available`, `type_id`, `user_id`, `condition_id`, `trade`, `size_id`, `date_posted`, `description`, `image`, `active`) VALUES (2, 'Red Shirt', 1, 1, 5, 2, 1, 5, '2014-05-26 23:57:41', 'Red button down shirt', '', 1);
INSERT INTO `item` (`id`, `name`, `available`, `type_id`, `user_id`, `condition_id`, `trade`, `size_id`, `date_posted`, `description`, `image`, `active`) VALUES (3, 'Baseball cap', 1, 1, 4, 3, 0, NULL, '2014-05-26 23:57:41', 'Blue baseball hat fits all', NULL, 1);
INSERT INTO `item` (`id`, `name`, `available`, `type_id`, `user_id`, `condition_id`, `trade`, `size_id`, `date_posted`, `description`, `image`, `active`) VALUES (4, 'Khaki pants', 1, 1, 5, 1, 1, 4, '2014-05-26 23:57:41', 'Khaki pants', NULL, 1);
INSERT INTO `item` (`id`, `name`, `available`, `type_id`, `user_id`, `condition_id`, `trade`, `size_id`, `date_posted`, `description`, `image`, `active`) VALUES (5, 'Grey Sectional Couch', 1, 3, 6, 2, 1, NULL, '2014-05-26 23:57:41', 'Like new grey couch', NULL, 1);
INSERT INTO `item` (`id`, `name`, `available`, `type_id`, `user_id`, `condition_id`, `trade`, `size_id`, `date_posted`, `description`, `image`, `active`) VALUES (6, 'Work Van', 1, 3, 7, 1, 0, NULL, '2014-05-26 23:57:41', 'For sale nice work van. Cash only!', '', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `additional_image`
-- -----------------------------------------------------
START TRANSACTION;
USE `handmeroundsdb`;
INSERT INTO `additional_image` (`id`, `image`, `item_id`) VALUES (1, 'https://www.ikea.com/us/en/images/products/gulliver-changing-table-white__0627306_pe693289_s5.jpg?f=s', 1);
INSERT INTO `additional_image` (`id`, `image`, `item_id`) VALUES (2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQv5h8AzEHkZTroejUwyEoURzyOoSep1eHnVxMk1_vAKMRpiojn2ZBtQypqAR98X-iCs7U&usqp=CAU', 2);
INSERT INTO `additional_image` (`id`, `image`, `item_id`) VALUES (6, 'https://www.gmc.com/content/dam/gmc/na/us/english/index/vehicles/2022/vans/savana-cargo/01-images/2022-savana-cargo-details-3500-specs-highlights.jpg?imwidth=960', 6);

COMMIT;


-- -----------------------------------------------------
-- Data for table `delivery_option`
-- -----------------------------------------------------
START TRANSACTION;
USE `handmeroundsdb`;
INSERT INTO `delivery_option` (`id`, `name`, `description`) VALUES (1, 'Meet Up', 'Fire Station or Police Station');
INSERT INTO `delivery_option` (`id`, `name`, `description`) VALUES (2, 'Shipping', 'Willing to pay for shipping');
INSERT INTO `delivery_option` (`id`, `name`, `description`) VALUES (3, 'Drop Off', 'Fire Station or Police Station');

COMMIT;


-- -----------------------------------------------------
-- Data for table `delivery_option_has_item`
-- -----------------------------------------------------
START TRANSACTION;
USE `handmeroundsdb`;
INSERT INTO `delivery_option_has_item` (`delivery_option_id`, `item_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `meeting_location`
-- -----------------------------------------------------
START TRANSACTION;
USE `handmeroundsdb`;
INSERT INTO `meeting_location` (`id`, `name`, `description`, `image`, `address_id`) VALUES (1, 'Firehouse #2', 'Firehouse in downtown, Somecity', NULL, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `trade_request`
-- -----------------------------------------------------
START TRANSACTION;
USE `handmeroundsdb`;
INSERT INTO `trade_request` (`id`, `trade_request`, `remarks`, `item_id`, `user_id`, `request_date`, `image`, `decision`, `active`) VALUES (1, 1, 'Willing to trade locally', 1, 5, '2014-05-26 23:57:41', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoGBxUTExYTFBMWFxQYGRkZFhkZGBgdGRcfIhgcHBofGBkgHyoiIh80IhkZIzQjKSsuMTExGSM5OzYvOiowMS4BCwsLDw4PHBERHTAfICcuMDUwMDouMDQ4Li4uMDAwMDEuMjowLjA6OjIuMDIwLjMuMjAyLi4wLjAwLi4wMS4wMP/AABEIAM0A9QMBIgACEQEDEQH/xAAcAAEAAQUBAQAAAAAAAAAAAAAABwMEBQYIAQL/xABEEAACAQIEBAQDBAgFAgUFAAABAgMAEQQSITEFBkFRBxMiYTJxgUJSkaEUI2JykrHB0UNTguHwM7IIF2OisyQ0VJPS/8QAGgEBAQEBAQEBAAAAAAAAAAAAAAECBAMFBv/EACsRAQACAgEEAAUCBwAAAAAAAAABAgMRIQQSEzFBUYGRoSJxFDJCYdHw8f/aAAwDAQACEQMRAD8AmalKUClKUClKUClKUClKUClKUClKUClKUClKUClKUClKUClKUClKUClKUClKUClKUClKUClKUClKUClKUClKUClKUClKUClKUClKUCtJ8Uec5OHxxLEo82UtZmFwoW19O/q99ttdN2rDcycswY6MRzoTlN0ZTZkPWx/objQdhQadyn4pF4r4qIllPqeIaZPvZSbkixuFuTpYXNqkWGUOoZSCrAFSNiCLgj2qB+ZuBzcPcRlBYk5GV1YOPvFb51Fh1AA2BNq3zwy5vzRxYLFKsU6KEhubeaiiy2B+3lA0F7gX0vaqswkGlKVEKUpQKUpQKUpQKUpQKUpQKUpQKUpQKUpQKUpQKUpQKUpQKUpQKUpQKtOKYoxQySBcxRGYL3spNvyq7r5cgamggnH4qWTE4mSVcwxK5A+wQ29AAPQ+lLXv6VOtZDk3hkGNwzQSSCLEgloJdmFrZhe4uoyqct76kjrW085c3YHC4edMM0BxDiwWJVPqOhZyoy6Ak6mo75XRJZY4jbLPMY1H2lupsRbazeXe9xYnTWtNJf4O88OHUySNKY1/W51UORa5ZCp1FtQG1Nrek6VsYNaniIv0VBhg12kwoijJ6urrED+OJS57CtqRbAAbDSssvulKUClKUClKUClKUClKUClKUClKUClKUClKUClKUClKUClKUClKUCtZ8R+HyTYKRYg7OCGyKSPMGzKe4sxNvatmrxqDmFOHN5vkuSra3JU3Frk+ne9gdNNdNKmXlXwww2FZJmd5pVYOjE5VUgGxVV36HW+1RtzQgfESu+UsXe5A9Pxm5X2vr9akHw34ixwzQxEGQyEpp6Y1ZVLOw7ZsxA+0xtpqR15OlvTH3zLwr1NbX7YbBj5FfHQem6xGSPN/6jxF8oHWyxgnpdl6g22KsJi8GsP6KFvZJ7kndi8UqszHqxaQsT1JNZuuR7lKUoFKUoFKUoFKUoFKUoFKUoFKUoFKUoFKUoFKUoFKx+N45hof+riIk9mkQH8Cb1bYLmzByuI48VCzk2Vc4ux7Lfc+woMzSlKDyleE1pHNniPFDeLD2ll2v/hr9ftfTT3rePHfJOqxti+StI3aW08X4xDhkzzOFXp3b2A3NRdzV4hTYm8cF4otiftt8z/QfnWs8U4jLiHMs8hdj06fIDt8tKt5sykqylCNCCPUPa3Q9+3WvsdP0NKTu/NnzsvU3vGq8Q8de516/wC9SB4P8QylojYZyQuq3JUZgLXvsX9tKjz8vbr8z/c1e8Exj4edHS2ZWB9iQToT2Oo+Rrp6nH5Mc1eGG/ZeLJx5kNo427T4b88RGp/JjWUrET4hMRhVlF8jCKQdxZ1cX9wR+VZevzcxrh9qJ3G3tKUopSlKBSlKBSlKBSlKBSleE0HtKwPEeccHAcrYhCwJBVfWRbe+W9rXG/cDcisQ/ilgh1kta+ybdNM98x+58XcCg3WlabhfEvBubEuv3ifLKrfbZyWJOllBt1sLGs7w7mPDzELHKpcgkIfS+m/oazfl1FBfYqbIjOQSFUsQouTYXsB1PtUV4jxqYn0YYKp2zEsSN76FRtr1qW6x+I4Lh3VkeCJka5ZTGhDEm5JFt7km9BDvEvFbFvfy5BGv7KJf8SDb6VrPEOZsTNfzJ5WHXM72+gvb32qaf/LDhufP+jb7pnfJ/CT+W1RhzxyinDcTEFLSQvZl8yx+0RlawFwDbpsRWo00zXA/B6WWNZJ8SI8wDBUXObEXF2zAX+QIrauFeEuBhZHbzpXUqwLSEC4NwcqW6jbatsw/EYjFHLnVUdVKliAPUAQNeuoFXM0yqpZiFUC5JIAA7kmoztUrEcwcxw4NM8zgH7KjVm+Q/rtWn81eJoW8WDAZtjKw9I/cU7/M6exrQR5uIluS80zmw0LEnso1P9h2GtduHopmO/J+mHJk6mIntpzLOc0c7T4y6KfJg+6D6mH7R6/Lb2rF8E5fnxJIghLgGzOSFQG9tXbQnuBcjttW6cr+Gl7S4w9iIVb/AORwf/apt3ZgbVl+d+ZUwEIgw6qJin6tFUZYkGmbKNPZV6n5V0fxMRMY+nr9Xl4JmO7LLUOMxQcOtDC3mYw28ydrfqbi9ol2VyL66soO+wGA5a4BNjZfLS3d3PwIt/iPcnovX8TVPhWAlxkwiiu5kIclrmx3d3bt8LE9Sba3qb+XOBx4OERRj3dj8Tt1Zv7dBUyZfBXid2n/AH/hXF5bfKIWOA5Lw0WGfDhb+YpWSRgC7G3xX6W3AGgqLebeXHwWOijV7o+sbNYdQt3NiLhmB0X8KnSo/wDGfhRkgimUeqMuv0Zc384wPm1fO8uSd/qnl2xjpGuIbLPxGKLh/nnKkQhDG+y6DT530+dZeCZXUOpDKwBUjUEHYg1E/LPO2HPDJYMUSzMZBHGDZnBUP8Wy+stqdtN6cA8UYsLhcPCMOLrESxzZVZ7nMQApN2bMxO2prGnppLtKiqPxmXrGPhvoGF2103OUba637LWTwfi5hWJzLYAA3B1YnoqkDbrcjTbNqBNGkh0rD8I5nw+IOWOVc4tdSRcaA2uCVJsQdCdCKzFEKUpQKUpQKUrXOdeZ1wcQAZRNJcR5j6VtYM7/ALIzDQbkgaXJAe82c3w4FbN65SCUjBAPzYnRVuQLn6A1DvMPOWL4gxS5Kf5SArGBr8a3173cn5C1WWKxRxLyTSuVhzFpHJuZG29JyjpYWANhYAWsKo8OM+KkXDYSPJcaIp9RAtdnfftcj2vtetxEe5P2WOPwrR2WR1vr6Q1yv7wGgverf0+/4VKfK/hDHdhi5GLixyJ6VIIBBzddbqR3X3F9rk8O+HpkIwsZAcZrgksCCgB17sD/AKRU2u0BBU7kfSq8U0iiyvmTcqdVOlvUDoe1juCannH+HHDXU3wyR6ashKEe9wa0ni3g/IE83Cy+o3PkyaEC91UP94LYHMDc32ptdsNy54n4nDEKx82P0qUc/CL/AOHYXGmltR6Rp1qYOV+Z4MfF5kDHQ2ZGFnQ/tLc6e4JB71zrjsJJEzJNE6SIbEFbEH5f1FxVzy7xWbCSiWA5ZFFicoIVSbHPfcHT0DUkDW4FJg06YVgdRaom8YMFjpmzvHGMJE1kcWDHOVAucxbcAHRRtvV/4ZYKNopcfLOyL5j+i6okYIUktbZjcm65b5jvcWtOcucoplbDYWOSXPZS7ySlSbgjy4yxzG40JG42NeuDFN7xxuPi8MuSKV98sNwHimDGHdcZHJMwKmKEX8s2AAGYnMNbkgm1joCSRVHmPmbEY5gshIUn0Qx3sT003Zvc/S21WHBuHmeaOAHKzOFudk1sTlv3971MvLPKEGDF0GeUj1Svqx7heij2H1vX0Mng6WdxG7T6cVPLn4meEc8B8PsVM6CSMwxHVmYC4A6BMwbMdhewG+trGUOXuW4MGtok9RADSNYyPbu1tr3OUWUX0ArLVYcc4vHhYmmkPpXYD4mJ2VR1Jrgy58meYifs66YqYo3H3WPOHMiYKLObNI3piS/xt79lF7k/1IqGZpJsTMSczzu5Bt9skDKF9rWA6AA32r3j/HJMdM8kmuYBVA2iF9FXv0+bVJ/h1yf+jJ58w/XuNFOvlKen756n6d79da16bH3T7l4Wm2a+o9QyPJHK64KLWxmexkYfkq/sj8zc1sdKtOJ49IInmkNkRSzH5dB3J2A6kivm2tN53Pt2VrFY1Cnxji8WGjMsrWABsBqzEKWyovVrA6e1RDzX4mPNKI1AEGdDlBBBtvnJQE+o30NvQPnWD565tlxkxLEhbkIlzaNSFuvS5utybfyrV2FyFAzMdAALknsBViHpELmfD/q5lH+DIGHfIxKE/RvL/jq3T1Ja1yp729La/kV/99ZlMDLFiEinRonnjMLhhqPMT9WxH73lt7EdCKuhLHBjYDhsPJKwUZ4Zskt7kgxoiKSVUroTdjpoNLhrJnQb2/EVWwkcbsA0nlg/aIzAfOxrpDhvC43IaXDRJIYYs8YVGVGJcsAcuuotf2rG8y8g4GaNm/RUEpFkKEoSx+EZhsL7m2gvU2m0HHCTxDPGwlivuhzqbHfLv+VbryR4pyxssc5MsROpJ9UY/YsvqFuh19Om5rG83+H83DZIjhpmmMl7IotIci5mZlGhjHW+moBvetd8tcSCUAjxK3umwktvlvs3cHXvfca1E+kmde3SnDOIRzxrLE4dGF1Iv9bg6g9LHUVeVAfhxzjJhpSDcqf+tGS9soAzSINbSKASRbUZutTrhcQsiK6MGRgGVgbgg6gisCvSlKCjPMqKzsQqqCzE7AAXJPtaoC595geeaRiXUyWuuZbLGAMiWGuhBJufiZtBUr+KHEhDgmXMoMpEet7WOrbC/S31rn7GzZmZtNT0FgPkKsLDKcHwk+PkhwsdrLothou5LN3O5/iPepfw3JIjwaphcsGOhbOkp1/WfaDEC5idbi1tjcjMCKxngfwiOOBp2t50mwOjBBuQDra4tcaXQ+9SHiYzcOvxDS33x1U/zB6H2JukmXzJExVW9PmqL6E5ToMy3OuU2/IHpXziZQ0RcdBm9wVN7EdwVsR0Iq5hlDAEbH/mvY+1W2IAQlj8DaP2U7Zvl0P0OmpqI+8T6isY2Pqb90dPqbD3AasZzxxSTD4OaWG3mqhZLrm2IzHLcaAak9KuOHzkoCPVKyre97IALDP1HU5d7selyMZzLzFhMIjpOwlkkUh4wAzOCCMrLsqanQ6anck31WtrTqsblLWisblD2M4hi+Lz6gNIFbJGihSQNcoOl1udSWvYVgxgJGYpIMgUkZV6MCQSANO4zG9x3rZIsJJi52/RoCpd2Kqn2AxOhbQKLG1z36XtVbxA5ImwOGimMoYM2SVUBCoSLr6ibsNCL2GpGld04cWHU3nc/L/LmjNfJxWNf3YbhqRl1h80JGXQSNqypckZntva57AX6Xqc+WOUMPglBRc0ltZGsWPy6KPYfnXO3D2AlC3AWQZDf9rY/jY/SuiORONDEYGCV29YUJJcBTnU5DcX0uR+deGXqLWjUcR8oetcFazueZ+aMedsG2D4m7poC6zR9hmOa/yEgb8Kmbh2LE0aSL8LqrD6i9R140CFo4ZxLHmUsjAMpYqetgbmzrbT7xqn4e+JWDiw6wYico6sQpKSFSD6tWCkD1Fhr0tXpntXJhpbfMcPLFS1Mlo1xKS8Zi0iRpHIVFBLMdgBUI86c1PjJ8wuscZ/Uxnsd2cdGIufYC3zv/EPnX9LbyoGvh1OhH+Mw+0f2R0H17Wr+G3JxxDCeYfqVOgO0jA7fug79zp3r1w4YxY/LdjJkm9uyrK+F/JtguLmX9qFCOp18wj/ALR037VJdfIW1fVcOXLbJbul1Y8cUrqCop8ZeYvUMOrArFZnFyCZCPQL+yMW06sO1SnLIFBY7AEn6VzTzXxM4iZpLhjIzSE2F/UfSCewjEYt0t1rEPSGJZuu5O3epl8MfDsQRJipiRims6bHyh2IOhuDr87gggER/wCG/ATi8coAVlgHmsr3ytY2VSRqLt1sbWGhroGHFAkKwKP2PX907Efn3ApJKKvHPhpbycRlyyWMbEe13jZT2/6nuPT7VtnhvxFZcNHJYDNcHQXBez/QZi0fuY1rK89cI/SsFNEBd8udP3l9Sj62t9ajvwU4it5cMzWB0Guut3jy+9/O+pFPgfBLOGHrkP7QA+WRT/MmvmP1uW+yl1X3bZj9PhH+r2q1wuIYxkC3mtI6mw2IY3ax6BQCL73UdavxljTsqj8BURisPwaODETYtnd5ZsiLmIPlqBpHEOgLXY9zqdr1HPinyCyq3EIRaQNnljQABRpYpbUkWuSdze1hlCyrDGWPmOLH7C/cHc/tHr2Gg6lvcbKlijDMWU+gC7MNtu3S5sNdTQcsDFNmEoY5wQSb6k7g3qbfCPmISqYCTYqZowLFY/VaWPNvozKQDrZ9zUS82cIOFxksJQoCcyKSCQrXKg2uO+xI21NZHw34uYJ0+I5JFcKuhKsQkvTW4K6HfLpY1pp0dSlKyyjDxzxRAw8Ya1xKxAAJPwAG/RbZgf3hUOBcxUfea35gf1qXvHgH/wCn1axEugHp0y6lv9Q9PW4PQ1EINihvs39VNaj01Dpvl/AIMJBGVBAjQ/Ilbkjsbk61dMrxi4bMo6ObEfJ+v+rU/eqy5di8zCwMZZGDRRncLa6DqgU/nV7Jh419TKtx9phdvbU3JPtWWVonE41OZScpvnUAkqQBdvTcW2BIuNjfe8ec2eKUjO0WHSIQnMpaUF3exscqg5QpHQkmx1A2qScThjOpVhljIOhHrOlr/s/92u67VBPMvKc+GYxOrlFzZHAuGQMSGBF7bX11Fq98Fa2nmN/XTzyWmI44+m2Wk5+xZh8lJFjHqLSKCJHubkliSb3O4sapcq8BhxgkeXFrCQbEuyZzcXzXZteuluh1GxxfAuGLKSsk8EAGYEzSqpuqAkZSc19RckW976VtWD8OVmAMfEIWvpYAEg2vYgNvbX5a7V9K9sFK9tJ7f25/LhiuSbbmN/u2jhvA4Ihlj4tIqXPpjfCINVtusV9DcjXfpe5OL8QuH4YYGcnHySyhQ8aSYkOGZFAA8saG++25vpVsPCGUj/7tDf8A9P8A3rGcx+HMmDw0uIfERskalmUJYt0sLjrf864Zx4Zn+f8ADqi+SP6fyjmXFMApBGvYDvb+lb3yFxrhscEhxsPmSeZdScOZAqBVIAYXAF8x1t8XXWtPOOjFrq2v7MdbPy/ybNj8NLNAQqrmUK4ILnIG9FgQfiA33q+DHrc3j7L5b712tW4lixi55JvLSGP1ZUjQBY19TIoVR1Ohbu19qt2wijo5bqLr+fX+tVuAA2lKjM1lIS2psczG3sAfqRQzLlVMqhlJ9Q+Jr9G01PzJ+lc+9enRra55ZwlsVEsquYHkVZGUfCpNs3tbQk9Beui8Dj8MiBI5oQigBQsiWA6da51hhz2wogU4gvkBLESZs1smQ6X3WxrYJeTOIKEy4aQxKq5lAQMTf1kA6gn8dKWvaYiszxCdld93xTzDOraqysP2SD/KqtQjyhwbGxO7y4fEqPKcXjzKWk1MfwkHLckm5I201qUeSsNKmEjMzM00g8yQuTe7AWFullCi3tXmK3N8uTBYlrstoJfUu6+gjMPlv9K5snctLc/8t29q6T5tjL4PEKoJbyZCuW17hSRa/W4Glc1AWlA11NvfXuOlWFhJ3/h9KAYl2ZQ7MiqCQGIy5jYbnWpZkjVhZgCD31FRR/4e5VyYuEgE50ax7ZbH86lCXDQqMzJGvuVUfn3pJIEeP4buvYn1j5Mfi/1a76naoI5hwgwnEp4wSsUobLupVW9cdtiLMMnS2tTeIC3wB1H3meQfwx5h/wC63yNa5zFyDDxBvNeWUMsflxvdCGsbhiMuqgk2sRe5PUGkEND5U8UMRDIgxEazRKojeRb+YApJZgdmNt9iwQXJIvUtjHqxV3DhDYxgKWL9c9kzE+w6b9ssMReHGOE36O4ijW6hps4KKpJYMF+I/C1rqASpBI1NTXguDLAirCShUKuvqDACwzgm/wBQQfppSSQ43PvIIl7NYSH+LRfzPuDV5hY0A9FtdyDcn3Lbk+5qmmLscsgyHYG91b91u/sbHsDvVR8HG2pjQnuVF/5VEQ34/wCFy4rDyj7UZDe9m0/IVH/DtJiO6sDfQfD9r2vY/St88egi4nDxoNchY6ki5a1gCdN+laHhP+sx0sM2+23X29qrUOn+EyloImIIJjQkE3IuoOp6mlecEw/lwQx5bZI0WxN7WUC2brtvSoy1Pxm4YZcEHAYmKQMQNrHQlvYGxv0t2vUCzrbT6/0rqjimBSeKSF75JFKtYkGxFtCNQet65q5j4U+HnkhkFnjYggWy2OqgW6ZbVYWEv+EPMZnwawhS0sJsxOihSSVJb55lAFz6RewN63iHC2OZjmfudl9kHQfmepNc6ci8zNw/ErMLmJvTIv3lO/1Fgb9wOl66BwnGY5kR4WD51zLY7DYl/u2IIPW4IpJK8nxAWwtdj8Kjc/7dzsKssQrK6OSDI+aNeykjMLewCOSdz+AF5h4MtyTmc/E3f2A6L2H8ySTbT+rNL0Q+n5KwMh+tivyX3qI9iwiL+qZFZLHJmAN1tZlN/p8wRvY1Y8T5VwrnzDhMO5+0piT16ZdDb47aA+wB6Fcvi4sy6GzDVT2PT6bg+xNe4aXMt7WOxHUEaEf79aDBxcn4IgNHE0Y9JHlSzRWyqUX4HUggEi2lj71oPjFAmEhiw8U2JdprBopJ3kTIhuGIe5BzstrEDTbQVI/MPE0wUb4liAgtnW9i3S6X3fbTr+FQNzDxeTFzy46bQE5IE7W2A9lBJJ+81WFhhZApaxUadcxAH+1TV4e8Gx2HwMZhfDKJA0vlyxyE3YqFJkV9sig/D1A96inlPgj4rExQqNZGBe+gyDVjfe+Ukja+ltwa6Tw8KoqooAVQFUDYACwA+lJJQzzf4W42SaXEQRwDOzP5Ucrb33UOigE3uVzWBvY7CsFJwHjMqLhmw87RpYKrJEFW2g/WG3/dXRFKbNo38L/DI4NxisUVbEAERouqw3Fib9XtppoATa971JNKVEKUpQUp4g6lWF1YEEdwRY1zFzNgGgxEkbAhkcjU3JsbXuN7kHWuoah3xw5byyLjEUBJAEk1N/MF8pI21XTp8Gt76WFhrfh7xk4TiCkOEjxACsxXMAG1BtcDQ3Fztl2O1T9FhFBzG7N95tT726D5AAVy/hk81PK/xUu0X7Q3Zfn9ofXvUweGXPZxUaYSQ2xKi2ckepAPiF/ifS1vqb2NJJb5N+sJQfAP+oe/7A/qe2nW615ZAiknYdvyAHfoBSGMKoCjQfX6k7k9b9ao/G/7CH+J/wCwB/E91qItJ0ysjsBm9TS66BcuU/MLmGvYN1Jq6AMW12j7alk+XdfbcdLiwH2wvL+6hv8A6mFv/jP415gTlvGd0tb3U3y/yK++W/Wgrel16MrD2IIP5EVayRNGCyMLAXyOSF+j2JUfQjTQCvqSMoS6C4OrJ37lOze2xPYkmo58VPEJBD+jYZs0kgtIbEFBsVIOoa9wQdiCpHxWCPedeNnGcQlxFiET0qCQbZdBexIve3XpVLkfhJxOJiiy5vMcBgb2KXvJcjb0B9dOw1NYqU5VEQ3Ju59+g/M/ialXwO5d1fFsoyreOK41zW9bqfk2W/uwsLa6aSzSvaVlkqPfFvkw4qP9JhS88SnMirdpl07algBoLEnYCpCpQcnypYkEaXP0NZzk7nOfhzloyHia2dG2a2g+R7H+e1SX4heGa4jNiMIFSbKS0QChZWLZiQbgBzc76HTbUmH+IYGSGR43QpIrFWVuh/5+NaaTjwnxPwmJQKr+TMxClZCAFufUwf4bAXIva5AFta2+AxsgVCrJawykEWtbp7VyqyA7i3yqvHO40EzgfNrfzqaTTpyDiMaxK0kiLa6sWYKMykq2pP3lNafzJ4n4XDOfJYYhiCHRNgQPS2fb2PcZdRl1hI2PxOT33+u5r7jmVfhS597/AMh/SmjTZOK8Ym4lJ5+Lk8uBNQi7L7IOrHbMR8hWEx+I/SJEKx5UACQRqrHNY6AAG5JJ1tqfc194PDYjGSrFGrSyEMVjSwUWFzfZQNhcnsCdqmHkDw3TBkYifLJiDlKgAZITlscv3muT6rDpYDUm7Fbwt5M/QofOlUfpEoBIKgGFSATGD8xc2sNALem53elKyhSlKBSlKBSlKBVjxjhqYiF4ZBdHBB2uOxF9Lg2IPcVfUoOaObuWpsBiDG4awN45ALB16Mup17joatFLSESwkrOnqYLfNcf4iW3HUjcHvvXRXM3LkGOiMUyA7lHAGeNvvISND+R61BvOnIOIwDFyC8AIyzLpY/tAG6H56djViVbNy14xyLH5eKjzPayTL+AMiaXA3NiCQOpNSRwPmPBzKvk4iNvYsA56klTY3vqTbc1zficSzCzKpe+rkEMe4YDQnb1EX031q3VwNfUp7g/8NXRp1NDiFMkhzDQIp1FvtNv8nFYnmLmzC4bLI08eZSAyqwZirEBtBfbRv9Nutc4mY/5r/i396+GIvfVj7/761NGkmc5eMDyhocEpRToZW+M/ugbf81G1RqZTcsTmc7k18H8B/wA3NbfyR4ez41gxUx4cMQ8jDew1CLuxvYdhY3Nxaqqz5G5Vlx2ICKDkBBlk0/Voc2uu5JUgDv7XrojhuASGJIoxZI1CqPYC2vvVry9wGHBxCKFbAAZmNs0hAtmka2rab1lKyky9pSlEeE1TaQ9FJ+o/vVWlBbGd/wDKP8Sf3rF8c4VHilCz4MShdVuyXU/sm9xWdpQQ1xzwoa98NHMBZtHeA3JuRZgy2A0Hwk2FYI+FvEf8jp9+Lf8Aj2roGlXa7c/r4WcRP+Bbb/Ei36/b2/5pWx8veFAUhsRFO9mDBRJAiEDo1mZjfS9iNql2lQ2w/B8AuGTy4cIIkuTZWTUnck3uT7msgs7/AOUf4l/vVzSiKaueq2+or7Fe0oFKUoFKUoFKUoFeE17Sgplj90n6j+9Umnf/ACif9Sf3q5pQaFx7w4wuIOZcK8LXuTC0Shj+0puLfK3zrR+J+EOKU/qV8wa/EY0+QAzn21v9KnSlDbnr/wArOJ//AI4//bF//VXOD8LMaT+sgYC32XhJvfsXFha/fpU+Uptdo65X5DhgOZ+HySN6dZpYXAItqEWy766g/O1q3oYmT/JP8af3q8pRFss7/wCUf4l/vVRXbqtvqKq0oPAaV7SgUpSgUpSgUpSgUpSgUpSgUpSgUpSgUpSgUpSgUpSgUpSgUpSgUpSgUpSgUpSgUpSg/9k=', 0, 1);
INSERT INTO `trade_request` (`id`, `trade_request`, `remarks`, `item_id`, `user_id`, `request_date`, `image`, `decision`, `active`) VALUES (2, 2, 'Would like to pick up ', 2, 4, '2014-05-26 23:57:41', 'data:image/jpeg;base64,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', 0, 1);
INSERT INTO `trade_request` (`id`, `trade_request`, `remarks`, `item_id`, `user_id`, `request_date`, `image`, `decision`, `active`) VALUES (3, 3, 'Donate please', 3, 5, '2014-05-26 23:57:41', NULL, 0, 1);
INSERT INTO `trade_request` (`id`, `trade_request`, `remarks`, `item_id`, `user_id`, `request_date`, `image`, `decision`, `active`) VALUES (4, 4, 'Looks good', 4, 4, '2014-05-26 23:57:41', NULL, 0, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `exchange`
-- -----------------------------------------------------
START TRANSACTION;
USE `handmeroundsdb`;
INSERT INTO `exchange` (`id`, `exchange_date`, `trade_request_id`, `meeting_location_id`, `delivery_option_id`, `owner_rating`, `owner_rating_comment`, `requestor_rating`, `requestor_rating_comment`, `iscomplete`) VALUES (1, '2014-05-26 23:57:41', 1, 1, 1, 3, 'It\'s ok', 3, 'We exchanged stuff', 1);
INSERT INTO `exchange` (`id`, `exchange_date`, `trade_request_id`, `meeting_location_id`, `delivery_option_id`, `owner_rating`, `owner_rating_comment`, `requestor_rating`, `requestor_rating_comment`, `iscomplete`) VALUES (2, '2014-05-26 23:57:41', 2, 1, 1, NULL, NULL, NULL, NULL, 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `report`
-- -----------------------------------------------------
START TRANSACTION;
USE `handmeroundsdb`;
INSERT INTO `report` (`id`, `report_date`, `reason`, `image`, `user_id`, `reported_by_id`) VALUES (1, NULL, 'Trying to sell', NULL, 2, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `trade_request_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `handmeroundsdb`;
INSERT INTO `trade_request_comment` (`id`, `owner_comment`, `requestor_comment`, `comment_date`, `trade_request_id`, `user_id`) VALUES (1, NULL, 'Would like to meet at Firehouse #2', '2014-05-26 23:57:41', 1, 2);

COMMIT;

