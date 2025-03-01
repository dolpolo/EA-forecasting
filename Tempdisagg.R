# ---- SET DIRECTORY
getwd()
path <- "C:/Users/david/Desktop/University/Master's Thesis/EA-forecasting"
setwd(path)


# ---- LIBRARIES
library(dplyr)
library(tidyverse)
library(ggplot2)
library(writexl)
library(readxl)
library(xtable)
library(tempdisagg)


# **************************************************************************** #
# ************************** TEMPORAL DISAGGREGATION ************************* #
# **************************************************************************** #  

# This code aims to empirically reproduce the Chow Lin  Temporal disaggregation
# presented in "Best Linear Unbiased Interpolation, Distribution, and Extrapolation 
# of Time Series by Related Series.
# Interpolation and Distribution are performed to handle the mix-frequency of the EA
# data to provide a smoother representation of the time series


# **************************************************************************** # 

# Load Monthly and Quarterly data
EAdataQ <- read_xlsx("data/EA-MD-QD/EAdataQ_HT.xlsx")  # %>%
 # filter(Time <= as.Date("2024-10-01"))

EAdataM <- read_xlsx("data/EA-MD-QD/EAdataM_HT.xlsx") # %>%
 # filter(Time <= as.Date("2024-10-01")) %>%
# filter(Time >= as.Date("2000-04-01"))
print(names(EAdataM))

# Convert the variables in Time series 
ts_GDP <- ts(EAdataQ$GDP_EA, start = c(2000, 1), frequency = 4)

monthly_vars <- EAdataM %>% select(-Time)  # Rimuove la colonna Time
for (var in names(monthly_vars)) {
  assign(var, ts(monthly_vars[[var]],start = c(2000, 1), frequency = 12))
}


# Applichiamo td() usando l'ambiente locale
result_GDP <- td(ts_GDP ~  
                   UNETOT_EA + UNEO25_EA + UNEU25_EA + REER42_EA + ERUS_EA + IRT3M_EACC +
                   IRT6M_EACC + LTIRT_EACC + IPMN_EA + IPCAG_EA + IPCOG_EA + IPDCOG_EA + 
                   IPNDCOG_EA + IPING_EA + IPNRG_EA + TRNMN_EA + TRNCAG_EA + TRNCOG_EA + 
                   TRNDCOG_EA + TRNNDCOG_EA + TRNING_EA + TRNNRG_EA + PPICAG_EA + PPICOG_EA + 
                   PPINDCOG_EA + PPIDCOG_EA + PPIING_EA + PPINRG_EA + HICPOV_EA + HICPNEF_EA + 
                   HICPG_EA + HICPIN_EA + HICPSV_EA + HICPNG_EA + ICONFIX_EA + CCONFIX_EA + 
                   ESENTIX_EA + KCONFIX_EA + RTCONFIX_EA + SCONFIX_EA + BCI_EA + CCI_EA + 
                   CURR_EACC + M1_EACC + M2_EACC + SHIX_EA + CAREG_EA, 
                 method = "chow-lin-maxlog"
)


# Output
summary(result_GDP)
plot(result_GDP)

cat("the main variables for interpolating the gdp are prices (inflation) and 
    turnover (industrial production)")