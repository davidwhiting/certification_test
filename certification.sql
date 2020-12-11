-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8306
-- Generation Time: Dec 11, 2020 at 02:43 PM
-- Server version: 5.7.26
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `certification`
--
CREATE DATABASE IF NOT EXISTS `certification` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `certification`;

-- --------------------------------------------------------

--
-- Table structure for table `datasets`
--

DROP TABLE IF EXISTS `datasets`;
CREATE TABLE `datasets` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `path` text,
  `train_fraction` decimal(10,0) DEFAULT NULL,
  `seed` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `experiments`
--

DROP TABLE IF EXISTS `experiments`;
CREATE TABLE `experiments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `seed` bigint(20) DEFAULT NULL,
  `dai_version` varchar(15) DEFAULT NULL,
  `definition_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_definitions`
--

DROP TABLE IF EXISTS `exp_definitions`;
CREATE TABLE `exp_definitions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `dataset_id` int(11) DEFAULT NULL,
  `accuracy` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `interpretability` int(11) DEFAULT NULL,
  `config_overrides` text,
  `approx_runtime` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `labels`
--

DROP TABLE IF EXISTS `labels`;
CREATE TABLE `labels` (
  `id` int(10) UNSIGNED NOT NULL,
  `templates_id` int(11) DEFAULT NULL,
  `labellist_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `labels`
--

INSERT INTO `labels` (`id`, `templates_id`, `labellist_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 11, 2),
(12, 12, 2),
(13, 13, 2),
(14, 14, 2),
(15, 15, 2),
(18, 16, 3),
(19, 17, 3),
(20, 18, 3),
(21, 19, 3),
(22, 20, 3),
(23, 21, 3),
(24, 22, 3),
(25, 23, 3),
(26, 24, 3),
(27, 25, 3),
(28, 26, 3),
(29, 27, 3),
(30, 28, 3),
(31, 29, 3),
(32, 30, 3),
(33, 31, 3),
(34, 32, 3),
(35, 33, 3),
(36, 34, 3),
(37, 35, 3),
(38, 36, 3),
(39, 37, 3),
(40, 38, 3),
(41, 39, 3),
(42, 40, 3),
(43, 41, 3),
(44, 42, 3),
(45, 43, 3),
(46, 44, 3),
(47, 45, 3),
(48, 46, 3),
(49, 47, 3),
(50, 48, 3),
(51, 49, 3),
(52, 84, 3),
(53, 85, 3),
(54, 86, 3),
(55, 87, 3),
(56, 88, 3),
(57, 89, 3),
(58, 90, 3),
(59, 91, 3),
(60, 92, 3),
(61, 93, 3),
(62, 94, 3),
(63, 95, 3),
(64, 110, 3),
(118, 34, 4),
(119, 84, 4),
(120, 85, 4),
(121, 86, 4),
(122, 87, 4),
(123, 88, 4),
(124, 89, 4),
(125, 90, 4),
(126, 91, 4),
(127, 92, 4),
(128, 93, 4),
(129, 94, 4),
(130, 95, 4),
(133, 60, 6),
(134, 61, 6),
(135, 62, 6),
(136, 63, 6),
(140, 33, 5),
(141, 50, 5),
(142, 51, 5),
(143, 52, 5),
(144, 53, 5),
(145, 54, 5),
(146, 55, 5),
(147, 56, 5),
(148, 57, 5),
(149, 58, 5),
(150, 59, 5),
(155, 64, 7),
(156, 66, 7),
(157, 67, 7),
(158, 68, 7),
(159, 69, 7),
(162, 70, 8),
(163, 71, 8),
(164, 72, 8),
(165, 96, 9),
(166, 97, 9),
(167, 98, 9),
(168, 99, 9),
(169, 100, 9),
(170, 101, 9),
(171, 110, 9),
(172, 102, 10),
(173, 103, 10),
(174, 104, 10);

-- --------------------------------------------------------

--
-- Table structure for table `label_list`
--

DROP TABLE IF EXISTS `label_list`;
CREATE TABLE `label_list` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `label_list`
--

