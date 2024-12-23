# Load required libraries
library(rio)

# Preprocessing: Load and Sample Data
rm(list = ls())  # Clear workspace
spam_dataset <- rio::import("6304 Module 8 Assignment Data.xlsx")
colnames(spam_dataset) <- tolower(make.names(colnames(spam_dataset)))

set.seed(99718118)  # Replace with your U number
primary_data <- spam_dataset[sample(1:nrow(spam_dataset), 750, replace = FALSE), ]

# Show structure of primary data
str(primary_data)

# Logistic Regression: Full Model
model.out <- glm(
  spam ~ to_multiple + image + dollar + winner + inherit + password + format + re_subj + urgent_subj + exclaim_subj,
  data = primary_data,
  family = binomial()
)
summary(model.out)

# Logistic Regression: Reduced Model
model.out1 <- glm(
  spam ~ to_multiple + dollar + inherit + password + format,
  data = primary_data,
  family = binomial()
)
summary(model.out1)

# Generate Prediction Object
pred.data <- expand.grid(
  to_multiple = unique(primary_data$to_multiple),
  dollar = quantile(primary_data$dollar, c(0, 0.33, 0.5, 0.67, 1)),
  inherit = unique(primary_data$inherit),
  password = quantile(primary_data$password, c(0, 0.33, 0.5, 0.67, 1)),
  format = unique(primary_data$format)
)

pred.probs <- round(predict(model.out1, newdata = pred.data, type = "response"), 5)
predictions <- cbind(pred.data, pred.probs)

# Show structure of prediction object
str(predictions)

# Sequence Data in Descending Order of Predicted Probabilities
descending <- predictions[order(-predictions$pred.probs), ]
head(descending, 6)  # Show first 6 rows
tail(descending, 6)  # Show last 6 rows
