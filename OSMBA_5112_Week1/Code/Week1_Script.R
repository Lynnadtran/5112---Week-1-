##Lynna Tran
##OMSBA 5112 - Week 1

library(haven)
library(tidyverse)
nfhs <- read_dta("IAHR52FL.dta")


# script for answering  question 3 
df_q3 <- select(nfhs, hhid:shstruc)

# question 4
ggplot(data = nfhs,
       mapping = aes(x = hv009), binwidth = 1) +
  geom_histogram() +
  xlab("Number of household members")

# question 5 
urban_df <- filter(nfhs,hv025 == 1) 

ggplot(data = urban_df, mapping = aes(x = factor(hv026), y = hv009)) +
  geom_boxplot() +
  xlab("Type of urban areas") +
  ylab("Household size") +
  scale_x_discrete(labels = c("Capital, large city", "Small city", "Town"))

#question 6

urban_df %>%
  group_by(hv026) %>%
  summarise(
    count = n()
  )

urban_df %>%
  group_by(hv026) %>%
  summarise(
    mean_count = mean(hv009)
  )

urban_df %>%
  group_by(hv026) %>%
  summarise(
    median_count = median(hv009)
  )

