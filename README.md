# Master's Thesis

## Forecasting Euro Area Macroeconomic Indicators: A Comparative Analysis of Machine Learning Methods and Their Implications for Shaping Monetary Policy

### Main References:
- **De Mol, Christine, Domenico Giannone, and Lucrezia Reichlin (2008). “Forecasting using a large number of predictors: Is Bayesian shrinkage a valid alternative to principal components?”**
- **Fan, Jianqing, Yuan Ke, and Kaizheng Wang (2020). “Factor-adjusted regularized model selection”**
- **Fan, Jianqing, Yuan Ke, and Kaizheng Wang (2020). “Factor-adjusted regularized model selection”**
- **Kelly, Bryan and Seth Pruitt (2015). “The three-pass regression filter: A new approach to forecasting using many predictors”**
- **Chow, Gregory C and An-loh Lin (1971). “Best linear unbiased interpolation, distribution, and extrapolation of time series by related series”**

Author: 
- **Davide Delfino**, University of Bologna

---

## Overview
This project trains and compares the forecasting performances of alternative forecasting methods for high-dimensional macroeconomic data. 
The main R scripts involved are:  
- `Tempdisagg.R`  
- `Bayesian_Shrinkage.R`  
- `FarmSelect.R`
- `ThreePassRegression.R`

The outputs include:
1. Factor model forecasts (**Principal Components Regression**, PCR).  
2. Bayesian regression with i.i.d. normal prior (**Ridge Regression**).  
3. Bayesian regression with i.i.d. Laplace prior (**LASSO Regression**).  
4. Factor-Adjusted model (**FarmSelect**).
5. Three Pass Regression filter model (**TPR**)
6. Tempdisagg 

The main MATLAB scripts involved are: 
- `Nowcasting.m`

The outputs include:
1. Nowcasts (**Nowcast**).  

The data used in this project were retrieved from:  
**Barigozzi, M., & Lissona, C. (2024)**: *EA-MD-QD: Large Euro Area and Euro Member Countries Datasets for Macroeconomic Research (Version 12.2023)*.  
[Zenodo DOI: 10.5281/ZENODO.10514668](https://doi.org/10.5281/ZENODO.10514668).

---

## Scripts

### Main Scripts
- **`Bayesian_Shrinkage.R`**: Trains and compares forecasting methods for PCR, Ridge, and LASSO.  
- **`FarmSelect.R`**: Implements the Factor-Adjusted Regression Model (FarmSelect).
- **`ThreePassRegression.R`**: Implements the Factor-Adjusted Regression Model (FarmSelect).
- **`Nowcast.m`**: Implements the Factor-Adjusted Regression Model (FarmSelect).  
- **`Forecasting_methods.R`**: Produces out-of-sample forecasts for all models.  
- **`2025_predictions.R`**: Produces counterfactual forecasts for the best-performing models for 2025.  

### Supporting Scripts

- **`R/functions`:**
- `Tempdisagg.R`: Performs a temporal diaggregation for target variables to be compared with nowcasting
- `Bayesian_shrinkage_functions.R`: Defines parameters and computes forecasts for PCR, LASSO, and Ridge regression.  
- `FarmSelect_functions.R`: Defines parameters and computes forecasts for FarmSelect.
- `FarmSelect_functions.R`: Defines parameters and computes forecasts for FarmSelect.

- **`MATLAB/functions`:**
- `Nowcast_functions.m`: Defines parameters and computes forecasts for PCR, LASSO, and Ridge regression.
---

## Instructions

### Loading Data
Data is stored in the `data/EA-MD-QD/` folder.  
Use the script `Bayesian_Shrinkage.R` to load and preprocess the data, ensuring the correct working directory is set.  

### Troubleshooting `source()`:
If the `source()` function does not load the R functions correctly, manually run each function in the `R/functions` folder before executing the main scripts.

---

## Additional Scripts
- **`Descriptive_analysis.R`**: Provides a descriptive analysis of the dataset.

---

## How to Run
1. Clone this repository to your local machine.
2. Set the working directory to the project folder:
   ```R
   path <- "C:/Users/Davide/Desktop/Alma Mater/SECOND YEAR/Machine Learning/Machine-Learning-Project"
   setwd(path)
