# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('C:/Users/a0687514/Downloads/Desktop/Data Science/Machine Learning A-Z - Udemy/Part 1 - Data Preprocessing/Data.csv')

# Taking care of missing data
dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Age)
dataset$Age

dataset$Salary = ifelse(is.na(dataset$Salary),
                        ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                        dataset$Salary)
dataset$Salary

# Encoding categorical data
dataset$Country = factor(dataset$Country,
                         levels = c('France', 'Spain', 'Germany'),
                         labels = c(1, 2, 3))
dataset$Country
dataset$Purchased = factor(dataset$Purchased,
                           levels = c('No', 'Yes'),
                           labels = c(0, 1))
dataset$Purchased

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
"set.seed sets is used to remember the results whenever random sampling is used"
set.seed(123)
"'SplitRatio' is the % of data in training set"
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
training_set[,2:3] = scale(training_set[,2:3])
test_set[,2:3] = scale(test_set[,2:3])
