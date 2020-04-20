/* Create Database Tables */

## difficulty might be different for different certification tests
## create a different difficulty table

DROP TABLE IF EXISTS `question_templates`;
CREATE TABLE `question_templates`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
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
    `tags` SET (
        'Easy',
        'Medium',
        'Hard',
        'AutoViz',
        'Datasets',
        'Experiments',
        'Expert Settings',
        'MLI',
        'Models',
        'Recipes',
        'Scorers',
        'Scoring Pipeline',
        'Shapley',
        'Time Series'
    ) NULL DEFAULT NULL,
    `aota` BOOLEAN DEFAULT FALSE COMMENT '\"All of the above\"' ,
    `nota` BOOLEAN DEFAULT FALSE COMMENT '\"None of the above\"' ,
    `epsilon` REAL DEFAULT 0.0001,
    `enabled` BOOLEAN NOT NULL DEFAULT FALSE,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `last_modified` TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(`id`),
    INDEX `enabled`(`enabled`)
);

DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `question` TEXT NOT NULL,
    `answer` TEXT,
    `item` INT UNSIGNED NOT NULL,
    `test_id` INT UNSIGNED NOT NULL,
    `template_id` INT UNSIGNED NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,    
    PRIMARY KEY(`id`),
    INDEX `test_id`(`test_id`),
    INDEX `template_id` (`template_id`)
);

DROP TABLE IF EXISTS `test_definitions`;
CREATE TABLE `test_definitions`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR,
    `code` TEXT,
    `description` TEXT, 
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,    
    PRIMARY KEY(`id`)
);

## 

## Populate with values

INSERT INTO `question_templates` (`question`, `answer`, `type`, `tags`) 
    VALUES ('Recipes need to be added to Driverless AI each time you want to use it for an experiment.', 
        'False', 'True/False', 'Easy');

INSERT INTO `question_templates` (`question`, `answer`, `type`) 
    VALUES ('Which graph will show your variables which could be good candidates for transformation before being used in modeling?', 
        '["Skewed Histograms", "Outliers", "Spikey Histograms", "Correlation Graph"]', 
        'Multiple Choice');

INSERT INTO `question_templates` (`question`, `answer`, `correct`, `randomize`, `type`, `tags`) 
    VALUES ('For regression problems, which type of sampling will Driverless AI perform at the start of an experiment?', 
        '[\"Stratified\", \"Systematic\", \"Cluster\", \"Random\"]', 
        '4', 
        '1', 
        'Multiple Choice', 
        'Medium,Experiments', 
        );

