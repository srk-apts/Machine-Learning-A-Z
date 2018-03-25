# Data Preprocessing

# Importing the dataset
dataset = read.csv('Data.csv')

# Taking care of missing data
dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Age)
  # Same as above with just function 'mean'
  dataset$Age = ifelse(is.na(dataset$Age),
                       mean(dataset$Age, na.rm = TRUE),
                       dataset$Age)
dataset$Age
?ave
?mean
dataset$Salary = ifelse(is.na(dataset$Salary),
                        ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                        dataset$Salary)