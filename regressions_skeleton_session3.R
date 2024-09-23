## CCM R Workshop Session 2: Regressions

setwd("/Users/shireenparimoo/Documents/Teaching/R Workshop - September 2024/data/")

############################### REGRESSIONS ############################### 





# A) Main effects --------------------------------------------------

## Continuous variables
# Do age and the number of cigarettes smoked per day contribute to blood pressure?

main_effects_model1 <- lm(y ~ x1 + x2, data = df)
summary(model) # use `summary()` to see coefficients, standard errors, and p-values

# plot the significant main effects 
# main effect of predictor
plot_model(model, 
           type = "pred", # provides estimated marginal effects predicted by the model (after accounting for effects of the other variables in the model)
           terms = "age",
           axis.title = c("Age", "Systolic BP"),
           title = "Main effect of age on blood pressure") + theme_bw()

## Categorical variables
# Are smoking status and use of BP medications related to cholesterol levels?

main_effects_model2 <- lm(y ~ x1 + x2, data = df)
summary(main_effects_model2) ## interpretation of the output 

# plot the significant main effects
# 1. main effect of predictor1
plot_model(main_effects_model2, 
           type = "pred",
           terms = "currentSmoker",
           axis.title = c("Smoking Status", "Cholesterol"),
           title = "Main effect of smoking status on cholesterol levels") + theme_apa()

# 2. main effect of predictor 2
plot_model(main_effects_model2, 
           type = "pred",
           terms = "BPMeds",
           axis.title = c("Use of BP Meds", "Cholesterol"),
           title = "Main effect of BP Meds on cholesterol levels") + theme_apa()

## Categorical and continuous variables 
# CHALLENGE: Are sex and cholesterol levels related to blood pressure?

main_effects_model3 <- lm(y ~ x1 + x2, df = prepped_df)
summary(main_effects_model3)

#

# B) Interactions ---------------------------

## Between categorical and continuous variables
# How are sex and cholesterol levels related to blood pressure?

interactions_model3 <- lm(y ~ x1 * x2, data = prepped_df)
summary(interactions_model3)

plot_model(interactions_model3, 
           type = "pred",
           terms = c("totChol", "age")) + theme_apa()
#

## CHALLENGE: how are age, hypertension, and history of stroke related to cholesterol levels? 

interactions_model4 <- lm(y ~ x1 * x2 * x3, data = prepped_df)
summary(interactions_model4)

plot_model(interactions_model4, 
           type = "pred",
           terms = c("age", "prevalentHyp")) + theme_apa()





