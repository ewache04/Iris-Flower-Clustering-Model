# Assignment 5: Clustering using K-means Algorithm
# Author: Jeremiah E. OChepo
# Date: March, 29, 2024

# Check if the tidyverse package is already installed
if (!requireNamespace("tidyverse", quietly = TRUE)) {
  # If not installed, install it
  install.packages("tidyverse")
}

# Load the required libraries
library(tidyverse)
library(cluster)

# Attempt to load the iris dataset into R
tryCatch({
  file_path <- file.path(getwd(), "iris.csv")
  iris <- read.csv(file_path, header = FALSE)
  
  # Print success message if load was successful
  cat("The 'iris.csv' dataset has been loaded successfully.\n")
  cat("The 'iris.csv' dataset has been loaded successfully.\n")
}, error = function(e) {
  # Handle the error
  cat("Error: ", conditionMessage(e), "\n")
  cat("The 'iris.csv' dataset could not be loaded.\n")
})


# Attempt to clean up column names
tryCatch({
  # Clean up column names
  colnames(iris) <- c("sepal_length", "sepal_width", "petal_length", "petal_width", "class")
  
  # Print success message if column name cleanup was successful
  cat("Column names have been cleaned up successfully.\n")
}, error = function(e) {
  # Handle the error
  cat("Error: ", conditionMessage(e), "\n")
  cat("Column names could not be cleaned up.\n")
})


# Task 1: Explore the dataset
str(iris)
summary(iris)
head(iris)
colnames(iris)
any_na <- anyNA(iris)
if (any_na) {
  cat("There are missing values (NAs) in the dataset.\n")
} else {
  cat("There are no missing values (NAs) in the dataset.\n")
}

# Attempt to prepare the data for clustering
tryCatch({
  # Select features for clustering
  kmeans_sepal <- data.frame(iris$sepal_length, iris$sepal_width)
  kmeans_petal <- data.frame(iris$petal_length, iris$petal_width)
  
  # Print success message if data preparation was successful
  cat("Data preparation for clustering completed successfully.\n")
}, error = function(e) {
  # Handle the error
  cat("Error: ", conditionMessage(e), "\n")
  cat("Data preparation for clustering could not be completed.\n")
})

# Attempt to apply K-means algorithm
tryCatch({
  # Apply k-means algorithm for sepal features
  set.seed(123) # for reproducibility
  k_sepal <- kmeans(kmeans_sepal, centers = 3)
  
  # Apply k-means algorithm for petal features
  k_petal <- kmeans(kmeans_petal, centers = 4)
  
  # Print success message if K-means algorithm application was successful
  cat("K-means algorithm applied successfully.\n")
}, error = function(e) {
  # Handle the error
  cat("Error: ", conditionMessage(e), "\n")
  cat("K-means algorithm could not be applied.\n")
})

# Attempt to plot the clusters
tryCatch({
  # Plot for sepal features
  clusplot(kmeans_sepal, k_sepal$cluster, color = TRUE, shade = TRUE, labels = 5, lines = 0)
  
  # Plot for petal features
  clusplot(kmeans_petal, k_petal$cluster, color = TRUE, shade = TRUE, labels = 5, lines = 0)
  
  # Print success message if plotting of clusters was successful
  cat("Plotting of clusters completed successfully.\n")
}, error = function(e) {
  # Handle the error
  cat("Error: ", conditionMessage(e), "\n")
  cat("Plotting of clusters could not be completed.\n")
})

# Task 5: Analysis
# Analyze the clustering results and answer the questions in the assignment
