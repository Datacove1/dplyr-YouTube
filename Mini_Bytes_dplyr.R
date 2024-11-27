# Load package we require for this script
library(tidyverse)

# Arrange
Tennis_grand_slams$age <- as.numeric(Tennis_grand_slams$age)

Tennis_grand_slams_arranged <- Tennis_grand_slams %>% arrange(-age)

# Filter
Tennis_grand_slams_wimbledon <- Tennis_grand_slams %>% filter(grand_slam == "Wimbledon")

# Mutate
Tennis_grand_slams <- Tennis_grand_slams %>% mutate(Age_years=round(age/365,0))

# Select
Tennis_grand_slams_selected <- Tennis_grand_slams %>% select(name,grand_slam,date_of_first_title,Age_years)
Tennis_grand_slams_selected1 <- Tennis_grand_slams %>% select(-c(date_of_birth,age))

# Summarise
first_title_summary <- Tennis_grand_slams %>% group_by(grand_slam) %>% 
  summarise(mean(Age_years))
