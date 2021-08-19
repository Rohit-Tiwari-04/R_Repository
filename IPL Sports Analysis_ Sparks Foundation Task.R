install.packages("tidyverse")
library(tidyverse)

deliveries <- read_csv("deliveries.csv")
matches <- read_csv("matches.csv")

# Objectives:

# Most successful team
# Most successful players
# Factors contributing win or loss of a team

dim(deliveries)

table(deliveries$batting_team)             # Has error in Rising Pune Supergiants

table(deliveries$bowling_team)             # Has error in Rising Pune Supergiants

table(deliveries$match_id)                 # Total 11415 (eleven thousand four hundred and fifteen matches altogether)

# Exploring the Match dataset:
  
table(matches$season)                        # Covers 12 seasons from 2008 - 2019 
table(matches$team1)                         # Has error in Rising Pune Supergiants
table(matches$team2)                         # Has error in Rising Pune Supergiants
table(matches$toss_winner)                   # Has error in Rising Pune Supergiants
table(matches$result)
table(matches$umpire3)

# Trimming the leading and trailing whitespaces from all the columns of both the dataframes:

deliveries_v2 <- data.frame(lapply(deliveries, trimws))
matches_v2 <- data.frame(lapply(matches, trimws))

# Removing the duplicates from both the dataframes:

library(dplyr)

distinct(deliveries_v2)
distinct(matches_v2)

View(matches_v2)

# Renaming the teams to their short forms:

matches_v2[matches_v2 == "Chennai Super Kings"] <- "CSK"
matches_v2[matches_v2 == "Deccan Chargers"] <- "SRH"
matches_v2[matches_v2 == "Delhi Capitals"] <- "DC"
matches_v2[matches_v2 == "Delhi Daredevils"] <- "DC"
matches_v2[matches_v2 == "Gujarat Lions"] <- "GL"
matches_v2[matches_v2 == "Kings XI Punjab"] <- "KXIP"
matches_v2[matches_v2 == "Kochi Tuskers Kerala"] <- "KTK"
matches_v2[matches_v2 == "Kolkata Knight Riders"] <- "KKR"
matches_v2[matches_v2 == "Mumbai Indians"] <- "MI"
matches_v2[matches_v2 == "Pune Warriors"] <- "PWI"
matches_v2[matches_v2 == "Rajasthan Royals"] <- "RR"
matches_v2[matches_v2 == "Rising Pune Supergiant"] <- "RPS"
matches_v2[matches_v2 == "Rising Pune Supergiants"] <- "RPS"
matches_v2[matches_v2 == "Royal Challengers Bangalore"] <- "RCB"
matches_v2[matches_v2 == "Sunrisers Hyderabad"] <- "SRH"
matches_v2[matches_v2 == "Bangalore"] <- "Bengaluru"

deliveries_v2[deliveries_v2 == "Chennai Super Kings"] <- "CSK"
deliveries_v2[deliveries_v2 == "Deccan Chargers"] <- "SRH"
deliveries_v2[deliveries_v2 == "Delhi Capitals"] <- "DC"
deliveries_v2[deliveries_v2 == "Delhi Daredevils"] <- "DC"
deliveries_v2[deliveries_v2 == "Gujarat Lions"] <- "GL"
deliveries_v2[deliveries_v2 == "Kings XI Punjab"] <- "KXIP"
deliveries_v2[deliveries_v2 == "Kochi Tuskers Kerala"] <- "KTK"
deliveries_v2[deliveries_v2 == "Kolkata Knight Riders"] <- "KKR"
deliveries_v2[deliveries_v2 == "Mumbai Indians"] <- "MI"
deliveries_v2[deliveries_v2 == "Pune Warriors"] <- "PWI"
deliveries_v2[deliveries_v2 == "Rajasthan Royals"] <- "RR"
deliveries_v2[deliveries_v2 == "Rising Pune Supergiant"] <- "RPS"
deliveries_v2[deliveries_v2 == "Rising Pune Supergiants"] <- "RPS"
deliveries_v2[deliveries_v2 == "Royal Challengers Bangalore"] <- "RCB"
deliveries_v2[deliveries_v2 == "Sunrisers Hyderabad"] <- "SRH"

# Getting count of missing values of all columns of both the dataframes:

sapply(deliveries_v2, function(x) sum(is.na(x)))

sapply(matches_v2, function(x) sum(is.na(x)))


# Removing umpire 3 data from matches dataset and player's dismissed, dismissal_kind, fielder from deliveries dataset:

deliveries_v3 <- deliveries_v2 %>% 
  select(-c("player_dismissed", "dismissal_kind", "fielder"))
         
matches_v3 <- matches_v2 %>% 
  select(-c("umpire3"))         
         
         
matches_v3[!(is.na(matches_v3$winner) | matches_v3$winner=="" | is.na(matches_v3$player_of_match) | matches_v3$player_of_match==""|is.na(matches_v3$umpire1) | matches_v3$umpire1=="" | is.na(matches_v3$umpire2) | matches_v3$umpire2==""),]          

matches_v4 <- na.omit(matches_v3) # Method 1 - Remove NA
matches_v4

deliveries_v4 <- deliveries_v3

# Checking count of missing values of all columns of both the dataframes:

sapply(deliveries_v4, function(x) sum(is.na(x)))

sapply(matches_v4, function(x) sum(is.na(x)))
         

# So far:

# Both the datasets have been trimmed, duplicate values have been removed, all the columns are in correct datatype and both the datasets have been thoroughly cleaned.

         
write.csv(matches_v4,"C:\\Users\\rohit\\Desktop\\Matches_v4.csv", row.names = TRUE)
write.csv(deliveries_v4,"C:\\Users\\rohit\\Desktop\\Deliveries_v4.csv", row.names = TRUE)



         