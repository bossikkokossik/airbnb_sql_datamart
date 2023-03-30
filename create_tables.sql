DROP DATABASE IF EXISTS airbnb ;
CREATE DATABASE IF NOT EXISTS airbnb DEFAULT CHARACTER SET utf8 ;
USE airbnb ;


DROP TABLE IF EXISTS `airbnb`.`country` ;
CREATE TABLE IF NOT EXISTS `airbnb`.`country`
(
 `country_code` varchar(3) NOT NULL,
 `name`         varchar(45) NOT NULL,

PRIMARY KEY (`country_code`)) 
DEFAULT CHARACTER SET = utf8mb4
ENGINE=INNODB;


DROP TABLE IF EXISTS `airbnb`.`city` ;
CREATE TABLE IF NOT EXISTS `airbnb`.`city`
(
 `city_id`      int NOT NULL AUTO_INCREMENT ,
 `name`         varchar(45) NOT NULL ,
 `country_code` varchar(3) NOT NULL ,

PRIMARY KEY (`city_id`),
KEY `fk_city_country_idx` (`country_code`),
CONSTRAINT `fk_city_country` 
	FOREIGN KEY `fk_city_country_idx` (`country_code`) 
    REFERENCES `airbnb`.`country` (`country_code`) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE) 
AUTO_INCREMENT=23
DEFAULT CHARACTER SET = utf8mb4
ENGINE=INNODB;


DROP TABLE IF EXISTS `airbnb`.`coordintates` ;
CREATE TABLE IF NOT EXISTS `airbnb`.`coordintates`
(
 `coordintates_id` int NOT NULL AUTO_INCREMENT ,
 `longitude`       decimal(9,6) NOT NULL ,
 `latitude`        decimal(8,6) NOT NULL ,

PRIMARY KEY (`coordintates_id`)) 
AUTO_INCREMENT=23
DEFAULT CHARACTER SET = utf8mb4
ENGINE=INNODB;


DROP TABLE IF EXISTS `airbnb`.`address`;
CREATE TABLE IF NOT EXISTS `airbnb`.`address`
(
 `address_id`       int NOT NULL AUTO_INCREMENT,
 `country_code`     varchar(3) NOT NULL,
 `city_id`          int NOT NULL,
 `street`           varchar(100) NOT NULL,
 `house_number`     int NOT NULL,
 `apartment_number` int NOT NULL,
 `coordintates_id`  int NOT NULL,
 
PRIMARY KEY (`address_id`),
KEY `fk_idx` (`country_code`),
CONSTRAINT `fk` 
	FOREIGN KEY `fk_idx` (`country_code`) 
    REFERENCES `airbnb`.`country` (`country_code`) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
KEY `fk2_idx` (`city_id`),
CONSTRAINT `fk2` 
	FOREIGN KEY `fk2_idx` (`city_id`) 
	REFERENCES `airbnb`.`city` (`city_id`) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
KEY `fk4_idx` (`coordintates_id`),
CONSTRAINT `fk4` 
	FOREIGN KEY `fk4_idx` (`coordintates_id`) 
    REFERENCES `airbnb`.`coordintates` (`coordintates_id`) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE) 
AUTO_INCREMENT=23
DEFAULT CHARACTER SET = utf8mb4
ENGINE=INNODB;


DROP TABLE IF EXISTS `airbnb`.`amenity`;
CREATE TABLE IF NOT EXISTS `airbnb`.`amenity`
(
 `amenities_id`  int NOT NULL AUTO_INCREMENT,
 `wifi`          bit NOT NULL,
 `free_parking`  bit NOT NULL,
 `air_condition` bit NOT NULL,
 `kitchen`       bit NOT NULL,
 `washer`        bit NOT NULL,
 `pool`          bit NOT NULL,
 `dryer`         bit NOT NULL,
 `heating`       bit NOT NULL,
 `tv`            bit NOT NULL,
 `hair_dryer`    bit NOT NULL,
 `iron`          bit NOT NULL,
 `smoke_alarm`   bit NOT NULL,

PRIMARY KEY (`amenities_id`)) 
AUTO_INCREMENT=23
DEFAULT CHARACTER SET = utf8mb4
ENGINE=INNODB;


