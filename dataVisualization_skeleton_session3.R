## CCM R Workshop Session 2: Data visualization

setwd("/Users/shireenparimoo/Documents/Teaching/R Workshop - September 2024/data/")

## 00. Load libraries ----------------------------------------------------

# install.packages("tidyverse", "corrplot")
library(tidyverse) # we will use this library, which comes with its own syntax

#

############################### VISUALIZATIONS ####################



# A) Visualize the data using base R -------------------------------------------------

# let's look at the distribution of the numeric variables in the sample
# use `hist(df$variable)`; it takes in a numeric input variable and produces a basic histogram
hist(prepped_df$age)  # age 
hist(prepped_df$cigsPerDay)  # cigarettes smoked per day
hist(prepped_df$)  # and so on

# what about our factors, like sex?
hist(prepped_df$sex) # this would throw an error because you can't plot the distribution of categorical variables

# use the `plot()` function to plot a basic bar chart displaying frequencies/counts
# the syntax is similar to before: `plot(df$variable)`
plot(prepped_df$sex)  # sex
plot(prepped_df$education)  # education

# `plot()` isn't great for visualizing continuous variables on their own
# try plotting the cigarettes smoked per day
plot(prepped_df$cigsPerDay) # looks like a mess

# but you can also look at two variables at once using `plot()`
# let's see the number of cigarettes smoked by males vs females
# the syntax here will include both of our variables: `plot(x = df$variable1, y = df$variable2)`
plot(x = prepped_df$, y = prepped_df$) # basic boxplot 

#
# B) Histograms ------------------------------------

# let's plot the histogram for age again, but this time using ggplot; the basic syntax is below:
# ggplot(df, aes(x = "x variable", y = "y variable", group = "grouping variable")) +
#   geom_<chart_type>(stat = "statistic", na.rm = TRUE) + 
#   additional layers 

## age histogram
ggplot(prepped_df, aes(x = age)) + # use `+` to add more layers to your plot 
  # we want the bars to be lightblue and the outline to be black
  geom_histogram(binwidth = 1, fill = "lightblue", color = "black") +  
  # `binwidth` will change the width of each bar (e.g., 1 = bars will go up in 1 year increments)
  # `fill` will fill in the bars with the color indicated
  # `color` will outline the bars with the color indicated
  # you can also change the background, font, etc. of the plot using `theme_ABC`
  # type in `theme_` and press Tab to see your options; we will use theme_apa for now
  # set the font sizes to 20
  theme_apa(x.font.size = 20, y.font.size = 20) + 
  # you can change the axis labels as well 
  labs(x = "Age",
       y = "Count") # alternative syntax for changing axis labels: xlab() + ylab()

# you can plot a histogram and overlay it with a density plot as well, with some minor tweaks to the code above
ggplot(prepped_df, aes(x = cigsPerDay)) +
  # change the y-axis to density instead of counts
  geom_histogram(aes(y = ..density..), binwidth = 1, fill = "lightblue", color = "black") +
  # by default, `geom_density()` will just plot a density curve
  # let's fill the density curve and make it orange and 30% transparent so that we can see the bars underneath
  geom_density(fill = "orange", alpha = 0.3) +
  theme_apa(x.font.size = 20, y.font.size = 20) +
  labs(x = "Heart Rate",
       y = "Density") 


## CHALLENGE: create a histogram overlaid with a density plot for heart rate


# C) Bar charts -----------------------------------------------------------

# if you want to see the mean age differences between males and females, ggplot can help with that too 
ggplot(prepped_df, aes(x = sex, y = age, fill = sex)) +
  # `fill = variable` tells ggplot which variables should be colored differently 
  # use `geom_bar()` to create a barplot, since the x-variable is categorical
  geom_bar(stat = "summary", show.legend = F, color = "black") +
  # `stat = "summary"` provides a mean value of the y-variable for each x-variable group 
  # `show.legend` can be set to TRUE/T or FALSE/F 
  theme_apa(x.font.size = 20, y.font.size = 20) +
  labs(x = "Sex",
       y = "Age") 

## CHALLENGE: create a barplot of sex differences in number of cigarettes smoked per day 


#
# D) Scatter-plots ---------------------------------------------------------

# let's look at the relationship between numeric variables
# is age related to blood pressure?
ggplot(prepped_df, aes(x = age, y = sysBP)) +
  # use `geom_point()` to create a scatterplot
  # `alpha = 0.5` sets transparency to 50%
  # `position = "jitter"` makes it so that the points are scattered a little around their true value
  geom_point(alpha = 0.5, color = "purple4", position = "jitter") +
  theme_apa(x.font.size = 20, y.font.size = 20) +
  labs(x = "Age",
       y = "Systolic BP") 

## 



