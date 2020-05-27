/* Create Database Tables */

## difficulty might be different for different certification tests
## create a different difficulty table


DROP TABLE IF EXISTS `test_definitions`;
CREATE TABLE `test_definitions`(
    `id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `description` TEXT, 
    `dai_version` VARCHAR(15) DEFAULT '1.8.5.1',
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   
    `last_modified` TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP    
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `test_subqueries`;
CREATE TABLE `test_subqueries`(
    `id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `definition_id` INT,
    `section` INT DEFAULT 1,
    `prefix` VARCHAR(50) DEFAULT 'SELECT id FROM question_templates ',
    `definition` VARCHAR(255) DEFAULT '',
    `randomize` BOOLEAN DEFAULT TRUE,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   
    `last_modified` TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX `definition_id` (`definition_id`)
) ENGINE=InnoDB;

ALTER TABLE `test_subqueries` 
    ADD FOREIGN KEY (`definition_id`) 
        REFERENCES `test_definitions`(`id`) 
        ON DELETE RESTRICT 
        ON UPDATE RESTRICT;

DROP TABLE IF EXISTS `question_templates`;
CREATE TABLE `question_templates`(
    `id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `question` TEXT NOT NULL,
    `answer` TEXT,
    `correct` INT DEFAULT 1,
    `randomize` BOOLEAN DEFAULT 1,
    `type` ENUM (
        'True/False',
        'Multiple Choice',
        'Numeric',
        'String'
    ) NULL DEFAULT NULL,
    `aota` BOOLEAN DEFAULT FALSE COMMENT '\"All of the above\"' ,
    `nota` BOOLEAN DEFAULT FALSE COMMENT '\"None of the above\"' ,
    `epsilon` REAL DEFAULT 0.0001,
    `enabled` BOOLEAN NOT NULL DEFAULT FALSE,
    `comments` TEXT,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `last_modified` TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX `enabled`(`enabled`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions`(
    `id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `question` TEXT NOT NULL,
    `answer` TEXT,
    `item` INT UNSIGNED NOT NULL,
    `test_id` INT UNSIGNED NOT NULL,
    `template_id` INT UNSIGNED NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,    
    INDEX `test_id`(`test_id`),
    INDEX `template_id` (`template_id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `datasets`;
CREATE TABLE `datasets`(
    `id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50),
    `path` TEXT,
    `train_fraction` DECIMAL,
    `seed` INT,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP  
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `student_answers`;
CREATE TABLE `student_answers`(
    `id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `student_id` INT,
    `questions_id` INT,
    `score` REAL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   
    INDEX(`questions_id`),
    INDEX(`student_id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `tests`;
CREATE TABLE `tests`(
    `id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `definition_id` INT,
    `seed` BIGINT,
    `question_list` TEXT,
    `experiments` TEXT,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   
    PRIMARY KEY(`id`),
    INDEX(`definition_id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `label_list`;
CREATE TABLE `label_list`(
    `id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50),
    UNIQUE(`name`)    
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `labels`;
CREATE TABLE `labels`(
    `id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `templates_id` INT,
    `labellist_id` INT,
    INDEX(`templates_id`),
    INDEX(`labellist_id`)    
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `exp_definitions`;
CREATE TABLE `exp_definitions`(
    `id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50),
    `dataset_id` INT,
    `accuracy` INT,
    `time` INT,
    `interpretability` INT,
    `config_overrides` TEXT,
    `approx_runtime` INT,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   
    INDEX(`dataset_id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `experiments`;
CREATE TABLE `experiments`(
    `id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50),
    `seed` BIGINT,
    `dai_version` VARCHAR(15),
    `definition_id` INT,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   
    INDEX(`definition_id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `results`;
CREATE TABLE `results`(
    `id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `experiments_id` INT,
    `field` VARCHAR(50),
    `value` TEXT,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   
    INDEX(`experiments_id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `students`;
CREATE TABLE `students`(
    `id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `email` TEXT,
    `login` VARCHAR(50),
    `password` VARCHAR(50),
    `firstname` VARCHAR(50),
    `lastname` VARCHAR(50),
    `company` VARCHAR(50),
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

