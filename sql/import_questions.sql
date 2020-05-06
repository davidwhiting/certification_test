/* Populate with values */

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