DROP TABLE IF EXISTS `airbnb`.`social_media`;
CREATE TABLE IF NOT EXISTS `airbnb`.`social_media`
(
 `social_media_id` int NOT NULL AUTO_INCREMENT,
 `facebook`        varchar(100) NULL,
 `instagram`       varchar(100) NULL,
 `twitter`         varchar(100) NULL,
 `linkedin`        varchar(100) NULL,

PRIMARY KEY (`social_media_id`)) 
AUTO_INCREMENT=23
DEFAULT CHARACTER SET = utf8mb4
ENGINE=INNODB;


DROP TABLE IF EXISTS `airbnb`.`language`;
CREATE TABLE IF NOT EXISTS `airbnb`.`language` 
(
 `language` varchar(45) NOT NULL,
PRIMARY KEY (`language`)) 
DEFAULT CHARACTER SET = utf8mb4
ENGINE=INNODB;


DROP TABLE IF EXISTS `airbnb`.`payment_method`;
CREATE TABLE IF NOT EXISTS `airbnb`.`payment_method`
(
 `payment_method_id` int NOT NULL AUTO_INCREMENT,
 `payment_method`    varchar(45) NULL,

PRIMARY KEY (`payment_method_id`)) 
AUTO_INCREMENT=23
DEFAULT CHARACTER SET = utf8mb4
ENGINE=INNODB;


DROP TABLE IF EXISTS `airbnb`.`user` ;
CREATE TABLE IF NOT EXISTS `airbnb`.`user` 
(
 `user_id`           int NOT NULL AUTO_INCREMENT,
 `first_name`        varchar(45) NOT NULL,
 `payment_method_id` int NOT NULL,
 `last_name`         varchar(45) NOT NULL,
 `gender`            bit NOT NULL,
 `password`          varchar(45) NOT NULL,
 `email`             varchar(45) NOT NULL,
 `phone`             varchar(45) NOT NULL,
 `user_type`         bit NOT NULL,
 `language`          varchar(45) NOT NULL DEFAULT 'english',
 `social_media_id`   int NOT NULL,
PRIMARY KEY (`user_id`),
KEY `FK_4` (`payment_method_id`),
CONSTRAINT `FK_27_2` 
	FOREIGN KEY `FK_4` (`payment_method_id`) 
    REFERENCES `airbnb`.`payment_method` (`payment_method_id`),
KEY `fk_user_social_media1_idx` (`social_media_id`),
CONSTRAINT `fk_user_social_media1` 
	FOREIGN KEY `fk_user_social_media1_idx` (`social_media_id`) 
    REFERENCES `airbnb`.`social_media` (`social_media_id`),
KEY `language_idx` (`language`),
CONSTRAINT `language` 
	FOREIGN KEY `language_idx` (`language`) 
    REFERENCES `airbnb`.`language` (`language`) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE) 
AUTO_INCREMENT=23
DEFAULT CHARACTER SET = utf8mb4
ENGINE=INNODB;


DROP TABLE IF EXISTS `airbnb`.`rooms_beds`;
CREATE TABLE IF NOT EXISTS `airbnb`.`rooms_beds` 
(
 `rooms_beds_id` int NOT NULL AUTO_INCREMENT,
 `bedrooms`      int NULL,
 `beds`          int NULL,
 `bathrooms`     int NULL,

PRIMARY KEY (`rooms_beds_id`))
AUTO_INCREMENT=23
DEFAULT CHARACTER SET = utf8mb4
ENGINE=INNODB;


DROP TABLE IF EXISTS `airbnb`.`property_type`;
CREATE TABLE IF NOT EXISTS `airbnb`.`property_type` 
(
 `property_type_id` int NOT NULL AUTO_INCREMENT,
 `property_type`    enum('private_room', 'shared_room', 'hotel_room', 'apartment') NOT NULL,

PRIMARY KEY (`property_type_id`))
AUTO_INCREMENT=23
DEFAULT CHARACTER SET = utf8mb4
ENGINE=INNODB;


