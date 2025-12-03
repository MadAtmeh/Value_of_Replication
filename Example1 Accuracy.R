
#install.packages("ggplot2")
#install.packages("dplyr")

library(dplyr)
library(ggplot2)

# Example on Accurate Analysis
# Dataset on 12 random counties
df <- data.frame(
  country = paste("Country", 1:12),
  debt_gdp = c(30, 45, 60, 70, 80, 85, 90, 95, 100, 110, 120, 140),
  growth = c(4.5, 4.0, 3.5, 3.2, 2.8, 2.6, 2.2, 1.8, 1.5, 1.2, 0.8, 0.5)
)

df

# Categorize Debt Levels previously used by Rogoff and Reinhart
df <- df %>%
  mutate(debt_cat = ifelse(debt_gdp >= 90, "Above 90%", "Below 90%"))

#Compute Average Growth
avg_growth <- df %>%
  group_by(debt_cat) %>%
  summarise(mean_growth = mean(growth))

avg_growth

#Chart

ggplot(avg_growth, aes(x = debt_cat, y = mean_growth)) +
  geom_col() +
  labs(
    title = "Replication Insight: Growth Above and Below 90% Debt",
    x = "Debt Category",
    y = "Average GDP Growth (%)"
  ) +
  theme_minimal()

