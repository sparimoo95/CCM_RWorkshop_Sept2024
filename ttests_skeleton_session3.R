## CCM R Workshop Session 2: t-tests

setwd("/Users/shireenparimoo/Documents/Teaching/R Workshop - September 2024/data/")

## 00. Load libraries ----------------------------------------------------

# install.packages("tidyverse", "corrplot")
library(tidyverse) # we will use this library, which comes with its own syntax
library(jtools) # `theme_apa` for plotting
library(stats)

#

############################### T-TESTS ############################### 



# A) One-way t-tests ------------------------------------------------------

# Are the number of cigarettes smoked by our sample different from 0? 
t.test(prepped_df$cigsPerDay, mu = 0)

# what about 10?
t.test(prepped_df$cigsPerDay, mu = 10)

#

# B) Two-way t-tests ------------------------------------------------------

# Do people with diabetes have higher blood glucose levels than those without diabetes?
t.test(glucose ~ diabetes, data = prepped_df)

#

# C) Visualize t-test results ---------------------------------------------

# two-way t-test
# essentially plotting bar charts 
ggplot(prepped_df, aes(x = diabetes, y = glucose, fill = diabetes)) +
  geom_bar(stat = "summary", color = "black", show.legend = F) + 
  # changing `color` will change the color of the bar outline
  theme_apa(x.font.size = 22, y.font.size = 18) +
  labs(x = " ", y = "Blood Glucose Levels") +
  geom_point(alpha = 0.5, color = "black", position = "jitter", show.legend = F) +
  # add error bars 
  geom_errorbar(stat = "summary", width = 0.2) + # setting `stat = "summary"` will plot the standard error
  # either (1) manually change the colors
  scale_fill_manual(values = c("purple2", "darkorange2")) + # see color palette link for more colors
  # or (2) select from existing color palettes
  # scale_fill_brewer(palette = "Set2") + # you can explore more by typing `?scale_fill_brewer`
  # change the labels on the x-axis to be more descriptive 
  scale_x_discrete(labels = c("No Diabetes", "Diabetes"))

#



