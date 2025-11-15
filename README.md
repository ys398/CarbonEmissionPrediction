## Carbon Emission Forecasting with LSTM (China, 1997–2049)
Forecasting CO₂ emissions for 29 Chinese provinces from 2022 to 2049 using an extended STIRPAT model and LSTM. Code is written in MATLAB.

## Overview
- Data: CEADS provincial CO₂ emissions and National Bureau of Statistics data, 1997–2021.
- Scope: 29 provinces with relatively complete time series.
- Preprocessing: merge datasets, fill gaps with cubic spline interpolation, standardise variables where needed.

## Methods
- Build province-level log-linear STIRPAT regressions, adding drivers such as secondary industry output, fossil fuel consumption and clean energy share.
- Use the cleaned series as inputs to LSTM models to generate long-term emission forecasts.
- For Liaoning, fit an ARIMA model as a benchmark and compare its forecasts with the LSTM results.
- Use the forecast paths to discuss possible carbon peak years by province.

## Implementation
- Contents: scripts for data loading/cleaning, correlation analysis, STIRPAT regression, LSTM training, ARIMA (Liaoning) and plotting.
- Hyper-parameters were tuned by hand using RMSE on a small validation set; you can adjust them if you rerun the experiments.

## Note
In the original thesis code, the step that converts log-values back to the original scale includes an extra correction term as a quick workaround. It is kept here for reproducibility and can be refined later.
