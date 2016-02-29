-- MySQL Workbench Synchronization
-- Generated: 2016-02-23 21:47
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Cyril

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `medicament_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;

CREATE TABLE IF NOT EXISTS `medicament_db`.`user` (
  `user_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_type_id` INT(10) UNSIGNED NOT NULL,
  `username` VARCHAR(50) NOT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `password` VARCHAR(32) NOT NULL,
  `create_time` DATETIME NULL DEFAULT NULL,
  `user_address_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`),
  INDEX `fk_user_user_type_idx` (`user_type_id` ASC),
  INDEX `fk_user_user_address1_idx` (`user_address_id` ASC),
  CONSTRAINT `fk_user_user_type`
    FOREIGN KEY (`user_type_id`)
    REFERENCES `medicament_db`.`user_type` (`user_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_user_address1`
    FOREIGN KEY (`user_address_id`)
    REFERENCES `medicament_db`.`user_address` (`user_address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `medicament_db`.`user_type` (
  `user_type_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_type_name` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`user_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `medicament_db`.`region` (
  `region_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `region_parent_id` INT(11) NOT NULL,
  `region_name` VARCHAR(45) NOT NULL,
  `region_type` INT(11) NOT NULL DEFAULT 2,
  PRIMARY KEY (`region_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `medicament_db`.`user_address` (
  `user_address_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `region_province_id` INT(10) UNSIGNED NOT NULL,
  `region_city_id` INT(10) UNSIGNED NOT NULL,
  `region_country_id` INT(10) UNSIGNED NOT NULL,
  `user_address` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`user_address_id`),
  INDEX `fk_user_address_region1_idx` (`region_province_id` ASC),
  INDEX `fk_user_address_region2_idx` (`region_city_id` ASC),
  INDEX `fk_user_address_region3_idx` (`region_country_id` ASC),
  CONSTRAINT `fk_user_address_region1`
    FOREIGN KEY (`region_province_id`)
    REFERENCES `medicament_db`.`region` (`region_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_address_region2`
    FOREIGN KEY (`region_city_id`)
    REFERENCES `medicament_db`.`region` (`region_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_address_region3`
    FOREIGN KEY (`region_country_id`)
    REFERENCES `medicament_db`.`region` (`region_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `medicament_db`.`client` (
  `client_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_name` VARCHAR(100) NOT NULL,
  `client_alias` VARCHAR(100) NULL DEFAULT NULL,
  `client_rank` VARCHAR(45) NULL DEFAULT NULL,
  `client_ownership` VARCHAR(45) NULL DEFAULT NULL,
  `client_contact` VARCHAR(45) NULL DEFAULT NULL,
  `client_call` VARCHAR(45) NULL DEFAULT NULL,
  `client_address_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`client_id`),
  INDEX `fk_client_client_address1_idx` (`client_address_id` ASC),
  CONSTRAINT `fk_client_client_address1`
    FOREIGN KEY (`client_address_id`)
    REFERENCES `medicament_db`.`client_address` (`client_address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `medicament_db`.`client_address` (
  `client_address_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `region_province_id` INT(10) UNSIGNED NOT NULL,
  `region_city_id` INT(10) UNSIGNED NOT NULL,
  `region_country_id` INT(10) UNSIGNED NOT NULL,
  `client_address` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`client_address_id`),
  INDEX `fk_client_address_region1_idx` (`region_province_id` ASC),
  INDEX `fk_client_address_region2_idx` (`region_city_id` ASC),
  INDEX `fk_client_address_region3_idx` (`region_country_id` ASC),
  CONSTRAINT `fk_client_address_region1`
    FOREIGN KEY (`region_province_id`)
    REFERENCES `medicament_db`.`region` (`region_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_address_region2`
    FOREIGN KEY (`region_city_id`)
    REFERENCES `medicament_db`.`region` (`region_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_address_region3`
    FOREIGN KEY (`region_country_id`)
    REFERENCES `medicament_db`.`region` (`region_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `medicament_db`.`manufacturer` (
  `manufacturer_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `manufacturer_name` VARCHAR(45) NULL DEFAULT NULL,
  `manufacturer_alias` VARCHAR(45) NULL DEFAULT NULL,
  `manufacturer_address_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`manufacturer_id`),
  INDEX `fk_manufacturer_manufacturer_address1_idx` (`manufacturer_address_id` ASC),
  CONSTRAINT `fk_manufacturer_manufacturer_address1`
    FOREIGN KEY (`manufacturer_address_id`)
    REFERENCES `medicament_db`.`manufacturer_address` (`manufacturer_address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `medicament_db`.`manufacturer_address` (
  `manufacturer_address_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `region_province_id` INT(10) UNSIGNED NOT NULL,
  `region_city_id` INT(10) UNSIGNED NOT NULL,
  `region_country_id` INT(10) UNSIGNED NOT NULL,
  `manufacturer_address` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`manufacturer_address_id`),
  INDEX `fk_manufacturer_address_region1_idx` (`region_province_id` ASC),
  INDEX `fk_manufacturer_address_region2_idx` (`region_city_id` ASC),
  INDEX `fk_manufacturer_address_region3_idx` (`region_country_id` ASC),
  CONSTRAINT `fk_manufacturer_address_region1`
    FOREIGN KEY (`region_province_id`)
    REFERENCES `medicament_db`.`region` (`region_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_manufacturer_address_region2`
    FOREIGN KEY (`region_city_id`)
    REFERENCES `medicament_db`.`region` (`region_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_manufacturer_address_region3`
    FOREIGN KEY (`region_country_id`)
    REFERENCES `medicament_db`.`region` (`region_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `medicament_db`.`product` (
  `product_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NULL DEFAULT NULL,
  `product_chemical_name` VARCHAR(45) NULL DEFAULT NULL,
  `product_specification` VARCHAR(45) NULL DEFAULT NULL,
  `manufacturer_id` INT(10) UNSIGNED NOT NULL,
  `product_num` INT(10) UNSIGNED NOT NULL,
  `repository_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`product_id`),
  INDEX `fk_product_manufacturer1_idx` (`manufacturer_id` ASC),
  INDEX `fk_product_repository1_idx` (`repository_id` ASC),
  CONSTRAINT `fk_product_manufacturer1`
    FOREIGN KEY (`manufacturer_id`)
    REFERENCES `medicament_db`.`manufacturer` (`manufacturer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_repository1`
    FOREIGN KEY (`repository_id`)
    REFERENCES `medicament_db`.`repository` (`repository_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `medicament_db`.`repository` (
  `repository_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `repository_name` VARCHAR(45) NULL DEFAULT NULL,
  `repository_address_id` INT(10) UNSIGNED NOT NULL,
  `repository_contact_name` VARCHAR(45) NULL DEFAULT NULL,
  `repository_contact_call` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`repository_id`),
  INDEX `fk_repository_repository_address1_idx` (`repository_address_id` ASC),
  CONSTRAINT `fk_repository_repository_address1`
    FOREIGN KEY (`repository_address_id`)
    REFERENCES `medicament_db`.`repository_address` (`repository_address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `medicament_db`.`repository_address` (
  `repository_address_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `region_province_id` INT(10) UNSIGNED NOT NULL,
  `region_city_id` INT(10) UNSIGNED NOT NULL,
  `region_country_id` INT(10) UNSIGNED NOT NULL,
  `repository_address` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`repository_address_id`),
  INDEX `fk_repository_address_region1_idx` (`region_province_id` ASC),
  INDEX `fk_repository_address_region2_idx` (`region_city_id` ASC),
  INDEX `fk_repository_address_region3_idx` (`region_country_id` ASC),
  CONSTRAINT `fk_repository_address_region1`
    FOREIGN KEY (`region_province_id`)
    REFERENCES `medicament_db`.`region` (`region_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_repository_address_region2`
    FOREIGN KEY (`region_city_id`)
    REFERENCES `medicament_db`.`region` (`region_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_repository_address_region3`
    FOREIGN KEY (`region_country_id`)
    REFERENCES `medicament_db`.`region` (`region_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `medicament_db`.`order` (
  `order_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` INT(10) UNSIGNED NOT NULL,
  `order_status` INT(11) NOT NULL DEFAULT 0,
  `order_total_money` INT(11) NOT NULL,
  `order_create_timestamps` DATETIME NOT NULL,
  `order_complete_timestamps` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_order_client1_idx` (`client_id` ASC),
  CONSTRAINT `fk_order_client1`
    FOREIGN KEY (`client_id`)
    REFERENCES `medicament_db`.`client` (`client_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `medicament_db`.`order_detail` (
  `order_detail_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` INT(10) UNSIGNED NOT NULL,
  `product_id` INT(10) UNSIGNED NOT NULL,
  `product_num` INT(10) UNSIGNED NOT NULL,
  `order_detail_total_money` INT(11) NOT NULL,
  PRIMARY KEY (`order_detail_id`),
  INDEX `fk_order_detail_product1_idx` (`product_id` ASC),
  INDEX `fk_order_detail_order1_idx` (`order_id` ASC),
  CONSTRAINT `fk_order_detail_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `medicament_db`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_detail_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `medicament_db`.`order` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `medicament_db`.`bill_order` (
  `bill_order_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` INT(10) UNSIGNED NOT NULL,
  `bill_order_code` VARCHAR(45) NULL DEFAULT NULL,
  `bill_order_head` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`bill_order_id`),
  INDEX `fk_bill_order1_idx` (`order_id` ASC),
  CONSTRAINT `fk_bill_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `medicament_db`.`order` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `medicament_db`.`purchase` (
  `purchase_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `purchase_total_money` INT(11) NULL DEFAULT NULL,
  `purchase_contact_name` VARCHAR(45) NULL DEFAULT NULL,
  `purchase_contact_call` VARCHAR(45) NULL DEFAULT NULL,
  `purchase_create_timestamps` DATETIME NULL DEFAULT NULL,
  `purchase_complete_timestamps` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`purchase_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `medicament_db`.`purchase_detail` (
  `purchase_detail_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `purchase_id` INT(10) UNSIGNED NOT NULL,
  `product_id` INT(10) UNSIGNED NOT NULL,
  `product_num` INT(11) NULL DEFAULT NULL,
  `purchase_detail_total_money` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`purchase_detail_id`),
  INDEX `fk_purchase_detail_purchase1_idx` (`purchase_id` ASC),
  INDEX `fk_purchase_detail_product1_idx` (`product_id` ASC),
  CONSTRAINT `fk_purchase_detail_purchase1`
    FOREIGN KEY (`purchase_id`)
    REFERENCES `medicament_db`.`purchase` (`purchase_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_detail_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `medicament_db`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `medicament_db`.`bill_purchase` (
  `bill_purchase_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `purchase_id` INT(10) UNSIGNED NOT NULL,
  `bill_purchase_code` VARCHAR(45) NULL DEFAULT NULL,
  `bill_purchase_head` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`bill_purchase_id`),
  INDEX `fk_bill_purchase_purchase1_idx` (`purchase_id` ASC),
  CONSTRAINT `fk_bill_purchase_purchase1`
    FOREIGN KEY (`purchase_id`)
    REFERENCES `medicament_db`.`purchase` (`purchase_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `medicament_db`.`price` (
  `price_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` INT(11) ZEROFILL NOT NULL,
  `price_destination_id` INT(11) ZEROFILL NOT NULL,
  `price` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`price_id`),
  INDEX `fk_price_product1_idx` (`product_id` ASC),
  INDEX `fk_price_region1_idx` (`price_destination_id` ASC),
  CONSTRAINT `fk_price_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `medicament_db`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_price_region1`
    FOREIGN KEY (`price_destination_id`)
    REFERENCES `medicament_db`.`region` (`region_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `medicament_db`.`dispatch` (
  `dispatch_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `dispatch_timestamps` DATETIME NULL DEFAULT NULL,
  `dispatch_comment` VARCHAR(256) NULL DEFAULT NULL,
  `repository_from_id` INT(10) UNSIGNED NOT NULL,
  `repository_to_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`dispatch_id`),
  INDEX `fk_dispatch_repository1_idx` (`repository_from_id` ASC),
  INDEX `fk_dispatch_repository2_idx` (`repository_to_id` ASC),
  CONSTRAINT `fk_dispatch_repository1`
    FOREIGN KEY (`repository_from_id`)
    REFERENCES `medicament_db`.`repository` (`repository_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dispatch_repository2`
    FOREIGN KEY (`repository_to_id`)
    REFERENCES `medicament_db`.`repository` (`repository_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `medicament_db`.`dispatch_detail` (
  `dispatch_detail` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `dispatch_id` INT(10) UNSIGNED NOT NULL,
  `product_id` INT(10) UNSIGNED NOT NULL,
  `product_num` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`dispatch_detail`),
  INDEX `fk_dispatch_detail_product1_idx` (`product_id` ASC),
  INDEX `fk_dispatch_detail_dispatch1_idx` (`dispatch_id` ASC),
  CONSTRAINT `fk_dispatch_detail_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `medicament_db`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dispatch_detail_dispatch1`
    FOREIGN KEY (`dispatch_id`)
    REFERENCES `medicament_db`.`dispatch` (`dispatch_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
