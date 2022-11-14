CREATE TABLE `users` (
                         `user_id` INT(64) NOT NULL AUTO_INCREMENT,
                         `name` varchar(64) NOT NULL,
                         `location_city` varchar(10) NOT NULL,
                         `location_id` varchar(16) NOT NULL,
                         `phone_number` varchar(16) NOT NULL UNIQUE,
                         `email_id` varchar(32) NOT NULL UNIQUE,
                         `metadata` varchar(1024),
                         PRIMARY KEY (`user_id`)
);

CREATE TABLE `events` (
                          `event_id` INT(64) NOT NULL AUTO_INCREMENT,
                          `event_name` varchar(64) NOT NULL,
                          `event_time` DATETIME NOT NULL,
                          `event_duration_mins` INT(10),
                          `event_city` varchar(10) NOT NULL,
                          `event_city_id` varchar(16) NOT NULL,
                          `metadata` varchar(1024),
                          PRIMARY KEY (`event_id`)
);

CREATE TABLE `challenges` (
                              `challenge_id` INT(64) NOT NULL AUTO_INCREMENT,
                              `challenger_id` INT(64) NOT NULL,
                              `challenged_id` INT(64) NOT NULL,
                              `event_id` INT(64) NOT NULL,
                              `bet_amount` FLOAT(10) NOT NULL,
                              `bet_currency` varchar(5),
                              `challenge_description` varchar(1024) NOT NULL,
                              `challenge_status` varchar(10) NOT NULL,
                              `challenge_date` DATETIME NOT NULL,
                              `challenge_judgement_time` DATETIME NOT NULL,
                              `content_url` varchar(512),
                              `metadata` DATETIME(1024),
                              PRIMARY KEY (`challenge_id`)
);

CREATE TABLE `transactions` (
                                `txn_id` INT(64) NOT NULL AUTO_INCREMENT,
                                `sender` INT(64) NOT NULL,
                                `payment_amount` FLOAT(10) NOT NULL,
                                `currency` varchar(5) NOT NULL,
                                `receiver` INT(64) NOT NULL,
                                `metadata` varchar(1024),
                                PRIMARY KEY (`txn_id`)
);