INSERT INTO `label_list` (`id`, `name`) VALUES
(1, 'AutoViz'),
(2, 'Datasets'),
(3, 'Experiments'),
(5, 'Expert Settings'),
(6, 'Models'),
(7, 'Recipes'),
(8, 'Scorers'),
(9, 'Scoring Pipeline'),
(4, 'Time Series'),
(10, 'Usage');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `question` text NOT NULL,
  `answer` text,
  `number` int(10) UNSIGNED NOT NULL,
  `test_id` int(10) UNSIGNED NOT NULL,
  `template_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `answer`, `number`, `test_id`, `template_id`, `created_at`) VALUES
(1, 'The graphs shown on the AutoVisualization page are the same for all datasets.\na) True\nb) False', 'b', 1, 2, 1, '2020-05-28 19:46:31'),
(2, 'Which graph will show the variables that could be good candidates for transformation before being used in modeling?\na) Skewed Histograms\nb) Outliers\nc) Spikey Histograms\nd) Correlation Graph\ne) None of the above', 'a', 2, 2, 2, '2020-05-28 19:46:31'),
(3, 'The ______ plot will indicate variables with anomalous values or points that may lie in an empty region.\na) Recommendations\nb) Outlier\nc) Biplot\nd) Data Heatmap\ne) None of the above', 'b', 3, 2, 3, '2020-05-28 19:46:31'),
(4, 'By default, correlation scatterplots are included for any variable pairs that have a correlation higher than what value?\na) 0.95\nb) 0.90\nc) 0.85\nd) 0.80\ne) 0.75', 'a', 4, 2, 4, '2020-05-28 19:46:31'),
(5, 'Skewed histograms are presented in descending order of skewness.\na) True\nb) False', 'b', 5, 2, 5, '2020-05-28 19:46:31'),
(6, 'In a Biplot, lines represent ________ .\na) Correlations\nb) Dataset rows\nc) Principal Components\nd) Missing values\ne) Dataset columns\nf) None of the above', 'e', 6, 2, 6, '2020-05-28 19:46:31'),
(7, 'In a Biplot, points represent ________ .\na) Correlations\nb) Dataset rows\nc) Principal Components\nd) Missing values\ne) Dataset columns', 'b', 7, 2, 7, '2020-05-28 19:46:31'),
(8, 'The Correlation Graph shows pairwise correlations for numerical variables only.\na) True\nb) False', 'b', 8, 2, 8, '2020-05-28 19:46:31'),
(9, 'In a Parallel Coordinates Plot, each color represents a separate cluster of rows.\na) True\nb) False', 'b', 9, 2, 9, '2020-05-28 19:46:31'),
(10, 'The Radar Plot is the polar version of the ________ . \na) Correlation Graph\nb) Biplot\nc) Data Heatmap\nd) All of the above\ne) None of the above', 'e', 10, 2, 10, '2020-05-28 19:46:31'),
(11, 'You cannot delete a dataset that was used in an active experiment.\na) True\nb) False', 'b', 11, 2, 11, '2020-05-28 19:46:31'),
(12, 'If a column’s data type or distribution does not match the manner in which you want the column to be handled during an experiment, which would you change to make the column fit bettter?\na) Format\nb) Logical Type\nc) Name\nd) Storage Type\ne) None of the above', 'b', 12, 2, 12, '2020-05-28 19:46:31'),
(13, 'Which of the following would allow you to see the distribution of features in a given dataset?\na) Dataset &rarr; Split\nb) Dataset &rarr; Download\nc) Dataset &rarr; Predict\nd) All of the above\ne) None of the above', 'e', 13, 2, 13, '2020-05-28 19:46:31'),
(14, 'Data imputation for ingested data is enabled by default.\na) True\nb) False', 'b', 14, 2, 14, '2020-05-28 19:46:31'),
(15, 'For numeric values, which of the following is the default imputation method?\na) Min\nb) Mode\nc) Mean\nd) Max\ne) Median', 'c', 15, 2, 15, '2020-05-28 19:46:31'),
(16, 'The ______ dataset is only used for tuning the modeling pipeline\na) Original\nb) Test\nc) Train\nd) Validation\ne) None of the above', 'd', 16, 2, 16, '2020-05-28 19:46:31'),
(17, 'Driverless AI will automatically drop ID columns.\na) True\nb) False', 'b', 17, 2, 17, '2020-05-28 19:46:31'),
(18, 'Driverless AI will not drop columns that have a large number of unique values in experiments.\na) True\nb) False', 'b', 18, 2, 18, '2020-05-28 19:46:31'),
(19, 'If you do not include a validation dataset for an experiment that is not time series, which type of validation technique will Driverless AI use?\na) Nested Cross-Validation\nb) Leave-one-group-out Cross-Validation\nc) Leave-one-out Cross-Validation\nd) k-fold Cross-Validation', 'd', 19, 2, 19, '2020-05-28 19:46:31'),
(20, 'A validation dataset can be used for time series experiments.\na) True\nb) False', 'b', 20, 2, 20, '2020-05-28 19:46:31'),
(21, 'The validation dataset must have the same number of columns as the training dataset.\na) True\nb) False', 'b', 21, 2, 21, '2020-05-28 19:46:31'),
(22, 'The _______ setting will allow you to set the number of unique values that will be used to determine if a column will be treated as an ID column and dropped.\na) Max number of original features used\nb) Max number of original features used for FS individual\nc) Max number of unique values for int/float to be categoricals\nd) All of the above\ne) None of the above', 'e', 22, 2, 22, '2020-05-28 19:46:31'),
(23, 'The weight column is used when computing the test score.\na) True\nb) False', 'b', 23, 2, 23, '2020-05-28 19:46:31'),
(24, 'For regression problems, which type of sampling will Driverless AI perform at the start of an experiment?\na) Systematic\nb) Stratified\nc) Random\nd) Cluster\ne) None of the above', 'c', 24, 2, 24, '2020-05-28 19:46:31'),
(25, 'For classification problems, which type of sampling will Driverless AI perform at the start of an experiment?\na) Stratified\nb) Cluster\nc) Random\nd) Systematic\ne) None of the above', 'a', 25, 2, 25, '2020-05-28 19:46:32'),
(26, 'Driverless AI uses what measure to determine whether a binary problem is considered imbalanced by default?\na) Majority class is 10 times more common than minority class\nb) Minority class is 10 times more common than majority class\nc) Minority class is 5 times more common than majority class\nd) All of the above\ne) None of the above', 'e', 26, 2, 26, '2020-05-28 19:46:32'),
(27, 'Which method does Driverless AI use to create validation datasets based on the target variable for classification experiments?\na) Randomly selects\nb) Oversamples\nc) Clusters\nd) Stratification\ne) None of the above', 'd', 27, 2, 27, '2020-05-28 19:46:32'),
(28, 'Which method does Driverless AI use to create validation datasets based on the target variable for regression experiments?\na) Stratification\nb) Oversamples\nc) Clusters\nd) All of the above\ne) None of the above', 'e', 28, 2, 28, '2020-05-28 19:46:32'),
(29, 'Using a fold column can prevent data leakage and improve generalization.\na) True\nb) False', 'b', 29, 2, 29, '2020-05-28 19:46:32'),
(30, 'Selecting \"Reproducible\" when setting up an experiment will ensure that repeated runs of the same experiment on the same data will achieve approximately the same results.\na) True\nb) False', 'b', 30, 2, 30, '2020-05-28 19:46:32'),
(31, 'The meaning of \"Reproducible\" can vary depending on Expert Settings.\na) True\nb) False', 'b', 31, 2, 31, '2020-05-28 19:46:32'),
(32, 'In Expert Settings, if the value under \"Max. runtime in minutes before triggering the \'Finish\' button\" is reached, the experiment will be automatically aborted. \na) True\nb) False', 'b', 32, 2, 32, '2020-05-28 19:46:32'),
(33, 'You can use a Time Column if you specify a Fold Column.\na) True\nb) False', 'b', 34, 2, 34, '2020-05-28 19:46:32'),
(34, 'At a low accuracy setting, Driverless AI does which of the following for features and models?\na) Will evolve and ensemble features on and off that evolve independently\nb) Varies features and models, but they compete evenly against each other\nc) Each independent main model will evolve independently and be part of an ensemble\nd) Both model and feature tracking is performed and an ensemble of all variations occurs\ne) None of the above', 'b', 35, 2, 35, '2020-05-28 19:46:32'),
(35, 'Data shift detection between the train and test dataset occurs at what point?\na) Accuracy < 5\nb) Interpretability >= 7\nc) Accuracy >= 5\nd) Time > 5\ne) All of the above\nf) None of the above', 'c', 36, 2, 36, '2020-05-28 19:46:32'),
(36, 'Monotonicity constraints are used in which models?\na) Decision Trees, XGBoost GBM, Light GBM, Light GBM Random Forest, XGBoost Dart, RuleFit\nb) Decision Trees, XGBoost GBM, Light GBM, Light GBM Random Forest, XGBoost Dart\nc) Decision Trees, XGBoost GBM, Light GBM, Light GBM Random Forest, XGBoost Dart, Tensorflow\nd) Decision Trees, XGBoost GBM, Light GBM, Light GBM Random Forest, FTRL', 'b', 37, 2, 37, '2020-05-28 19:46:32'),
(37, 'Monotonicity is enforced if the absolute correlation is greater than what value?\na) 0.1\nb) 0.2\nc) 0.5\nd) 0.6\ne) 0.7', 'a', 38, 2, 38, '2020-05-28 19:46:32'),
(38, 'Which of the following is true about the weight column?\na) It is not used when making test set predictions\nb) It is a required column\nc) It has no effect on model training\nd) It is not used to compute the test score\ne) All of the above\nf) None of the above', 'a', 39, 2, 39, '2020-05-28 19:46:32'),
(39, 'If you do not identify a weight column, all rows will have an observation weight of what?\na) A random number\nb) 0\nc) 1\nd) 9999\ne) None of the above', 'c', 40, 2, 40, '2020-05-28 19:46:32'),
(40, 'The experiment preview will not automatically update if you only adjust either the Accuracy, Interpretability, or Time knobs.\na) True\nb) False', 'b', 41, 2, 41, '2020-05-28 19:46:32'),
(41, 'If you do not select a custom algorithm in the \"Include specific models\" option in Expert Settings, the algorithm will be used in the experiment.\na) True\nb) False', 'b', 42, 2, 42, '2020-05-28 19:46:32'),
(42, 'How does Driverless AI determine whether to include models or recipes adjusted by Expert Settings?\na) In the order the setting was enabled\nb) Always uses all models and recipes\nc) Random Selection\nd) By hierarchy\ne) None of the above', 'd', 43, 2, 43, '2020-05-28 19:46:32'),
(43, 'Once an experiment is launched, Driverless AI does what (in order)?\na) Figures out the backend, does feature engineering &amp; parameter tuning, and then builds the scoring pipeline\nb) Looks for running GPUs and figures out the backend, does feature engineering and parameter tuning, and then builds scoring pipeline\nc) All of the above\nd) None of the above', 'd', 44, 2, 44, '2020-05-28 19:46:32'),
(44, 'Monotonicity constraints are enabled for what setting?\na) Always\nb) Interpretability <= 6\nc) Interpretability >= 6\nd) Interpretability >= 7\ne) Interpretability <= 7\nf) None of the above', 'd', 45, 2, 45, '2020-05-28 19:46:32'),
(45, 'What setting(s) affects the number of ensemble models under consideration for an experiment?\na) Time\nb) Accuracy\nc) Interpretability\nd) All of the above\ne) None of the above', 'c', 46, 2, 46, '2020-05-28 19:46:32'),
(46, 'Which of the following is NOT a factor in determining whether Driverless AI employs a validation data set instead of cross-validation?\na) The size of the data set\nb) User specifies a validation data set\nc) Accuracy setting\nd) Time setting\ne) All of the above\nf) None of the above', 'd', 47, 2, 47, '2020-05-28 19:46:32'),
(47, 'When selecting \"Transform Another Dataset\", if the new dataset does not have all of the same columns as the original dataset, Driverless AI will simply ignore any columns not previously present.\na) True\nb) False', 'b', 48, 2, 48, '2020-05-28 19:46:32'),
(48, 'Rows with the same value in the fold column represent groups that should be kept together in the training, validation, or cross-validation datasets.\na) True\nb) False', 'b', 49, 2, 49, '2020-05-28 19:46:32'),
(49, 'To have full control over features pulled into a model, in the Expert Settings the Feature Brain Level should be set to what level?\na) True\nb) False', 'b', 50, 2, 50, '2020-05-28 19:46:32'),
(50, 'The Compliant Pipeline Building recipe type will use only GLMs.\na) True\nb) False', 'b', 51, 2, 51, '2020-05-28 19:46:32'),
(51, 'Which one of these methods in the Tournament Model for Genetic Algorithm will result in all individuals in the population competing?\na) model\nb) uniform \nc) auto\nd) fullstack\ne) None of the above', 'b', 52, 2, 52, '2020-05-28 19:46:32'),
(52, 'A GLM Model can be enabled when which of the following settings occur?\na) Accuracy > 6 and Interpretability >= 6 \nb) Interpretability < 6 and Accuracy > 5\nc) Accuracy <= 5 and Interpretability > 5\nd) Accuracy <= 5 and Interpretability >= 6\ne) None of the above', 'd', 53, 2, 53, '2020-05-28 19:46:32'),
(53, 'Which of the following LightGBM boosting types are enabled by default?\na) rf_early_stopping & dart\nb) gbdt & dart\nc) dart & rf\nd) gbdt & rf\ne) None of the above', 'd', 54, 2, 54, '2020-05-28 19:46:32'),
(54, 'All of the following are aggregation functions for group by operations for non-time series experiments, except which?\na) variance\nb) mean\nc) min\nd) count\ne) None of the above', 'a', 55, 2, 55, '2020-05-28 19:46:32'),
(55, 'When the ImbalancedLightGBM and/or the ImbalancedXGBoostGBM are _____ and the Sampling Method for Imbalanced Binary Classification Problems is ______, Driverless AI will check your target imbalance fraction and if it\'s over the threshhold, will perform sampling.\na) disabled, enabled\nb) enabled, enabled\nc) disabled, disabled\nd) enabled, disabled\ne) None of the above', 'b', 56, 2, 56, '2020-05-28 19:46:32'),
(56, 'If the ImbalancedLightGBM and/or the ImbalancedXGBoostGBM are _____ and the Sampling Method for Imbalanced Binary Classification Problems is ______, Driverless AI will disable imbalanced models and no sampling will be used.\na) enabled, disabled\nb) enabled, enabled\nc) disabled, disabled\nd) disabled, enabled\ne) None of the above', 'a', 57, 2, 57, '2020-05-28 19:46:32'),
(57, 'Which one of these settings will specify the unnormalized probability to add genes or instances of transformers with specific attributes that are beneficial to other individuals within the population.\na) Probability to Add Best Shared Transformers\nb) Probablity to Prune Transformers\nc) Probability to Add Transformers\nd) Probablity to Mutate Model Parameters\ne) None of the above', 'a', 58, 2, 58, '2020-05-28 19:46:32'),
(58, 'What is the default minimum number of rows required to run an experiment?\na) 10\nb) 30\nc) 50\nd) 100\ne) depends on the number of columns', 'a', 59, 2, 59, '2020-05-28 19:46:32'),
(59, 'Which of the following tree-based machine learning algorithms is NOT supported in Driverless AI?\na) XGBoost\nb) RuleFit\nc) LightGBM\nd) AdaBoost\ne) All of the above\nf) None of the above', 'd', 60, 2, 60, '2020-05-28 19:46:32'),
(60, 'LightGBM employs an approach where trees are grown in breadth instead of depth.\na) True\nb) False', 'b', 61, 2, 61, '2020-05-28 19:46:32'),
(61, 'In tree-based models that employ boosting, trees are grown sequentially instead of independently. \na) True\nb) False', 'b', 62, 2, 62, '2020-05-28 19:46:32'),
(62, 'Which of the following is NOT a weakness of decision trees?\na) Not robust to correlated features\nb) High variance\nc) Often overfit\nd) Poor predictive accuracy\ne) Inefficiently fits linear relationships\nf) None of the above', 'a', 63, 2, 63, '2020-05-28 19:46:32'),
(63, 'Recipes need to be added to Driverless AI each time you want to use it for an experiment.\na) True\nb) False', 'b', 64, 2, 64, '2020-05-28 19:46:32'),
(64, 'MOJOs for complex custom recipes won\'t be available out of the box.\na) True\nb) False', 'b', 65, 2, 65, '2020-05-28 19:46:32'),
(65, 'Modifying a dataset with a recipe will overwrite the original data.\na) True\nb) False', 'b', 66, 2, 66, '2020-05-28 19:46:32'),
(66, 'Which of the following Pipeline Building Recipe types will concatenate the test dataset with the train set?\na) Auto\nb) Kaggle\nc) Compliant\nd) All of the above\ne) None of the above', 'b', 67, 2, 67, '2020-05-28 19:46:32'),
(67, 'If a model recipe is not selected under \"Include specific models\", it will be included if that algorithm is set to \"ON\" under \"Expert Settings > Models\".\na) True\nb) False', 'b', 68, 2, 68, '2020-05-28 19:46:32'),
(68, 'Which scorer is not sensitive to outliers for regression?\r\n\na) R2\nb) MSE\nc) RMSPE\nd) RMSE\ne) All of the above\nf) None of the above', 'a', 70, 2, 70, '2020-05-28 19:46:32'),
(69, 'Which regression scorer would you use when the target values are close to 0?\na) RMSPE\nb) MAPE\nc) SMAPE\nd) MAE\ne) All of the above\nf) None of the above', 'c', 71, 2, 71, '2020-05-28 19:46:32'),
(70, 'Which of these scorers are in the same units as the target for regression?\na) MAPE & RMSPE\nb) RMSE & MSE\nc) R2 & MSE\nd) RMSE & MAE\ne) All of the above\nf) None of the above', 'd', 72, 2, 72, '2020-05-28 19:46:32'),
(71, 'Which regression scorer would you use when the target values are across different scales?\na) MAPE\nb) MAE\nc) R2\nd) SMAPE\ne) All of the above', 'a', 73, 2, 73, '2020-05-28 19:46:32'),
(72, 'Which scorer would result in the log of the target?\na) R2\nb) RMSPE\nc) RMSE\nd) All of the above\ne) None of the above', 'e', 74, 2, 74, '2020-05-28 19:46:32'),
(73, 'Which of these scorers is sensitive to outliers?\na) MAE\nb) R2\nc) MAPE\nd) All of the above\ne) None of the above', 'e', 75, 2, 75, '2020-05-28 19:46:32'),
(74, 'Having imbalanced data will affect which scorer you choose for classification experiments.\na) True\nb) False', 'b', 76, 2, 76, '2020-05-28 19:46:32'),
(75, 'The final output of a Driverless AI classification model is a predicted probability that a record belongs to a particular class.\na) True\nb) False', 'b', 77, 2, 77, '2020-05-28 19:46:32'),
(76, 'It doesn\'t matter which scorer you use when evaluating the accuracy of a probability.\na) True\nb) False', 'b', 78, 2, 78, '2020-05-28 19:46:32'),
(77, 'Which scorer does Driverless AI automatically use when you have imbalanced data?\na) Accuracy\nb) Logloss\nc) AUC\nd) MCC\ne) None of the above', 'b', 79, 2, 79, '2020-05-28 19:46:32'),
(78, 'Which scorer gives more weight to precision?\na) Logloss\nb) F2\nc) AUCPR\nd) All of the above\ne) None of the above', 'e', 80, 2, 80, '2020-05-28 19:46:32'),
(79, 'Which scorer gives more weight to recall?\na) F2\nb) AUCPR\nc) F1\nd) Logloss\ne) None of the above', 'a', 81, 2, 81, '2020-05-28 19:46:32'),
(80, 'Which of the following scorers is best to use when you want to evaluate based on probability?\na) F1\nb) Logloss\nc) AUC\nd) MCC\ne) None of the above', 'b', 82, 2, 82, '2020-05-28 19:46:32'),
(81, 'Which set of scorers evaluates based on class?\na) MCC, Accuracy, Logloss\nb) Logloss, Accuracy, AUCPR\nc) MCC, Logloss, F2\nd) All of the above\ne) None of the above', 'e', 83, 2, 83, '2020-05-28 19:46:32'),
(82, 'In time series, a column that is noted as being unavailable at the time of prediction will only have lag-related features created for/with it.\na) True\nb) False', 'b', 84, 2, 84, '2020-05-28 19:46:32'),
(83, 'Generally raw time series features are more useful features for Machine Learning Interpretability than munged time series features.\na) True\nb) False', 'b', 85, 2, 85, '2020-05-28 19:46:32'),
(84, 'The feature pre-pruning strategy come into play at what point?\na) True\nb) False', 'b', 86, 2, 86, '2020-05-28 19:46:32'),
(85, 'ARIMA time series models are among the models included as defaults when generating a time series experiment.\na) True\nb) False', 'b', 87, 2, 87, '2020-05-28 19:46:32'),
(86, 'For a time series experiment, the underlying data must contain lagged variables as separate variables prior to the start of the experiment.\na) True\nb) False', 'b', 88, 2, 88, '2020-05-28 19:46:32'),
(87, 'Driverless AI will not only automatically create lagged variables in a time-series experiment, but will also automatically examine aggregated features on those lagged variables.\na) True\nb) False', 'b', 89, 2, 89, '2020-05-28 19:46:32'),
(88, 'The term \"gap\" in time series experiments refers to what concept?\na) The time gap between the end of the training data and the start of the test data\nb) The time gap between the end of the test set and the expected start date for production forecasting\nc) The length of the future period for which the model will make predictions\nd) The time gap between the end of the validation data and the start of the test data\ne) None of the above', 'a', 90, 2, 90, '2020-05-28 19:46:32'),
(89, 'Exponential weighting in time series refers to the weighting of recent values more heavily than less recent values.\na) True\nb) False', 'b', 91, 2, 91, '2020-05-28 19:46:32'),
(90, 'In time series experiments, as a general rule, the training set should have _______ as observations as the test set has. \na) True\nb) False', 'b', 92, 2, 92, '2020-05-28 19:46:32'),
(91, 'If \"AUTO\" is selected for the time column and a string column with datetime format is identified, Driverless AI will automatically respect the causality of time for feature engineering and model validation.\na) True\nb) False', 'b', 93, 2, 93, '2020-05-28 19:46:32'),
(92, 'For time series experiments, target encoding transformations are deactivated.\na) True\nb) False', 'b', 94, 2, 94, '2020-05-28 19:46:32'),
(93, 'Driverless AI can automatically create and examine the effect of lags for what type of variables?\na) True\nb) False', 'b', 95, 2, 95, '2020-05-28 19:46:32'),
(94, 'Both Python and MOJO scoring pipelines are supported for Follow the Regularized Leader (FTRL) models.\na) True\nb) False', 'b', 96, 2, 96, '2020-05-28 19:46:32'),
(95, 'MOJOs are available for RuleFit models.\na) True\nb) False', 'b', 97, 2, 97, '2020-05-28 19:46:32'),
(96, 'MOJOs will automatically be available for most custom recipes.\na) True\nb) False', 'b', 98, 2, 98, '2020-05-28 19:46:32'),
(97, 'k-LIME reason codes can be obtained from ___________ . \na) Python Scoring Pipeline\nb) MOJO Scoring Pipeline\nc) MLI Standalone Python Scoring Pipeline\nd) None of the above', 'c', 99, 2, 99, '2020-05-28 19:46:32'),
(98, 'Shapley reason codes can be obtained from ___________ .\na) Python Scoring Pipeline\nb) MLI Standalone Python Scoring Pipeline\nc) Python Scoring Pipeline & MLI Standalone Python Scoring Pipeline\nd) None of the above', 'c', 100, 2, 100, '2020-05-28 19:46:32'),
(99, 'Shapley reason codes are only available for XGBoost and LightGBM models.\na) True\nb) False', 'b', 101, 2, 101, '2020-05-28 19:46:32'),
(100, 'Which of the following is not a good use case for out-of-the-box Driverless AI?\na) Predicting which customers will churn\nb) Finding new topics in Customer Reviews\nc) Forecasting product sales\nd) Identifying parts most likely to fail\ne) None of the above', 'b', 102, 2, 102, '2020-05-28 19:46:32'),
(101, 'Driverless AI is a SaaS offering.\na) True\nb) False', 'b', 103, 2, 103, '2020-05-28 19:46:32'),
(102, 'If you do not explicitly select the \"Fold\" column, then DAI will select the best column to do the training-validation split on.\na) True\nb) False', 'b', 104, 2, 104, '2020-05-28 19:46:32'),
(103, 'The final scoring pipeline is always an ensemble of models.\na) True\nb) False', 'b', 105, 2, 105, '2020-05-28 19:46:32'),
(104, 'How are the final scoring pipelines ensembles constructed?\na) median of the individual models\' predictions\nb) stacked ensemble\nc) mean of the individual models\' predictions\nd) All of the above\ne) None of the above', 'b', 106, 2, 106, '2020-05-28 19:46:32'),
(105, 'MOJOs are thread-safe and an instance of MOJO loaded into memory can be used concurrently.\na) True\nb) False', 'b', 107, 2, 107, '2020-05-28 19:46:32'),
(106, 'Multiclass classification is possible in Driverless AI.\na) True\nb) False', 'b', 108, 2, 108, '2020-05-28 19:46:32'),
(107, 'Multi-label classification is supported in Driverless AI.\na) True\nb) False', 'b', 109, 2, 109, '2020-05-28 19:46:32'),
(108, 'How can one reduce the size of a MOJO?\na) Reduce accuracy\nb) Reduce \'Max. number of engineered features\' in expert settings\nc) Increase interpretibility\nd) Reduce \'Max. feature interaction depth\' in expert settings\ne) All of the above\nf) None of the above', 'e', 110, 2, 110, '2020-05-28 19:46:32');

-- --------------------------------------------------------

--
-- Table structure for table `question_templates`
--

DROP TABLE IF EXISTS `question_templates`;
CREATE TABLE `question_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `question` text NOT NULL,
  `answer` text,
  `correct` int(11) DEFAULT '1',
  `randomize` tinyint(1) DEFAULT '1',
  `type` enum('True/False','Multiple Choice','Numeric','String') DEFAULT NULL,
  `aota` tinyint(1) DEFAULT '0' COMMENT '"All of the above"',
  `nota` tinyint(1) DEFAULT '0' COMMENT '"None of the above"',
  `epsilon` double DEFAULT '0.0001',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `comments` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `question_templates`
