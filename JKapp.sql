﻿
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Utworzenie bazy danych
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS JKapp DEFAULT  CHARACTER SET utf8 COLLATE utf8_unicode_ci;
use JKapp;


-- -----------------------------------------------------
 -- Table `uzytkownik`
 -- -----------------------------------------------------
 CREATE TABLE IF NOT EXISTS `uzytkownik` (
  `id` INT NOT NULL AUTO_INCREMENT,
   `imie` VARCHAR(30) NOT NULL,
   `nazwisko` VARCHAR(30) NOT NULL,
  `adres` VARCHAR(50) NOT NULL,
   `telefon` INT NOT NULL,
   `email` VARCHAR(30) NOT NULL,
   `login` VARCHAR(30) NOT NULL,
   `haslo` VARCHAR(40) NOT NULL,
   PRIMARY KEY (`id`))
 ENGINE = InnoDB;
 
 
 -- -----------------------------------------------------
 -- Table `roles`
 -- -----------------------------------------------------
 CREATE TABLE IF NOT EXISTS `roles` (
   `id` INT NOT NULL AUTO_INCREMENT,
   `name` VARCHAR(30) NOT NULL,
   PRIMARY KEY (`id`))
 ENGINE = InnoDB;
 
 
 -- -----------------------------------------------------
 -- Table `users_roles`
 -- -----------------------------------------------------
 CREATE TABLE IF NOT EXISTS `users_roles` (
   `user_id` INT NOT NULL,
   `role_id` INT NOT NULL,
   INDEX `fk_user_roles_uzytkownik_idx` (`user_id` ASC),
   INDEX `fk_user_roles_roles1_idx` (`role_id` ASC),
   PRIMARY KEY (`user_id`, `role_id`),
   CONSTRAINT `fk_user_roles_uzytkownik`
     FOREIGN KEY (`user_id`)
     REFERENCES `uzytkownik` (`id`)
     ON DELETE NO ACTION
     ON UPDATE NO ACTION,
   CONSTRAINT `fk_user_roles_roles1`
     FOREIGN KEY (`role_id`)
     REFERENCES `roles` (`id`)
     ON DELETE NO ACTION
     ON UPDATE NO ACTION)
 ENGINE = InnoDB;
 
 
 -- -----------------------------------------------------
 -- Table `kategoria`
 -- -----------------------------------------------------
 CREATE TABLE IF NOT EXISTS `kategoria` (
   `id_kategorii` INT NOT NULL AUTO_INCREMENT,
   `nazwa` VARCHAR(30) NOT NULL,
   PRIMARY KEY (`id_kategorii`))
 ENGINE = InnoDB;
 
 
 -- -----------------------------------------------------
 -- Table `zdjecia`
 -- -----------------------------------------------------
 CREATE TABLE IF NOT EXISTS `zdjecia` (
   `id` INT NOT NULL AUTO_INCREMENT,
   `id_kategorii` INT NOT NULL,
   PRIMARY KEY (`id`),
   INDEX `fk_zdjecie_kategoria1_idx` (`id_kategorii` ASC),
   CONSTRAINT `fk_zdjecie_kategoria1`
     FOREIGN KEY (`id_kategorii`)
     REFERENCES `kategoria` (`id_kategorii`)
     ON DELETE NO ACTION
     ON UPDATE NO ACTION)
 ENGINE = InnoDB;
 
 
 
 SET SQL_MODE=@OLD_SQL_MODE;
 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
 
 
 
 
 INSERT INTO roles (id,name) VALUES (1,'admin');
 INSERT INTO uzytkownik(id,login,email,haslo) VALUES (1,'admin','admin@admin.pl',sha1('P@$$word'));
 INSERT INTO users_roles(user_id,role_id) VALUES (1,1);
 
 
 