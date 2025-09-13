# Assessment of Diabetes Mellitus Classification and Personalized Risk Factor Identification Based on Explainable Artificial Intelligence 

This repository supplements the study on diabetes (Pre-DM/DM) risk prediction using clinical and health checkup data, with explainable insights from SHAP/XAI and piecewise regression.


![Image](https://github.com/user-attachments/assets/cebc6c19-9508-469b-a196-f406709c2223)


## Files

**The main files are as follows:**

* [preprocess.ipynb](https://github.com/HyeonseopYuk/dm-risk-xai/blob/main/preprocess.ipynb) – Data loading and preprocessing (cleaning, encoding, train/test split).

* [statistic.R](https://github.com/HyeonseopYuk/dm-risk-xai/blob/main/statistic.R) – Basic descriptive statistics and summary analysis of the dataset.

* [Analysis_code.ipynb](https://github.com/HyeonseopYuk/dm-risk-xai/blob/main/Analysis_code.ipynb) – Model training (LR, RF, XGBoost, LightGBM), evaluation, and SHAP-based explainability.

* [Piecewise Regression.ipynb](https://github.com/HyeonseopYuk/dm-risk-xai/blob/main/Piecewise%20Regression.ipynb) – Piecewise linear regression on SHAP values to detect breakpoints.


**Input Data**

Folder: All datasets are stored in the DAT/ directory.

**Files:**

- (XAI)Analysis_sample.xlsx – Sample dataset provided for testing explainability workflows.

- Health checkup sample.xlsx – Example health checkup dataset for demonstration purposes.

**Notes:**

Patient IDs have been anonymized (hashed) to ensure privacy.

These are sample datasets only; original/raw data are not included in the repository.

The files are intended for running code examples and reproducing the analysis pipeline.



## Development and Dependencies

* Python 3.13
* Use pip install -r requirements.txt to install dependencies.

  
