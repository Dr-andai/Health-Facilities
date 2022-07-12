# EDA on Health Facilities Data in Kenya

# set working directory
setwd('C:/Users/user/Documents/R/Health Facility/Health-Facilities')

# Load Libraries
pacman::p_load(
  rio,        # importing data  
  naniar,     # assess and visualize missingness
  mice,        # missing data imputation
  janitor,    # data cleaning and tables
  lubridate,  # working with dates
  epikit,     # age_categories() function
  tidyverse   # data management and visualization
)

# Load Data
Health_facilities <- import ('kenya-health-facilities-2017-08-02-xlsx-1.xlsx')
## 8932 Observations of 22 Variables

#View Column names
names(Health_facilities)
# [1] "Code"                 "Name"                 "Registration_number"  "Keph level"          
# [5] "Facility type"        "Owner"                "Regulatory body"      "Beds"                
# [9] "Cots"                 "County"               "Constituency"         "Sub county"          
# [13] "Ward"                 "Operation status"     "Open_whole_day"       "Open_public_holidays"
# [17] "Open_weekends"        "Open_late_night"      "Service_names"        "Approved"            
# [21] "Public visible"       "Closed"  

# Clean column names
Health_facilities <- Health_facilities %>% 
  janitor::clean_names()

#Check for Missing Values
# percent of ALL data frame values that are missing
pct_miss(Health_facilities)
## 4.545455%


#Practice on data set
#Health Facilities Levels
ggplot(data = Health_facilities, aes(x = keph_level, fill =keph_level )) +
  geom_bar(position = "dodge")

#Health Facility Type
ggplot(data = Health_facilities, aes(y = facility_type,x = keph_level )) +
  geom_point()

#Owner of Facilities
ggplot(data = Health_facilities, aes(x = owner, fill =owner )) +
  geom_bar(position = "dodge")

ggplot(data = Health_facilities, aes(y = public_visible,x = keph_level )) +
  geom_point()

