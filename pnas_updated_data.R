# Load necessary libraries
library(tidyverse)
library(readr)
library(dplyr)
library(ggplot2)
library(tidyr)

# Set working directory and load dataset
setwd("C:/Users/Rushe/Desktop/capstone 2025")
dataset_path <- "C:/Users/Rushe/Desktop/capstone 2025/pnas.2012215118.sd01.csv"
dataset <- read_csv(dataset_path)

# Inspect the dataset
head(dataset)
summary(dataset)
View(dataset)
print(dataset)

# Check for missing values
missing_values <- dataset %>% filter_all(any_vars(is.na(.)))
print(missing_values)

# Remove rows with any missing values using drop_na()
cleaned_dataset <- dataset %>% drop_na()

# Check for any remaining missing values after cleaning
missing_values_after_cleaning <- cleaned_dataset %>% filter_all(any_vars(is.na(.)))
print(missing_values_after_cleaning)

# Inspect cleaned dataset
head(cleaned_dataset)
summary(cleaned_dataset)
View(cleaned_dataset)
print(cleaned_dataset)
