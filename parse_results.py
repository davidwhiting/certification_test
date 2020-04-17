import pandas as pd

##### PARSE RESULTS

#### feature importance
features = pd.read_table("features.txt", sep=',', skipinitialspace=True)
## feature importance
features['Relative Importance']
## feature description
features['Feature']

#### feature importance
features_orig = pd.read_table("features_orig.txt", sep=',', skipinitialspace=True)
## feature importance
features_orig['Original Feature']


#### coefficients
coefs = pd.read_table("coefs.txt", sep=',', skipinitialspace=True)
coefs['Coefficient']
coefs['Feature']

#### ensemble_coefs
ensemble_coefs = pd.read_table("ensemble_coefs.txt", sep=',', skipinitialspace=True)
ensemble_coefs['Coefficient']
ensemble_coefs['Feature']

