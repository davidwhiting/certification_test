CREATE OR REPLACE TABLE `question_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `template` text,
  `type` varchar(15),
  `enabled` boolean NOT NULL,
  `created_at` timestamp default current_timestamp,
  `last_modified` timestamp default current_timestamp on update current_timestamp,
);