DROP TABLE IF EXISTS `airbnb`.`property`;
CREATE TABLE IF NOT EXISTS `airbnb`.`property`
(
 `property_id`      int NOT NULL AUTO_INCREMENT,
 `name`             varchar(45) NOT NULL,
 `date_created`     datetime NOT NULL,
 `description`      varchar(500) NOT NULL,
 `address_id`       int NOT NULL,
 `amenities_id`     int NOT NULL,
 `rooms_beds_id`    int NOT NULL,
 `property_type_id` int NOT NULL,
 `user_id`          int NOT NULL,

PRIMARY KEY (`property_id`),
KEY `FK_6` (`rooms_beds_id`),
CONSTRAINT `FK_26` 
	FOREIGN KEY `FK_6` (`rooms_beds_id`) 
    REFERENCES `airbnb`.`rooms_beds` (`rooms_beds_id`),
KEY `FK_6_1` (`amenities_id`),
CONSTRAINT `FK_30` 
	FOREIGN KEY `FK_6_1` (`amenities_id`) 
    REFERENCES `airbnb`.`amenity` (`amenities_id`),
KEY `fk_property_address1_idx` (`address_id`),
CONSTRAINT `fk_property_address1` 
	FOREIGN KEY `fk_property_address1_idx` (`address_id`) 
    REFERENCES `airbnb`.`address` (`address_id`) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
KEY `fk_property_user1_idx` (`user_id`),
CONSTRAINT `fk_property_user1` 
	FOREIGN KEY `fk_property_user1_idx` (`user_id`) 
	REFERENCES `airbnb`.`user` (`user_id`) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
KEY `fl_property_amenities_idx` (`property_type_id`),
CONSTRAINT `fk_property_type_of_place1` 
	FOREIGN KEY `fl_property_amenities_idx` (`property_type_id`) 
    REFERENCES `airbnb`.`property_type` (`property_type_id`) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE) 
AUTO_INCREMENT=23
DEFAULT CHARACTER SET = utf8mb4
ENGINE=INNODB;



DROP TABLE IF EXISTS `airbnb`.`review`;
CREATE TABLE IF NOT EXISTS `airbnb`.`review`
(
 `review_id`      int NOT NULL AUTO_INCREMENT ,
 `review_content` varchar(500) NULL ,
 `rating`         int NULL ,
 `date_reviewed`  datetime NULL ,
 `user_id`        int NOT NULL ,
 `property_id`    int NOT NULL ,
 
PRIMARY KEY (`review_id`),
KEY `FK_3` (`property_id`),
CONSTRAINT `FK_23_2` 
	FOREIGN KEY `FK_3` (`property_id`) 
    REFERENCES `airbnb`.`property` (`property_id`),
KEY `fk_review_rating_user1_idx` (`user_id`),
CONSTRAINT `fk_review_rating_user1` 
	FOREIGN KEY `fk_review_rating_user1_idx` (`user_id`) 
    REFERENCES `airbnb`.`user` (`user_id`) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE) 
AUTO_INCREMENT=23
DEFAULT CHARACTER SET = utf8mb4
ENGINE=INNODB;

DROP TABLE IF EXISTS `airbnb`.`guests`;
CREATE TABLE IF NOT EXISTS `airbnb`.`guests`
(
 `guests_id` int NOT NULL AUTO_INCREMENT,
 `adults`    int NOT NULL,
 `children`  int NULL,
 `babies`    int NULL,
 `pets`      int NULL,

PRIMARY KEY (`guests_id`))
AUTO_INCREMENT=23
DEFAULT CHARACTER SET = utf8mb4
ENGINE=INNODB;


