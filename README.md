# Socioeconomic Profiling through Census Data Analysis

## 📌 Objective
Predict individual income classification (>50K or ≤50K) using the Adult Census dataset and analyze socioeconomic factors influencing earning potential to support policy and resource allocation decisions.

---

## 📂 Dataset
- **Source:** UCI Adult Census dataset (not included due to licensing)
- **Demo Data:** This repository contains a **synthetic dummy dataset** (`dummy_census_data.csv`) with the **same columns and structure** as the original for demonstration purposes.
- **Columns:**
  - `age` (numeric)
  - `workclass` (categorical)
  - `education` (categorical)
  - `hours_per_week` (numeric)
  - `occupation` (categorical)
  - `income` (categorical: >50K or <=50K)

---

## 🛠 Tools & Methods
- **Languages & Libraries:**
  - R: tidyverse, caret, rpart, neuralnet, ggplot2
  - Python (optional version for demo): pandas, matplotlib, seaborn
- **Data Preparation:**
  - Missing value imputation
  - Feature encoding for categorical variables
  - Outlier handling
- **Model Development:**
  - **Logistic Regression** (Binary model)
  - **Decision Tree** (rpart)
  - **Neural Network** (neuralnet)
- **Regression Model Choice:**
  - Compared binary logistic, clustered, and repeated measures models for subgroup insights
- **Covariate Adjustment:**
  - Removed multicollinear features (VIF check)
  - Controlled for confounders (education, hours worked, occupation)
- **Evaluation Metrics:**
  - Accuracy, AUC, ROC Curve
  - Precision, Recall, Sensitivity, Specificity

---

## 📊 Key Results
- Logistic Regression and Neural Network achieved ~80–81% accuracy
- Decision Tree selected as optimal model due to interpretability
- Identified key predictors of income: education level, hours worked, occupation, capital gains

---

## 📂 Repository Structure
