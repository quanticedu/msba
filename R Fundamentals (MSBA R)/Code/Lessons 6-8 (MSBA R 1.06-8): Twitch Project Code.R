
# R version 4.3.0  

#MSBA R 1.06 Importing and Reading Data

#Counting the numbers of rows in the csv data file
nrow(Twitch_game_data_csv)

# Select the last 200 rows and the first four columns
Twitch_game_data_csv[13001:13200, 1:4]

# Find average hours wateched
summary(Twitch_game_data_csv)
mean(Twitch_game_data_csv$Hours_watched)

# Make a vector of rows containing ranks equal to 1
top_monthly <- which(Twitch_game_data_csv$Rank==1)

#Print top_monthly

print(top_monthly)

# Make the table of top ranked games with name, month, and year
top_monthly_table <- Twitch_game_data_csv[top_monthly, 2:4]
View(top_monthly_table)


# Load the twitch data json file
install.packages("rjson")
library(rjson)
Twitch_json <- fromJSON(file="twitch_game_data.json")

# Convert json file to a data frame
Twitch_json_dataframe <- do.call(rbind.data.frame, Twitch_json)


#MSBAR 1.07 Functions

#Split the Twitch data by Rank
Twitch_by_rank <- split(Twitch_game_data_xls, Twitch_game_data_xls$Rank)

# Print the value of "Game" in the element with index "1" in the "Twitch_by_rank" list
print(Twitch_by_rank[["1"]][["Game"]])

# Display the structure of the "Twitch_game_data_xls" object
str(Twitch_game_data_xls)

# Replace occurrences of "VALORANT" with "Valorant" in the "Game" column of the "top_monthly_table"
top_monthly_table$Game <- gsub("VALORANT", "Valorant", top_monthly_table$Game)

# Get rid of the word "hours" 
gsub("hours", "",Twitch_game_data_csv$Hours_Streamed)

# Write a function to remove words
only_numbers <- function(x){
  y<- gsub("[a-zA-Z]", "",x)
  return(y)
}

#Remove words from Hours_Streamed column
Twitch_game_data_xls$Hours_Streamed <- sapply(
  Twitch_game_data_xls$Hours_Streamed, only_numbers)

# Change char var to numeric var
Twitch_game_data_xls$Hours_Streamed <- as.numeric(Twitch_game_data_xls$Hours_Streamed)


#MSBAR 1.08 Basic Visualization

#Separate games to make simple visualizations
Twitch_by_game <- split(Twitch_game_data_xls, Twitch_game_data_xls$Game)

# Explore ranks of the game, Minecraft
Twitch_by_game[['Minecraft']][['Rank']]

# Make histogram of Minecraft rankings
hist(Twitch_by_game[['Minecraft']][['Rank']])

#Add more details to the histogram to make it beautiful
hist(Twitch_by_game[['Minecraft']][['Rank']], main = "Minecraft Ranks", xlab = "Ranks", col = "darkseagreen3", ylim = c(0,30))

# Let's make a boxplot
boxplot(Twitch_by_game[['Minecraft']][['Rank']], main = "Minecraft Ranks", col = "cyan4", horizontal = TRUE)

#Make a steam and leaf plot
stem(Twitch_by_game[["Minecraft"]][["Rank"]])

#install package tidyverse
install.packages("tidyverse")
library("tidyverse")

#Create a new object of top 10 performers in 2021
top10_2021 <- subset(Twitch_game_data_xls, Year==2021 & Rank<11)
ggplot(Data=top10_2021, mapping = aes(x = top10_2021$Rank, y = top10_2021$Avg_viewers))+geom_point()


#Make a ggplot of top10_2021 data
ggplot(Data=top10_2021, mapping = aes(
  x=top10_2021$Rank, y=top10_2021$Avg_viewers, colour=top10_2021$Game))+labs(title = 'Viewership by Rank', x = 'Rank', y = 'Average Viewers', colour = 'Game')+
  geom_point()+
  labs(title = 'Viewership by Rank', x = 'Rank', y = 'Average Viewers', colour = 'Game')
  
#Make top 5 data
top5_2021 <-subset(Twitch_game_data_xls, Year==2021 & Rank<6)

#Install package scale

install.packages("scales")
library("scales")
library(ggplot2)

#Make a ggplot of top5_2021 data
ggplot(Data=top5_2021, mapping = aes(x=top5_2021$Rank, y=top5_2021$Avg_viewers, colour=top5_2021$Game))+
  geom_point()+
  labs(title = 'Viewership by Rank', x = 'Rank', y = 'Average Viewers', colour = 'Game')+
  scale_y_continuous(labels=comma)

#Let's investigate the relationship between Hours_Streamed and Avg_viewers
ggplot(top5_2021, mapping= aes(x = Hours_Streamed, y = Avg_viewers, colour = Game))+
  geom_point()+
  labs(title = 'Average Viewership by Hours Streamed', x = 'Hours Streamed', y = 'Average Viewers', colour = 'Game')

#Let's investigate the relationship further for each game
ggplot(Data=top5_2021, mapping = aes(x=top5_2021$Avg_viewers))+geom_bar(stat="count")

ggplot(Data=top5_2021, mapping = aes(x=top5_2021$Hours_Streamed, y=top5_2021$Avg_viewers, colour = top5_2021$Game))+
  geom_point()+
  geom_smooth(method=lm, se=FALSE)+
  labs(title = 'Average Viewership by Hours Streamed', x = 'Hours Streamed', y = 'Average Viewers',colour = 'Game')+
  scale_y_continuous(labels=comma)+
  scale_x_continuous(labels=comma)

#Let's investigate the relationship between Avg_viewers and Peak_viewers.
ggplot(top5_2021, mapping=aes(x=Peak_viewers, y=Avg_viewers))+  
  geom_point()+
  geom_smooth(method=lm, se=FALSE)+
  labs(title='Average Viewership by Peak Viewership', x='Peak Viewers', y='Average Viewers')+
  scale_y_continuous(labels=comma)+
  scale_x_continuous(labels=comma)

#Let's investigage this further to see more insights
ggplot(Data = top5_2021, mapping= aes(x = top5_2021$Peak_viewers, y = top5_2021$Avg_viewers, colour = top5_2021$Game))+
  geom_boxplot()+
  labs(title = 'Average and Peak Viewership', x = 'Peak Viewers', y = 'Average Viewers', colour = 'Game')+
  scale_y_continuous(labels=comma)+
  scale_x_continuous(labels=comma)