DROP TABLE IF EXISTS `airbnb`.`payment`;
CREATE TABLE IF NOT EXISTS `airbnb`.`payment`
(
 `payment_id`        int NOT NULL AUTO_INCREMENT ,
 `payment_date`      datetime NOT NULL ,
 `amount`            double NOT NULL ,
 `payment_method_id` int NOT NULL ,

PRIMARY KEY (`payment_id`),
KEY `FK_3` (`payment_method_id`),
CONSTRAINT `FK_27` 
	FOREIGN KEY `FK_3` (`payment_method_id`) 
    REFERENCES `airbnb`.`payment_method` (`payment_method_id`))
AUTO_INCREMENT=23
DEFAULT CHARACTER SET = utf8mb4
ENGINE=INNODB;



DROP TABLE IF EXISTS `airbnb`.`booking`;
CREATE TABLE IF NOT EXISTS `airbnb`.`booking`
(
 `booking_id`  int NOT NULL AUTO_INCREMENT ,
 `check_in`    date NOT NULL ,
 `check_out`   date NOT NULL ,
 `guests_id`   int NOT NULL ,
 `property_id` int NOT NULL ,
 `user_id`     int NOT NULL ,
 `payment_id`  int NOT NULL ,

PRIMARY KEY (`booking_id`),
KEY `FK_3` (`property_id`),
CONSTRAINT `FK_24` 
	FOREIGN KEY `FK_3` (`property_id`) 
    REFERENCES `airbnb`.`property` (`property_id`),
KEY `FK_4` (`guests_id`),
CONSTRAINT `FK_25` 
	FOREIGN KEY `FK_4` (`guests_id`) 
    REFERENCES `airbnb`.`guests` (`guests_id`),
KEY `FK_5` (`payment_id`),
CONSTRAINT `FK_26_1` 
	FOREIGN KEY `FK_5` (`payment_id`) 
    REFERENCES `airbnb`.`payment` (`payment_id`),
KEY `fk_booking_user1_idx` (`user_id`),
CONSTRAINT `fk_booking_user1` 
	FOREIGN KEY `fk_booking_user1_idx` (`user_id`) 
    REFERENCES `airbnb`.`user` (`user_id`) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE)
AUTO_INCREMENT=23
DEFAULT CHARACTER SET = utf8mb4
ENGINE=INNODB;


DROP TABLE IF EXISTS `airbnb`.`tax`;
CREATE TABLE IF NOT EXISTS `airbnb`.`tax`
(
 `tax_id`       int NOT NULL AUTO_INCREMENT,
 `tax_name`     varchar(45) NOT NULL,
 `tax_value`    double NOT NULL,
 `country_code` varchar(3) NOT NULL,

PRIMARY KEY (`tax_id`),
KEY `FK_2` (`country_code`),
CONSTRAINT `FK_27_3` 
	FOREIGN KEY `FK_2` (`country_code`) 
    REFERENCES `airbnb`.`country` (`country_code`))
AUTO_INCREMENT=23
DEFAULT CHARACTER SET = utf8mb4
ENGINE=INNODB;



DROP TABLE IF EXISTS `airbnb`.`price`;
CREATE TABLE IF NOT EXISTS `airbnb`.`price`
(
 `price_id`     int NOT NULL AUTO_INCREMENT ,
 `base_price`   double NOT NULL ,
 `discount`     double NOT NULL ,
 `platform_fee` double NOT NULL ,
 `cleaning_fee` double NOT NULL ,
 `tax_id`       int NOT NULL ,
 `property_id`  int NOT NULL ,

PRIMARY KEY (`price_id`),
KEY `FK_2` (`property_id`),
CONSTRAINT `FK_29` 
	FOREIGN KEY `FK_2` (`property_id`) 
    REFERENCES `airbnb`.`property` (`property_id`),
KEY `FK_3` (`tax_id`),
CONSTRAINT `FK_28_1` 
	FOREIGN KEY `FK_3` (`tax_id`) 
    REFERENCES `airbnb`.`tax` (`tax_id`))
AUTO_INCREMENT=23
DEFAULT CHARACTER SET = utf8mb4
ENGINE=INNODB;


