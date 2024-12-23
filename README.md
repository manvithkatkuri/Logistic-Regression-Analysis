# Logistic Regression Analysis

This project involves preprocessing email data and performing logistic regression analysis to classify emails as spam or not spam. The analysis uses both full and reduced models to evaluate significant predictors and calculate predicted probabilities.

---

## Objectives
1. Preprocess data from the provided dataset.
2. Develop a full logistic regression model to classify emails.
3. Create a reduced logistic regression model with select predictors.
4. Generate predicted probabilities for all combinations of independent variables.
5. Rank predictions based on probabilities.

---

## Dataset
The dataset includes information on 3914 emails with the following variables:
- **spam**: Binary target variable indicating if an email is spam.
- **Independent Variables**: 
  - `to_multiple`: Indicator for multiple recipients.
  - `image`: Count of image attachments.
  - `dollar`: Frequency of dollar symbols.
  - `winner`: Presence of the word "winner".
  - `inherit`: Occurrence of inheritance-related words.
  - `password`: Count of password-related terms.
  - `format`: Indicator for formatted emails.
  - `re_subj`, `urgent_subj`, `exclaim_subj`: Subject line indicators.

---

## Steps and Results

### 1. Preprocessing
- The dataset was loaded, and column names were standardized.
- A random sample of 750 rows was selected for analysis.

### 2. Full Logistic Regression Model
- Included all predictors.
- **Result**: Variables with significant effects on the probability of spam:
  - `format` (negative effect)
  - `re_subj` (negative effect)

### 3. Reduced Logistic Regression Model
- Selected predictors: `to_multiple`, `dollar`, `inherit`, `password`, and `format`.
- **Result**: Variables with significant effects on spam classification:
  - `format` (negative effect)
  - `inherit` (positive effect, marginally significant)

### 4. Predicted Probabilities
- Used the `expand.grid` function to generate all combinations of independent variable values.
- Calculated predicted probabilities for each combination.

### 5. Ranked Predictions
- Predictions were sorted in descending order of probabilities.
- Top and bottom predictions were displayed.

---

## Tools and Libraries
- **R**:
  - `rio` for data import.
  - `glm` for logistic regression models.
  - `expand.grid` for generating prediction combinations.

---
