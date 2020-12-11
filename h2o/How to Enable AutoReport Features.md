# How to Enable AutoReport Features

CBA's features can be enabled with Driverless AI's [Python Client](http://docs.h2o.ai/driverless-ai/latest-stable/docs/userguide/python_client.html) or via the [config.toml](http://docs.h2o.ai/driverless-ai/latest-stable/docs/userguide/config_toml.html).

CBA features include:

* Control over the number of features displayed in the feature importance tables.
* Control over the number of records to show in ICE overlay plots.
* Control over the time Partial Dependence Plots (PDP) take to complete.
* Whether to include prediction statistics for every data split, and control over the number of quantiles.
* Whether to include the Population Stability Index, and control over the number of quantiles.
* Whether to include permutation based importance. This includes the ability to specify the number of permutations and the scorer (i.e., a DAI scorer like Gini).
* Whether to include response rate plots and tables, and control over the number of quantiles.
* Whether to include a Gini plot for the data splits.
* The ability to provide additional test datasets.
* The ability to get DAI metrics (including custom scorers) on all data splits.

## Using the Python Client

The following example shows how to run an AutoReport, for an existing experiment, with all CBA features enabled.

#### 1. Connect to a Running DAI Instance
```
# connect to running DAI instance
from h2oai_client import Client
port = 12345
address = 'http://127.0.0.1:'+ str(port)
username = 'username'
password = 'xxxx'
h2oai = Client(address = address, username = username, password = password)
```
#### 2. Specify the Experiment Key and Additional Dataset Keys
The AutoReport takes in the experiment key of a completed experiment. To include results for a dataset not used during the experiment, upload the dataset to DAI and pass that dataset's key to the AutoReport.

```
# specify the experiment key 
exp_key ="53397d1a-d584-11e9-b3ed-ac1f6b6823da"

# if applicable specify additional dataset to show within the report
external_dataset_keys = ["2dc03e5a-d586-11e9-b3ed-ac1f6b6823da"]
```

#### 3. Enable CBA Features 

The AutoReport can be configured via the `config_overrides` parameter, which takes a TOML string format. 

The code below shows how to set the `config_overrides` parameter and pass it to the `create_and_download_autoreport()` function, which creates and downloads your AutoReport document.


**Set the `config_overrides` Python variable**

```
# PDP and ICE
config_overrides = "autodoc_num_features=20"
config_overrides += "\nautodoc_pd_max_runtime=30"
config_overrides += "\nautodoc_num_rows=4"
```
* Limit the feature importance table to 20 features
* Limit the Partial Dependence Plot calculations to 30 seconds
* Show 4 automatically selected rows on the PDP plots (if individual rows are not manually specified). To show manually selected rows in the AutoReport, pass the `individual_rows` argument, which takes a list of row indices, to the `create_and_download_autoreport()` function. 

```
# Prediction statistics
config_overrides += "\nautodoc_prediction_stats=true"
config_overrides += "\nautodoc_prediction_stats_n_quantiles=10"
```
* Enable the Prediction Statistics for each dataset split
* Set quantiles to 10

```
# PSI
config_overrides += "\nautodoc_population_stability_index=true"
config_overrides += "\nautodoc_population_stability_index_n_quantiles=10"
```
* Enable the Population Stability Index for each dataset split
* Set quantiles to 10

```
# Permutation feature importance
config_overrides += "\nautodoc_include_permutation_feature_importance=true"
config_overrides += "\nautodoc_feature_importance_scorer='GINI'"
config_overrides += "\nautodoc_feature_importance_num_perm=1"
```
* Enable the permutation feature importance table and plot
* Set the permutation importance scorer to GINI
* Only shuffle the data once

```
# Response rates
config_overrides += "\nautodoc_response_rate=true"
config_overrides += "\nautodoc_response_rate_n_quantiles=10"
```
* Enable the response rate plot for each dataset split
* Set the quantiles to 10

```
# Gini plot
config_overrides += "\nautodoc_gini_plot=true"
```
* Show the Gini Plot

```
# Custom Scorers
config_overrides += "\nincluded_scorers=['BRIER', 'GINI','AUC']"
```
* Enable custom scorers for each dataset split

Once you've specified the individual parameters, print out the `config_overrides` parameters to verify your settings are correct.

```
>>> print(config_overrides)

autodoc_num_features=20
autodoc_pd_max_runtime=30
autodoc_num_rows=4
autodoc_prediction_stats=true
autodoc_prediction_stats_n_quantiles=10
autodoc_population_stability_index=true
autodoc_population_stability_index_n_quantiles=10
autodoc_include_permutation_feature_importance=true
autodoc_feature_importance_scorer='GINI'
autodoc_feature_importance_num_perm=1
autodoc_response_rate=true
autodoc_response_rate_n_quantiles=10
autodoc_gini_plot=true
included_scorers=['BRIER', 'GINI','AUC']
```

#### Build the AutoReport
* `exp_key`: specify the experiment key
* `config_overrides`: specify the AutoReport configuration overrides
* `external_dataset_keys`: (optional) specify external datasets as a list of keys
* `dest_dir`: specify the destination directory where the report will be downloaded
* `individual_rows`: (optional and not shown below) specify a list of row indices in the training dataset to shown in ICE/PDP plots.
* Print the path to the report

```
report = h2oai.create_and_download_autoreport(exp_key,
                                    config_overrides=config_overrides,
                                    external_dataset_keys=external_dataset_keys,
                                    dest_dir="/home/my_dai_reports/"
                                   )
print('report path:', report)
```


## Using the `config.toml`:

Updates to the `config.toml` affect all experiments. As a result, caution should be used when enabling the following features:

* autodoc_pd_max_runtime
* autodoc_include_permutation_feature_importance

Depending on the dataset, these features can take a long time to complete. As a results, it is recommended that these parameters are set for specific experiments via the Python Client.  

A snippet of the default `config.toml` settings, for the AutoReport (`autodoc`), are shown below. To update a setting, uncomment the variable line and corresponding value. For example to update the number of features shown in the features importance table from the default of 50 to 20:

```
# Specify the number of top features to display in
# the document. setting to -1 disables this restriction
autodoc_num_features = 20
```



**Note: the CBA features are all turned off by default.**

```
# Specify the number of top features to display in
# the document. setting to -1 disables this restriction
#autodoc_num_features = 50

# Specify the number of rows to include in PDP and ICE plot
# if individual rows are not specified.
#autodoc_num_rows = 0

# Maximum number of seconds Partial Dependency computation
# can take when generating report. Set to -1 for no time limit.
#autodoc_pd_max_runtime = 20

# Number of standard deviations outside of the range of
# a column to include in partial dependence plots. This shows how the
# model will react to data it has not seen before.
#autodoc_out_of_range = 3

# Number of columns to be show in data summary. Value
# must be an integer. Values lower than 1, f.e. 0 or -1, indicate that
# all columns should be shown.
#autodoc_data_summary_col_num = -1

# Whether to include prediction statistics information if
# experiment is binary classification/regression.
#autodoc_prediction_stats = false

# Number of quantiles to use for prediction statistics
# computation.
#autodoc_prediction_stats_n_quantiles = 20

# Whether to include population stability index if
# experiment is binary classification/regression.
#autodoc_population_stability_index = false

# Number of quantiles to use for population stability index
# computation.
#autodoc_population_stability_index_n_quantiles = 10

# Whether to compute permutation based feature importance.
#autodoc_include_permutation_feature_importance = false

# Name of the scorer to be used to calculate feature
# importance. Leave blank to use experiments default scorer
#autodoc_feature_importance_scorer = ""

# Number of permutations to make per feature when computing
# feature importance.
#autodoc_feature_importance_num_perm = 1

# Whether to include response rates information if
# experiment is binary classification.
#autodoc_response_rate = false

# Number of quantiles to use for response rates information
# computation.
#autodoc_response_rate_n_quantiles = 10

# Whether to show the Gini Plot.
#autodoc_gini_plot = false
```


## Appendix

All CBA configurations for the Python Client's `config_overrides` parameter are shown below. 

**Show All**

* Use `autodoc_num_features = -1` if you want to show all features in the feature importance table. 
* Use `autodoc_pd_max_runtime = -1` if you want PDP calculations to complete without a time limit.

```
# PDP and ICE
config_overrides = "autodoc_num_features=-1"
config_overrides += "\nautodoc_pd_max_runtime=-1"
config_overrides += "\nautodoc_num_rows=4"

# Prediction statistics
config_overrides += "\nautodoc_prediction_stats=true"
config_overrides += "\nautodoc_prediction_stats_n_quantiles=10"

# PSI
config_overrides += "\nautodoc_population_stability_index=true"
config_overrides += "\nautodoc_population_stability_index_n_quantiles=10"

# Permutation feature importance
config_overrides += "\nautodoc_include_permutation_feature_importance=true"
config_overrides += "\nautodoc_feature_importance_scorer='GINI'"
config_overrides += "\nautodoc_feature_importance_num_perm=1"

# Response rates
config_overrides += "\nautodoc_response_rate=true"
config_overrides += "\nautodoc_response_rate_n_quantiles=10"

# Gini plot
config_overrides += "\nautodoc_gini_plot=true"

# Custom Scorers
config_overrides += "\nincluded_scorers=['BRIER', 'GINI','AUC']"
```