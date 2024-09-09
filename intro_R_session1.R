## 00. Intro

hi <- "we R awesome"

four <- 2+2

plot(four)

## 01. Data types 

my_number <- 123
my_character <- "Letters"
my_integer <- 1L
my_boolean <- TRUE

my_vector <- c(1, 2, 3, 4, 5, 6)
class(my_vector)
d
# what if you mix in characters and numbers in a vector?
my_new_vector <- c(1, 2, 3, "4", "5", 6)
class(my_new_vector)

# you can change the datatype of your vector
my_numeric_vector <- as.numeric(my_new_vector)
class(my_numeric_vector)

# create a character vector
fruits_vector <- c("apples", "bananas", "canteloupes", "dragonfruits", "elderberries", "figs")
class(fruits_vector)

# create a factor vector 
# factors are nominal or categorical variables with levels (e.g., types of pets)
# similar to creating a character vector but wrapping it in `as.factor()`
factor_vector <- as.factor(c("cat", "cat", "dog", "cat", "dog", "cat", "cat", "cat", "dog"))
factor_vector
class(factor_vector)

# create a matrix of numbers from 1 to 20 with 5 rows and 4 columns 
my_matrix <- matrix(1:10, nrow = 5, ncol = 2)
my_matrix

# if you specify more rows or columns than the list of numbers, it will just repeat the list
my_repeating_matrix <- matrix(1:10, nrow = 5, ncol = 4)
my_repeating_matrix 

# you can also create character matrices
my_character_matrix <- matrix(fruits_vector, nrow = 3, ncol = 2)
my_character_matrix

# create a list 
my_list <- list(1, 2, 3, 4)
my_list

# a list might look like a vector but each element can be a different type 
my_new_list <- list(1, 2, "apples", "bananas", 3L, 4L, TRUE, FALSE)
my_new_list

# elements in a list can also be named instead of having a number assigned to it
my_named_list <- list(numbers = c(1, 2), 
                      fruits = c("apples", "bananas", "canteloupes"), 
                      integers = c(3L, 4L, 5L, 6L), 
                      booleans = c(TRUE, FALSE))
my_named_list


# create a data frame - similar to creating a list but every element is the same length and they are stacked horizontally 
my_df <- data.frame(numbers = c(1, 2), 
                    fruits = c("apples", "bananas"), 
                    integers = c(3L, 4L), 
                    booleans = c(TRUE, FALSE))
my_df


## 02. Operations

# arithmetic operations  
n_numbers <- length(my_vector)
mean_numbers <- mean(my_vector)
sd_numbers <- sd(my_vector)
se_numbers <- sd_numbers / sqrt(n_numbers)

# relational operations
5 > 10
5 < 10
5 == 10

# logical operations
TRUE & TRUE 
(5 > 1) & (5 < 10) # are both of them true?
(5 < 1) | (5 < 10) # is one of them true?
(5 < 1) | (5 > 10) # is one of them true?


## 03. Importing data 

## import a text file
my_text_file <- read.delim("data/framingham.txt", header = TRUE)

# what kind of object was created?
class(my_text_file)

# check the structure of my_text_file 
# it shows us the dimensions of the dataframe as well as the name, class, and some of the contents of each column
str(my_text_file)


## import a CSV file
my_csv_file <- read.csv("data/framingham.csv", header = TRUE, sep = ",")

# what kind of object was created?
class(my_csv_file)

# check the structure of my_csv_file
str(my_csv_file)


# both the data frames contain the same information, so let's open up the CSV data frame 
View(my_csv_file)

# let's take a look at the structure again
str(my_csv_file)


# do any of the columns need to be updated? 

## R Workshop 2 (September 17th, 2024): data exploration and visualization