DROP TABLE IF EXISTS `airbnb`.`wishlist`;
CREATE TABLE IF NOT EXISTS `airbnb`.`wishlist`
(
 `wishlist_id` int NOT NULL AUTO_INCREMENT ,
 `name`        varchar(45) NOT NULL ,
 `user_id`     int NOT NULL ,

PRIMARY KEY (`wishlist_id`),
KEY `fk_wishlist_user1_idx` (`user_id`),
CONSTRAINT `fk_wishlist_user1` 
	FOREIGN KEY `fk_wishlist_user1_idx` (`user_id`) 
    REFERENCES `airbnb`.`user` (`user_id`))
AUTO_INCREMENT=23
DEFAULT CHARACTER SET = utf8mb4
ENGINE=INNODB;



DROP TABLE IF EXISTS `airbnb`.`in_wishlist`;
CREATE TABLE IF NOT EXISTS `airbnb`.`in_wishlist`
(
 `wishlist_id` int NOT NULL ,
 `property_id` int NOT NULL ,

KEY `FK_3` (`property_id`),
CONSTRAINT `FK_28` FOREIGN KEY `FK_3` (`property_id`) REFERENCES `airbnb`.`property` (`property_id`),
KEY `fk_wishlist_has_property_wishlist1_idx` (`wishlist_id`),
CONSTRAINT `fk_wishlist_has_property_wishlist1` 
	FOREIGN KEY `fk_wishlist_has_property_wishlist1_idx` (`wishlist_id`) 
    REFERENCES `airbnb`.`wishlist` (`wishlist_id`) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE)
AUTO_INCREMENT=23
DEFAULT CHARACTER SET = utf8mb4
ENGINE=INNODB;


DROP TABLE IF EXISTS `airbnb`.`message`;
CREATE TABLE IF NOT EXISTS `airbnb`.`message`
(
 `message_id`      int NOT NULL AUTO_INCREMENT,
 `message_content` varchar(500) NOT NULL,
 `sender_id`       int NOT NULL,
 `receiver_id`     int NOT NULL,

PRIMARY KEY (`message_id`),
KEY `receiver_idx` (`receiver_id`),
CONSTRAINT `receiver` 
	FOREIGN KEY `receiver_idx` (`receiver_id`) 
    REFERENCES `airbnb`.`user` (`user_id`) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
KEY `sender_idx` (`sender_id`),
CONSTRAINT `sender` 
	FOREIGN KEY `sender_idx` (`sender_id`) 
    REFERENCES `airbnb`.`user` (`user_id`) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE)
AUTO_INCREMENT=23
DEFAULT CHARACTER SET = utf8mb4
ENGINE=INNODB;



DROP TABLE IF EXISTS `airbnb`.`image`;
CREATE TABLE IF NOT EXISTS `airbnb`.`image`
(
 `profile_picture_id` int NOT NULL AUTO_INCREMENT ,
 `image`              varchar(10) NOT NULL ,
 `active`             bit NOT NULL ,
 `user_id`            int NOT NULL ,

PRIMARY KEY (`profile_picture_id`),
KEY `FK_2` (`user_id`),
CONSTRAINT `FK_23` 
	FOREIGN KEY `FK_2` (`user_id`) 
    REFERENCES `airbnb`.`user` (`user_id`))
AUTO_INCREMENT=23
DEFAULT CHARACTER SET = utf8mb4
ENGINE=INNODB;



DROP TABLE IF EXISTS `airbnb`.`property_photo`;
CREATE TABLE IF NOT EXISTS `airbnb`.`property_photo`
(
 `photo_id`    int NOT NULL AUTO_INCREMENT ,
 `photo`       varchar(10) NOT NULL ,
 `description` varchar(100) NOT NULL ,
 `property_id` int NOT NULL ,

PRIMARY KEY (`photo_id`),
KEY `FK_2` (`property_id`),
CONSTRAINT `FK_29_1` 
	FOREIGN KEY `FK_2` (`property_id`) 
    REFERENCES `airbnb`.`property` (`property_id`))
AUTO_INCREMENT=23
DEFAULT CHARACTER SET = utf8mb4
ENGINE=INNODB;
