## CCM R Workshop Session 2: Correlations

setwd("/Users/shireenparimoo/Documents/Teaching/R Workshop - September 2024/data/")

## 00. Load libraries ----------------------------------------------------

# install.packages("tidyverse", "corrplot")
library(tidyverse) # we will use this library, which comes with its own syntax
library(jtools) # `theme_apa` for plotting
library(stats)

#

############################### CORRELATIONS ###########################



# A) Calculate correlations --------------------------------------

# just get the r to see whether age and sysBP are correlated
cor(prepped_df$age, prepped_df$sysBP, use = "na.or.complete")

# perform a correlation test to test for statistical significance
cor.test(prepped_df$age, prepped_df$sysBP, use = "na.or.complete")

# formula syntax: (we will re-visit this for other statistical tests)
cor.test(~ df$x + df$y, use = "na.or.complete")
cor.test(~ age + sysBP, data = prepped_df, use = "na.or.complete")

# by default, `cor.test()` performs a pearson correlation
# you can also specify the type of correlation using the `method` argument
# other useful arguments include `conf.level` to specify the confidence level for the confidence intervals

# B) Visualize correlations -----------------------------------------------

### visualize correlations --> line

ggplot(prepped_df, aes(x = age, y = sysBP)) +
  # add a black correlation line with SE intervals around it using `geom_smooth()`
  geom_smooth(method = "lm", color = "black") +
  # `method` allows you to specify the smoothing method; we will use 'lm'
  # `se = TRUE` adds 95% confidence intervals around the line
  # you can also add individual datapoints to the figure using `geom_point()`
  geom_point(alpha = 0.1, color = "purple4", position = "jitter", size = 1) +
  theme_apa(x.font.size = 20, y.font.size = 20) +
  xlab("Age") + ylab("Systolic BP") 

#

## CHALLENGE: 1. perform a correlation test to see if the number of cigarettes smoked per day is related to blood glucose levels
# 2. plot the correlation and show individual data points

#