--

INSERT INTO `question_templates` (`id`, `question`, `answer`, `correct`, `randomize`, `type`, `aota`, `nota`, `epsilon`, `enabled`, `comments`, `created_at`, `last_modified`) VALUES
(1, 'The graphs shown on the AutoVisualization page are the same for all datasets.', '\"False\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: \"AutoViz\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 00:23:29'),
(2, 'Which graph will show the variables that could be good candidates for transformation before being used in modeling?', '[\"Skewed Histograms\", \"Outliers\", \"Spikey Histograms\", \"Correlation Graph\"]', 1, 1, 'Multiple Choice', 0, 1, NULL, 1, 'labels: \"AutoViz\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 00:24:07'),
(3, 'The ______ plot will indicate variables with anomalous values or points that may lie in an empty region.', '[\"Outlier\", \"Biplot\", \"Data Heatmap\", \"Recommendations\"]', 1, 1, 'Multiple Choice', 0, 1, NULL, 1, 'labels: \"AutoViz\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 00:24:46'),
(4, 'By default, correlation scatterplots are included for any variable pairs that have a correlation higher than what value?', '[\"0.95\",\"0.90\",\"0.85\",\"0.80\",\"0.75\"]', 1, 0, 'Multiple Choice', 0, 0, NULL, 1, 'labels: \"AutoViz\"; author: David Engler', '2020-05-06 18:41:05', '2020-05-12 00:25:32'),
(5, 'Skewed histograms are presented in descending order of skewness.', '\"True\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: \"AutoViz\"; author: David Engler', '2020-05-06 18:41:05', '2020-05-12 00:25:44'),
(6, 'In a Biplot, lines represent ________ .', '[\"Dataset columns\", \"Dataset rows\",\"Missing values\",\"Correlations\", \"Principal Components\"]', 1, 1, 'Multiple Choice', 0, 1, NULL, 1, 'labels: \"AutoViz\"; author: David Engler', '2020-05-06 18:41:05', '2020-05-12 00:29:43'),
(7, 'In a Biplot, points represent ________ .', '[\"Dataset rows\", \"Dataset columns\",\"Missing values\",\"Correlations\", \"Principal Components\"]', 1, 1, 'Multiple Choice', 0, 0, NULL, 1, 'labels: \"AutoViz\"; author: David Engler', '2020-05-06 18:41:05', '2020-05-12 00:27:31'),
(8, 'The Correlation Graph shows pairwise correlations for numerical variables only.', '\"False\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: \"AutoViz\"; author: David Engler', '2020-05-06 18:41:05', '2020-05-12 00:27:42'),
(9, 'In a Parallel Coordinates Plot, each color represents a separate cluster of rows.', '\"True\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: \"AutoViz\"; author: David Engler', '2020-05-06 18:41:05', '2020-05-12 00:27:54'),
(10, 'The Radar Plot is the polar version of the ________ . ', '[\"Parallel Coordinates Plot\", \"Biplot\", \"Correlation Graph\", \"Data Heatmap\"]', 1, 1, 'Multiple Choice', 0, 1, NULL, 1, 'labels: \"AutoViz\"; author: David Engler', '2020-05-06 18:41:05', '2020-05-12 01:15:08'),
(11, 'You cannot delete a dataset that was used in an active experiment.', '\"True\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: \"Datasets\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 00:31:21'),
(12, 'If a column’s data type or distribution does not match the manner in which you want the column to be handled during an experiment, which would you change to make the column fit bettter?', '[\"Logical Type\", \"Storage Type\", \"Format\", \"Name\"]', 1, 1, 'Multiple Choice', 0, 1, NULL, 1, 'labels: \"Datasets\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 00:31:58'),
(13, 'Which of the following would allow you to see the distribution of features in a given dataset?', '[\"Dataset &rarr; Details\", \"Dataset &rarr; Predict\", \"Dataset &rarr; Download\", \"Dataset &rarr; Split\"]', 1, 1, 'Multiple Choice', 0, 1, NULL, 1, 'labels: \"Datasets\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 01:13:50'),
(14, 'Data imputation for ingested data is enabled by default.', '\"False\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: \"Datasets\"; author: David Engler', '2020-05-06 18:41:05', '2020-05-12 01:03:00'),
(15, 'For numeric values, which of the following is the default imputation method?', '[\"Mean\", \"Median\", \"Min\", \"Max\", \"Mode\"]', 1, 1, 'Multiple Choice', 0, 0, NULL, 1, 'labels: \"Datasets\"; author: David Engler', '2020-05-06 18:41:05', '2020-05-12 01:05:45'),
(16, 'The ______ dataset is only used for tuning the modeling pipeline', '[\"Validation\", \"Test\", \"Train\", \"Original\"]', 1, 1, 'Multiple Choice', 0, 1, NULL, 1, 'labels: \"Experiments\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 01:06:19'),
(17, 'Driverless AI will automatically drop ID columns.', '\"True\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: \"Experiments\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 01:07:10'),
(18, 'Driverless AI will not drop columns that have a large number of unique values in experiments.', '\"False\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: \"Experiments\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 04:26:18'),
(19, 'If you do not include a validation dataset for an experiment that is not time series, which type of validation technique will Driverless AI use?', '[\"k-fold Cross-Validation\", \"Nested Cross-Validation\", \"Leave-one-out Cross-Validation\", \"Leave-one-group-out Cross-Validation\"]', 1, 1, 'Multiple Choice', 0, 0, NULL, 1, 'labels: \"Experiments\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 04:27:16'),
(20, 'A validation dataset can be used for time series experiments.', '\"False\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: \"Experiments\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 04:27:47'),
(21, 'The validation dataset must have the same number of columns as the training dataset.', '\"True\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: \"Experiments\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 04:27:58'),
(22, 'The _______ setting will allow you to set the number of unique values that will be used to determine if a column will be treated as an ID column and dropped.', '[\"Max allowed fraction of uniques for integer and categorical cols\", \"Max number of unique values for int/float to be categoricals\", \"Max number of original features used for FS individual\", \"Max number of original features used\"]', 1, 1, 'Multiple Choice', 0, 1, NULL, 1, 'labels: \"Experiments\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 04:28:33'),
(23, 'The weight column is used when computing the test score.', '\"True\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: \"Experiments\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 04:28:47'),
(24, 'For regression problems, which type of sampling will Driverless AI perform at the start of an experiment?', '[\"Stratified\", \"Systematic\", \"Cluster\", \"Random\"]', 4, 1, 'Multiple Choice', 0, 1, NULL, 1, 'labels: \"Experiments\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 04:29:10'),
(25, 'For classification problems, which type of sampling will Driverless AI perform at the start of an experiment?', '[\"Stratified\", \"Systematic\", \"Cluster\", \"Random\"]', 1, 1, 'Multiple Choice', 0, 1, NULL, 1, 'labels: \"Experiments\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 04:29:33'),
(26, 'Driverless AI uses what measure to determine whether a binary problem is considered imbalanced by default?', '[\"Majority class is 5 times more common than minority class\", \"Minority class is 5 times more common than majority class\", \"Majority class is 10 times more common than minority class\", \"Minority class is 10 times more common than majority class\"]', 1, 1, 'Multiple Choice', 0, 1, NULL, 1, 'labels: \"Experiments\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 04:30:06'),
(27, 'Which method does Driverless AI use to create validation datasets based on the target variable for classification experiments?', '[\"Randomly selects\", \"Stratification\", \"Oversamples\", \"Clusters\"]', 2, 1, 'Multiple Choice', 0, 1, NULL, 1, 'labels: \"Experiments\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 04:30:28'),
(28, 'Which method does Driverless AI use to create validation datasets based on the target variable for regression experiments?', '[\"Randomly selects\", \"Stratification\", \"Oversamples\", \"Clusters\"]', 1, 1, 'Multiple Choice', 0, 1, NULL, 1, 'labels: \"Experiments\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 04:30:47'),
(29, 'Using a fold column can prevent data leakage and improve generalization.', '\"True\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: \"Experiments\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 04:31:06'),
(30, 'Selecting \"Reproducible\" when setting up an experiment will ensure that repeated runs of the same experiment on the same data will achieve approximately the same results.', '\"False\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: \"Experiments\"; author: David Engler', '2020-05-06 18:41:05', '2020-05-12 04:31:28'),
(31, 'The meaning of \"Reproducible\" can vary depending on Expert Settings.', '\"True\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: \"Experiments\"; author: David Engler', '2020-05-06 18:41:05', '2020-05-12 04:31:37'),
(32, 'In Expert Settings, if the value under \"Max. runtime in minutes before triggering the \'Finish\' button\" is reached, the experiment will be automatically aborted. ', '\"False\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: \"Experiments\"; author: David Engler', '2020-05-06 18:41:05', '2020-05-12 04:31:50'),
(33, 'In Expert Settings, if \"Compliant\" is set to \"ON\", Interpretability will automatically be set to ______ .', '[\"10\",\"9\",\"8\",\"7\",\"6\"]', 1, 0, 'Multiple Choice', 0, 0, NULL, 0, 'labels: \"Experiments\"; author: David Engler.\r\n\r\nCheck whether Compliant is \"On/Off\" in expert settings. Need to rewrite for 1.8.5.1.', '2020-05-06 18:41:05', '2020-05-12 04:34:15'),
(34, 'You can use a Time Column if you specify a Fold Column.', '\"False\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: [\"Experiments\", \"Time Series\"]; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 04:34:26'),
(35, 'At a low accuracy setting, Driverless AI does which of the following for features and models?', '[\"Varies features and models, but they compete evenly against each other\", \"Each independent main model will evolve independently and be part of an ensemble\", \"Will evolve and ensemble features on and off that evolve independently\", \"Both model and feature tracking is performed and an ensemble of all variations occurs\"]', 1, 1, 'Multiple Choice', 0, 1, NULL, 1, 'labels: \"Experiments\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 04:34:57'),
(36, 'Data shift detection between the train and test dataset occurs at what point?', '[\"Accuracy >= 5\", \"Accuracy < 5\", \"Interpretability >= 7\", \"Time > 5\"]', 1, 1, 'Multiple Choice', 1, 1, NULL, 1, 'labels: \"Experiments\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 04:36:41'),
(37, 'Monotonicity constraints are used in which models?', '[\"Decision Trees, XGBoost GBM, Light GBM, Light GBM Random Forest, XGBoost Dart\", \"Decision Trees, XGBoost GBM, Light GBM, Light GBM Random Forest, FTRL\", \"Decision Trees, XGBoost GBM, Light GBM, Light GBM Random Forest, XGBoost Dart, RuleFit\", \"Decision Trees, XGBoost GBM, Light GBM, Light GBM Random Forest, XGBoost Dart, Tensorflow\"]', 1, 1, 'Multiple Choice', 0, 0, NULL, 1, 'labels: \"Experiments\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 04:36:58'),
(38, 'Monotonicity is enforced if the absolute correlation is greater than what value?', '[0.1, 0.2, 0.5, 0.6, 0.7]', 1, 0, 'Multiple Choice', 0, 0, NULL, 1, 'labels: \"Experiments\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 04:37:25'),
(39, 'Which of the following is true about the weight column?', '[\"It is not used when making test set predictions\", \"It is not used to compute the test score\", \"It is a required column\", \"It has no effect on model training\"]', 1, 1, 'Multiple Choice', 1, 1, NULL, 1, 'labels: \"Experiments\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 04:37:51'),
(40, 'If you do not identify a weight column, all rows will have an observation weight of what?', '[\"1\", \"0\", \"9999\", \"A random number\"]', 1, 1, 'Multiple Choice', 0, 1, NULL, 1, 'labels: \"Experiments\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 04:38:36'),
(41, 'The experiment preview will not automatically update if you only adjust either the Accuracy, Interpretability, or Time knobs.', '\"False\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: \"Experiments\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 04:39:08'),
(42, 'If you do not select a custom algorithm in the \"Include specific models\" option in Expert Settings, the algorithm will be used in the experiment.', '\"False\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: \"Experiments\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 04:40:13'),
(43, 'How does Driverless AI determine whether to include models or recipes adjusted by Expert Settings?', '[\"By hierarchy\", \"Random Selection\", \"In the order the setting was enabled\", \"Always uses all models and recipes\"]', 1, 1, 'Multiple Choice', 0, 1, NULL, 1, 'labels: \"Experiments\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 04:41:38'),
(44, 'Once an experiment is launched, Driverless AI does what (in order)?', '[\"Figures out the backend &amp; looks for running GPUs, does parameter tuning &amp; feature engineering, and then builds scoring pipeline\", \"Looks for running GPUs and figures out the backend, does feature engineering and parameter tuning, and then builds scoring pipeline\", \"Figures out the backend, does feature engineering &amp; parameter tuning, and then builds the scoring pipeline\"]', 1, 1, 'Multiple Choice', 0, 1, NULL, 1, 'labels: \"Experiments\"; author: David Engler', '2020-05-06 18:41:05', '2020-05-12 04:44:12'),
(45, 'Monotonicity constraints are enabled for what setting?', '[\"Interpretability >= 7\", \"Interpretability >= 6\", \"Interpretability <= 7\", \"Interpretability <= 6\", \"Always\"]', 1, 1, 'Multiple Choice', 0, 1, NULL, 1, 'labels: \"Experiments\"; author: David Engler', '2020-05-06 18:41:05', '2020-05-12 04:46:27'),
(46, 'What setting(s) affects the number of ensemble models under consideration for an experiment?', '[\"Accuracy\", \"Interpretability\", \"Time\"]', 2, 1, 'Multiple Choice', 1, 1, NULL, 1, 'labels: \"Experiments\"; author: David Engler', '2020-05-06 18:41:05', '2020-05-12 12:56:19'),
(47, 'Which of the following is NOT a factor in determining whether Driverless AI employs a validation data set instead of cross-validation?', '[\"Time setting\",\"The size of the data set\", \"User specifies a validation data set\", \"Accuracy setting\"]', 1, 1, 'Multiple Choice', 1, 1, NULL, 1, 'labels: \"Experiments\"; author: David Engler', '2020-05-06 18:41:05', '2020-05-12 12:53:44'),
(48, 'When selecting \"Transform Another Dataset\", if the new dataset does not have all of the same columns as the original dataset, Driverless AI will simply ignore any columns not previously present.', '\"False\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: \"Experiments\"; author: David Engler', '2020-05-06 18:41:05', '2020-05-12 12:57:35'),
(49, 'Rows with the same value in the fold column represent groups that should be kept together in the training, validation, or cross-validation datasets.', '\"True\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: \"Experiments\"; author: David Engler', '2020-05-06 18:41:05', '2020-05-12 13:01:13'),
(50, 'To have full control over features pulled into a model, in the Expert Settings the Feature Brain Level should be set to what level?', '[0, 2, 1, 10, 5]', 1, 1, 'True/False', 0, 1, NULL, 1, 'labels: \"Expert Settings\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 13:18:19'),
(51, 'The Compliant Pipeline Building recipe type will use only GLMs.', '\"True\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: \"Expert Settings\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 13:13:51'),
(52, 'Which one of these methods in the Tournament Model for Genetic Algorithm will result in all individuals in the population competing?', '[\"uniform \", \"fullstack\", \"model\", \"auto\"]', 1, 1, 'Multiple Choice', 0, 1, NULL, 1, 'labels: \"Expert Settings\" author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 13:10:14'),
(53, 'A GLM Model can be enabled when which of the following settings occur?', '[\"Accuracy <= 5 and Interpretability >= 6\", \"Interpretability < 6 and Accuracy > 5\", \"Accuracy <= 5 and Interpretability > 5\", \"Accuracy > 6 and Interpretability >= 6 \"]', 1, 1, 'Multiple Choice', 0, 1, NULL, 1, 'labels: \"Expert Settings\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 13:16:08'),
(54, 'Which of the following LightGBM boosting types are enabled by default?', '[\"gbdt & rf\", \"dart & rf\", \"gbdt & dart\", \"rf_early_stopping & dart\"]', 1, 1, 'Multiple Choice', 0, 1, NULL, 1, 'labels: \"Expert Settings\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 18:46:35'),
(55, 'All of the following are aggregation functions for group by operations for non-time series experiments, except which?', '[\"variance\", \"mean\", \"count\", \"min\"]', 1, 1, 'Multiple Choice', 0, 1, NULL, 1, 'labels: \"Expert Settings\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 13:26:32'),
(56, 'When the ImbalancedLightGBM and/or the ImbalancedXGBoostGBM are _____ and the Sampling Method for Imbalanced Binary Classification Problems is ______, Driverless AI will check your target imbalance fraction and if it\'s over the threshhold, will perform sampling.', '[\"enabled, enabled\", \"disabled, enabled\", \"disabled, disabled\", \"enabled, disabled\"]', 1, 1, 'Multiple Choice', 0, 1, NULL, 1, 'labels: \"Expert Settings\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 13:27:15'),
(57, 'If the ImbalancedLightGBM and/or the ImbalancedXGBoostGBM are _____ and the Sampling Method for Imbalanced Binary Classification Problems is ______, Driverless AI will disable imbalanced models and no sampling will be used.', '[\"enabled, disabled\", \"disabled, enabled\", \"disabled, disabled\", \"enabled, enabled\"]', 1, 1, 'Multiple Choice', 0, 1, NULL, 1, 'labels: \"Expert Settings\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 13:27:42'),
(58, 'Which one of these settings will specify the unnormalized probability to add genes or instances of transformers with specific attributes that are beneficial to other individuals within the population.', '[\"Probability to Add Best Shared Transformers\", \"Probability to Add Transformers\", \"Probablity to Prune Transformers\", \"Probablity to Mutate Model Parameters\"]', 1, 1, 'Multiple Choice', 0, 1, NULL, 1, 'labels: \"Expert Settings\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 13:33:04'),
(59, 'What is the default minimum number of rows required to run an experiment?', '[\"10\",\"30\",\"50\",\"100\",\"depends on the number of columns\"]', 1, 0, 'Multiple Choice', 0, 0, NULL, 1, 'labels: \"Expert Settings\"; author: David Engler', '2020-05-06 18:41:05', '2020-05-12 13:33:00'),
(60, 'Which of the following tree-based machine learning algorithms is NOT supported in Driverless AI?', '[\"AdaBoost\", \"XGBoost\", \"LightGBM\", \"RuleFit\"]', 1, 1, 'Multiple Choice', 1, 1, NULL, 1, 'labels: \"Models\"; author: David Engler', '2020-05-06 18:41:05', '2020-05-12 13:30:53'),
(61, 'LightGBM employs an approach where trees are grown in breadth instead of depth.', '\"False\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: \"Models\"; author: David Engler', '2020-05-06 18:41:05', '2020-05-12 13:36:32'),
(62, 'In tree-based models that employ boosting, trees are grown sequentially instead of independently. ', '\"True\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: \"Models\"; author: David Engler', '2020-05-06 18:41:05', '2020-05-12 18:44:03'),
(63, 'Which of the following is NOT a weakness of decision trees?', '[\"Not robust to correlated features\", \"High variance\", \"Often overfit\", \"Poor predictive accuracy\", \"Inefficiently fits linear relationships\"]', 1, NULL, 'Multiple Choice', 0, 1, NULL, 1, 'labels: \"Models\"; author: David Engler', '2020-05-06 18:41:05', '2020-05-12 18:52:11'),
(64, 'Recipes need to be added to Driverless AI each time you want to use it for an experiment.', '\"False\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: \"Recipes\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 18:49:41'),
(65, 'MOJOs for complex custom recipes won\'t be available out of the box.', '\"True\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: ; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-18 21:45:34'),
(66, 'Modifying a dataset with a recipe will overwrite the original data.', '\"False\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: \"Recipes\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-12 00:21:49'),
(67, 'Which of the following Pipeline Building Recipe types will concatenate the test dataset with the train set?', '[\"Kaggle\", \"Auto\", \"Compliant\"]', 1, 1, 'Multiple Choice', 1, 1, NULL, 1, 'labels: \"Recipes\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-18 21:53:30'),
(68, 'If a model recipe is not selected under \"Include specific models\", it will be included if that algorithm is set to \"ON\" under \"Expert Settings > Models\".', '\"False\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: \"Recipes\"; author: David Engler', '2020-05-06 18:41:05', '2020-05-18 21:55:59'),
(69, 'If uploading a custom recipe via URL, the URL can point to a GitHub repository.', '\"False\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 0, 'labels: \"Recipes\"; author: David Engler\r\n\r\nDW: This may be confusing, should it be reworded? It can point to a raw file on github.', '2020-05-06 18:41:05', '2020-05-26 18:33:42'),
(70, 'Which scorer is not sensitive to outliers for regression?\r\n', '[\"R2\", \"MSE\", \"RMSE\", \"RMSPE\"]', 1, 1, 'Multiple Choice', 1, 1, NULL, 1, 'labels: \"Scorers\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-26 18:37:20'),
(71, 'Which regression scorer would you use when the target values are close to 0?', '[\"SMAPE\", \"MAPE\", \"MAE\", \"RMSPE\"]', 1, 1, 'Multiple Choice', 1, 1, NULL, 1, 'labels: \"Scorers\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-26 18:39:42'),
(72, 'Which of these scorers are in the same units as the target for regression?', '[\"RMSE & MAE\", \"RMSE & MSE\", \"MAPE & RMSPE\", \"R2 & MSE\"]', 1, 1, 'Multiple Choice', 1, 1, NULL, 1, 'labels: \"Scorers\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-26 18:41:09'),
(73, 'Which regression scorer would you use when the target values are across different scales?', '[\"MAPE\", \"R2\", \"MAE\", \"SMAPE\"]', 1, 1, 'Multiple Choice', 1, 0, NULL, 1, 'labels: \"Scorer\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-26 19:23:38'),
(74, 'Which scorer would result in the log of the target?', '[\"RMSLE\", \"RMSE\", \"R2\", \"RMSPE\"]', 1, 1, 'Multiple Choice', 1, 1, NULL, 1, 'labels: \"Scorer\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-26 19:24:05'),
(75, 'Which of these scorers is sensitive to outliers?', '[\"MSE\", \"MAE\", \"MAPE\", \"R2\"]', 1, 1, 'Multiple Choice', 1, 1, NULL, 1, 'labels: \"Scorer\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-26 19:25:22'),
(76, 'Having imbalanced data will affect which scorer you choose for classification experiments.', '\"True', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: \"Scorer\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-26 19:26:03'),
(77, 'The final output of a Driverless AI classification model is a predicted probability that a record belongs to a particular class.', '\"True\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: \"Scorer\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-26 19:26:56'),
(78, 'It doesn\'t matter which scorer you use when evaluating the accuracy of a probability.', '\"False\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: \"Scorer\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-26 19:27:38'),
(79, 'Which scorer does Driverless AI automatically use when you have imbalanced data?', '[\"Logloss\",\"MCC\",\"Accuracy\", \"AUC\"]', 1, 1, 'Multiple Choice', 0, 1, NULL, 1, 'labels: \"Scorer\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-26 19:28:41'),
(80, 'Which scorer gives more weight to precision?', '[\"F0.5\", \"Logloss\", \"F2\", \"AUCPR\"]', 1, 1, 'Multiple Choice', 0, 1, NULL, 1, 'labels: \"Scorer\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-26 19:29:16'),
(81, 'Which scorer gives more weight to recall?', '[\"F2\", \"AUCPR\", \"F1\", \"Logloss\"]', 1, 1, 'Multiple Choice', 0, 1, NULL, 1, 'labels: \"Scorer\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-26 19:29:42'),
(82, 'Which of the following scorers is best to use when you want to evaluate based on probability?', '[\"Logloss\",\"AUC\", \"F1\", \"MCC\"]', 1, 1, 'Multiple Choice', 0, 1, NULL, 1, 'labels: \"Scorer\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-26 19:30:17'),
(83, 'Which set of scorers evaluates based on class?', '[\"F1, Accuracy, AUC\", \"MCC, Accuracy, Logloss\", \"Logloss, Accuracy, AUCPR\", \"MCC, Logloss, F2\"]', 1, 1, 'Multiple Choice', 0, 1, NULL, 1, 'labels: \"Scorer\"; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-26 19:31:06'),
(84, 'In time series, a column that is noted as being unavailable at the time of prediction will only have lag-related features created for/with it.', '\"True\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: [\"Experiments\", \"Time Series\"]; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-26 20:50:03'),
(85, 'Generally raw time series features are more useful features for Machine Learning Interpretability than munged time series features.', 'False', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: [\"Experiments\", \"Time Series\"]; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-26 20:51:52'),
(86, 'The feature pre-pruning strategy come into play at what point?', '\"False\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: [\"Experiments\", \"Time Series\"]; author: David Engler', '2020-05-06 18:41:05', '2020-05-26 20:52:32'),
(87, 'ARIMA time series models are among the models included as defaults when generating a time series experiment.', '\"False\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: [\"Experiments\", \"Time Series\"]; author: David Engler', '2020-05-06 18:41:05', '2020-05-26 20:53:26'),
(88, 'For a time series experiment, the underlying data must contain lagged variables as separate variables prior to the start of the experiment.', '\"False\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: [\"Experiments\", \"Time Series\"]; author: David Engler', '2020-05-06 18:41:05', '2020-05-26 20:54:24'),
(89, 'Driverless AI will not only automatically create lagged variables in a time-series experiment, but will also automatically examine aggregated features on those lagged variables.', '\"True\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: [\"Experiments\", \"Time Series\"]; author: David Engler', '2020-05-06 18:41:05', '2020-05-26 20:55:17'),
(90, 'The term \"gap\" in time series experiments refers to what concept?', '[\"The time gap between the end of the training data and the start of the test data\", \"The time gap between the end of the test set and the expected start date for production forecasting\", \"The length of the future period for which the model will make predictions\", \"The time gap between the end of the validation data and the start of the test data\"]', 1, 0, 'Multiple Choice', 0, 1, NULL, 1, 'labels: [\"Experiments\", \"Time Series\"]; author: David Engler', '2020-05-06 18:41:05', '2020-05-26 21:36:21'),
(91, 'Exponential weighting in time series refers to the weighting of recent values more heavily than less recent values.', '\"True\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: [\"Experiments\", \"Time Series\"]; author: David Engler', '2020-05-06 18:41:05', '2020-05-26 20:59:11'),
(92, 'In time series experiments, as a general rule, the training set should have _______ as observations as the test set has. ', '[\"3 times as many\", \"at least as many\",\"2 times as many\", \"4 times as many\"]', 1, 1, 'True/False', 0, 1, NULL, 1, 'labels: [\"Experiments\", \"Time Series\"]; author: David Engler', '2020-05-06 18:41:05', '2020-05-26 21:04:49'),
(93, 'If \"AUTO\" is selected for the time column and a string column with datetime format is identified, Driverless AI will automatically respect the causality of time for feature engineering and model validation.', '\"True\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: [\"Experiments\", \"Time Series\"]; author: David Engler', '2020-05-06 18:41:05', '2020-05-26 21:06:43'),
(94, 'For time series experiments, target encoding transformations are deactivated.', '\"True\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: [\"Experiments\", \"Time Series\"]; author: David Engler', '2020-05-06 18:41:05', '2020-05-26 21:07:54'),
(95, 'Driverless AI can automatically create and examine the effect of lags for what type of variables?', '[\"Both target and features\",\"Target\",\"Features\",\"Neither; all lagged variables must be created prior to the running of an experiment.\"]', 1, 1, 'True/False', 0, 0, NULL, 1, 'labels: [\"Experiments\", \"Time Series\"]; author: David Engler', '2020-05-06 18:41:05', '2020-05-26 21:37:21'),
(96, 'Both Python and MOJO scoring pipelines are supported for Follow the Regularized Leader (FTRL) models.', '\"False\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: [\"Scoring Pipeline\"]; author: Chemere Davis', '2020-05-06 18:41:05', '2020-05-26 21:37:36'),
(97, 'MOJOs are available for RuleFit models.', '\"False\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, '[\"Scoring Pipeline\"]; author: David Engler', '2020-05-06 18:41:05', '2020-05-26 21:16:11'),
(98, 'MOJOs will automatically be available for most custom recipes.', '\"False\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: [\"Scoring Pipeline\"]; author: David Engler', '2020-05-06 18:41:05', '2020-05-26 21:22:06'),
(99, 'k-LIME reason codes can be obtained from ___________ . ', '[\"MLI Standalone Python Scoring Pipeline\", \"Python Scoring Pipeline\", \"MOJO Scoring Pipeline\"]', 1, 1, 'Multiple Choice', 0, 1, NULL, 1, 'labels: [\"Scoring Pipeline\"]; author: David Engler', '2020-05-06 18:41:05', '2020-05-26 21:37:52'),
(100, 'Shapley reason codes can be obtained from ___________ .', '[\"Python Scoring Pipeline & MLI Standalone Python Scoring Pipeline\", \"Python Scoring Pipeline\", \"MLI Standalone Python Scoring Pipeline\"]', 1, 1, 'Multiple Choice', 0, 1, NULL, 1, 'labels: [\"Scoring Pipeline\"]; author: David Engler', '2020-05-06 18:41:05', '2020-05-26 21:27:23'),
(101, 'Shapley reason codes are only available for XGBoost and LightGBM models.', '\"False\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: [\"Scoring Pipeline\"]; author: David Engler', '2020-05-06 18:41:05', '2020-05-26 21:33:37'),
(102, 'Which of the following is not a good use case for out-of-the-box Driverless AI?', '[\"Finding new topics in Customer Reviews\", \"Predicting which customers will churn\", \"Forecasting product sales\", \"Identifying parts most likely to fail\"]', 1, 1, 'Multiple Choice', 0, 1, NULL, 1, 'labels: \"Usage\"; author: Michelle Tanco', '2020-05-06 18:41:05', '2020-05-26 21:42:37'),
(103, 'Driverless AI is a SaaS offering.', '\"False\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: Usage; author: Michelle Tanco', '2020-05-06 18:41:05', '2020-05-26 21:43:45'),
(104, 'If you do not explicitly select the \"Fold\" column, then DAI will select the best column to do the training-validation split on.', '\"False\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: Usage; author: Michelle Tanco', '2020-05-06 18:41:05', '2020-05-26 21:44:36'),
(105, 'The final scoring pipeline is always an ensemble of models.', '\"False\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: ; author: ', '2020-05-06 18:41:05', '2020-05-26 21:45:46'),
(106, 'How are the final scoring pipelines ensembles constructed?', '[\"stacked ensemble\", \"mean of the individual models\' predictions\", \"median of the individual models\' predictions\"]', 1, 1, 'Multiple Choice', 1, 1, NULL, 1, 'labels: ; author: ', '2020-05-06 18:41:05', '2020-05-26 21:46:58'),
(107, 'MOJOs are thread-safe and an instance of MOJO loaded into memory can be used concurrently.', '\"True\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: ; author: ', '2020-05-06 18:41:05', '2020-05-26 19:00:27'),
(108, 'Multiclass classification is possible in Driverless AI.', '\"True\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, 'labels: ; author: ', '2020-05-06 18:41:05', '2020-05-26 21:48:51'),
(109, 'Multi-label classification is supported in Driverless AI.', '\"False\"', NULL, NULL, 'True/False', NULL, NULL, NULL, 1, '', '2020-05-06 18:41:05', '2020-05-26 21:50:22'),
(110, 'How can one reduce the size of a MOJO?', '[\"Reduce accuracy\", \"Increase interpretibility\", \"Reduce \'Max. feature interaction depth\' in expert settings\", \"Reduce \'Max. number of engineered features\' in expert settings\"]', 0, 1, 'Multiple Choice', 1, 1, NULL, 1, 'labels: [\"Scoring Pipeline\", \"Experiments\"]; author: Joe Granados', '2020-05-06 18:41:05', '2020-05-26 21:51:55');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
CREATE TABLE `results` (
  `id` int(10) UNSIGNED NOT NULL,
  `experiments_id` int(11) DEFAULT NULL,
  `field` varchar(50) DEFAULT NULL,
  `value` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` text,
  `login` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `student_answers`
--

DROP TABLE IF EXISTS `student_answers`;
CREATE TABLE `student_answers` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `questions_id` int(11) DEFAULT NULL,
  `score` double DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `tags`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `tags`;
CREATE TABLE `tags` (
`id` int(11)
,`name` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
CREATE TABLE `tests` (
  `id` int(10) UNSIGNED NOT NULL,
  `definition_id` int(11) DEFAULT NULL,
  `seed` bigint(20) DEFAULT NULL,
  `question_list` text,
  `experiments` text,
  `none_prob` double NOT NULL DEFAULT '0.2',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`id`, `definition_id`, `seed`, `question_list`, `experiments`, `none_prob`, `created_at`) VALUES
(2, 1, 26603983654107310, '(1, 5, 8, 9, 11, 14, 17, 18, 20, 21, 23, 29, 30, 31, 32, 34, 41, 42, 48, 49, 50, 51, 61, 62, 64, 65, 66, 68, 69, 76, 77, 78, 84, 85, 86, 87, 88, 89, 91, 92, 93, 94, 95, 96, 97, 98, 101, 103, 104, 105, 107, 108, 109, 2, 3, 4, 6, 7, 10, 12, 13, 15, 16, 19, 22, 24, 25, 26, 27, 28, 33, 35, 36, 37, 38, 39, 40, 43, 44, 45, 46, 47, 52, 53, 54, 55, 56, 57, 58, 59, 60, 63, 67, 70, 71, 72, 73, 74, 75, 79, 80, 81, 82, 83, 90, 99, 100, 102, 106, 110)', NULL, 0.2, '2020-05-27 21:57:52'),
(4, 2, 2807857878884242740, '(1, 5, 8, 9, 11, 14, 17, 18, 20, 21, 23, 29, 30, 31, 32, 34, 41, 42, 48, 49, 50, 51, 61, 62, 64, 65, 66, 68, 69, 76, 77, 78, 84, 85, 86, 87, 88, 89, 91, 92, 93, 94, 95, 96, 97, 98, 101, 103, 104, 105, 107, 108, 109, 2, 3, 4, 6, 7, 10, 12, 13, 15, 16, 19, 22, 24, 25, 26, 27, 28, 33, 35, 36, 37, 38, 39, 40, 43, 44, 45, 46, 47, 52, 53, 54, 55, 56, 57, 58, 59, 60, 63, 67, 70, 71, 72, 73, 74, 75, 79, 80, 81, 82, 83, 90, 99, 100, 102, 106, 110)', NULL, 0.2, '2020-05-27 22:10:41');

-- --------------------------------------------------------

--
-- Table structure for table `test_definitions`
--

DROP TABLE IF EXISTS `test_definitions`;
CREATE TABLE `test_definitions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text,
  `dai_version` varchar(15) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `test_definitions`
--

INSERT INTO `test_definitions` (`id`, `name`, `description`, `dai_version`, `created_at`, `last_modified`) VALUES
(1, 'All', 'All questions in database', NULL, '2020-05-06 18:43:05', '2020-05-27 18:17:06'),
(2, 'TF then MC', 'First TF then MC', NULL, '2020-05-06 19:06:56', '2020-05-27 18:17:19');

-- --------------------------------------------------------

--
-- Table structure for table `test_subqueries`
--

DROP TABLE IF EXISTS `test_subqueries`;
CREATE TABLE `test_subqueries` (
  `id` int(10) UNSIGNED NOT NULL,
  `definition_id` int(11) DEFAULT NULL,
  `section` int(11) DEFAULT '1',
  `prefix` varchar(50) DEFAULT 'SELECT id FROM question_templates ',
  `definition` varchar(255) DEFAULT '',
  `n` int(11) NOT NULL DEFAULT '0',
  `randomize` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `test_subqueries`
--

INSERT INTO `test_subqueries` (`id`, `definition_id`, `section`, `prefix`, `definition`, `n`, `randomize`, `created_at`, `last_modified`) VALUES
(1, 1, 1, 'SELECT id FROM question_templates', 'where enabled=1', 0, 0, '2020-05-06 19:00:36', '2020-05-27 18:21:09'),
(2, 2, 1, 'SELECT id FROM question_templates ', 'where type=\'True/False\'', 0, 0, '2020-05-06 19:18:59', '2020-05-06 19:21:29'),
(3, 2, 2, 'SELECT id FROM question_templates ', 'where type=\'Multiple Choice\'', 0, 0, '2020-05-06 19:18:59', '2020-05-06 19:21:37'),
(4, 1, 1, 'SELECT id FROM question_templates ', '', 0, 0, '2020-05-08 03:39:22', '2020-05-08 03:39:22');

-- --------------------------------------------------------

--
-- Structure for view `tags`
--
DROP TABLE IF EXISTS `tags`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tags`  AS  select `b`.`templates_id` AS `id`,`a`.`name` AS `name` from (`label_list` `a` join `labels` `b`) where (`a`.`id` = `b`.`labellist_id`) order by `b`.`templates_id`,`a`.`name` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `datasets`
--
ALTER TABLE `datasets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `experiments`
--
ALTER TABLE `experiments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `definition_id` (`definition_id`);

--
-- Indexes for table `exp_definitions`
--
ALTER TABLE `exp_definitions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dataset_id` (`dataset_id`);

--
-- Indexes for table `labels`
--
ALTER TABLE `labels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `templates_id` (`templates_id`),
  ADD KEY `labellist_id` (`labellist_id`);

--
-- Indexes for table `label_list`
--
ALTER TABLE `label_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `test-number` (`number`,`test_id`),
  ADD KEY `test_id` (`test_id`),
  ADD KEY `template_id` (`template_id`);

--
-- Indexes for table `question_templates`
--
ALTER TABLE `question_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enabled` (`enabled`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `experiments_id` (`experiments_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_answers`
--
ALTER TABLE `student_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questions_id` (`questions_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `definition_id` (`definition_id`);

--
-- Indexes for table `test_definitions`
--
ALTER TABLE `test_definitions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_subqueries`
--
ALTER TABLE `test_subqueries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `definition_id` (`definition_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `datasets`
--
ALTER TABLE `datasets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `experiments`
--
ALTER TABLE `experiments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_definitions`
--
ALTER TABLE `exp_definitions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `labels`
--
ALTER TABLE `labels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT for table `label_list`
--
ALTER TABLE `label_list`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `question_templates`
--
ALTER TABLE `question_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_answers`
--
ALTER TABLE `student_answers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `test_definitions`
--
ALTER TABLE `test_definitions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `test_subqueries`
--
ALTER TABLE `test_subqueries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
