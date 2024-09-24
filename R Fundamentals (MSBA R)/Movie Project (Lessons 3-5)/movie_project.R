# R version 4.3.0 

#MSBAR 1.03 Vectors and Lists

# Create a vector of movie titles
movie_title = c("shaun_of_the_dead", "terminator_2", "the_big_lebowski", "forrest_gump", "searching_for_sugarman")

# Add duration in minutes as a vector
run_time = c(99, 137, 117, 142, 86)

# Compute basic exploratory statistics on the run_time vector
mean(run_time) # computes the mean of run_time
max(run_time) # returns the maximum value in run_time
min(run_time) # returns the minimum value in run_time
sd(run_time) # computes the standard deviation of run_time
var(run_time) # computes the variance of run_time
summary(run_time) # provides a summary of run_time, including min, max, median, and quartiles

# Explore the run_time vector using "any" and "all" logical operators
any(run_time > 120) # returns TRUE if any element in run_time is greater than 120
all(run_time > 120) # returns TRUE if all elements in run_time are greater than 120
any(run_time < 60) # returns TRUE if any element in run_time is less than 60
all(run_time < 180) # returns TRUE if all elements in run_time are less than 180

# Combine the movie_title and run_time vectors into a single list called movie_master_list
movie_master_list = list(movie_title, run_time)

# Label the elements in movie_master_list using the names() function
names(movie_master_list) <- c("title", "run_time")

# Create a vector for movie genres and a vector for user scores
movie_genre <- c("Action", "Comedy", "Drama", "Horror", "Documentary")
user_score <- c(4.8, 4.7, 4.7, 4.9, 4.7)

# Combine all four vectors into a single list called movie_master_list
movie_master_list <- list(movie_title, run_time, movie_genre, user_score)

# Add labels to the list objects in the movie master list
names(movie_master_list) <- c('title', 'run_time', 'genre', 'user_score')

# Print the entire movie_master_list
print(movie_master_list)

# Print the fourth element of the movie_master_list, which corresponds to the user_score vector
print(movie_master_list[4])

# R version 4.3.0 

#MSBAR 1.04 Dataframes and Matrices

# Prints the variable "run_time" to the console
print(run_time)

# Converts the variable "run_time" to a character vector
as.character(run_time)

# Transform the movie master list into a data frame
as.data.frame(movie_master_list)

# Create a movie data frame using the vectors run_time, user_score, and movie_genre
movie_df <- data.frame(run_time, user_score, movie_genre)

# Set the row names of the movie data frame to be the movie titles
row.names(movie_df) <- movie_title

# Print the movie data frame
print(movie_df)

# Prints a summary of the "movie_df" data frame to the console
summary(movie_df)

# Prints the "user_score" column of the "movie_df" data frame to the console
movie_df$user_score

# Create a new vector of release dates
release_date = c(2004, 1991, 1998, 1994, 2012)

# Append the release date vector as a new column in the movie data frame
movie_df$release_date = c(2004, 1991, 1998, 1994, 2012)

# Print the updated movie data frame
print(movie_df)

# Remove the release date column from the movie data frame
movie_df$release_date <- NULL

# Create a matrix from the numeric vectors run_time and user_score
times_scores_matrix = matrix(cbind(run_time, user_score), ncol=2)

# Add row names to the times_scores_matrix using the movie titles
rownames(times_scores_matrix) <- movie_title

# Add column names to the times_scores_matrix as 'run_time' and 'user_score'
colnames(times_scores_matrix) <- c('run_time', 'user_score')

# Create a new release_date vector
movie_df$release_date = c(2004, 1991, 1998, 1994, 2012)

# Remove the release_date column from the movie data frame
movie_df$release_date <- NULL

# Assign the release_date vector to the release_date column in the movie data frame
movie_df$release_date = release_date

# Create a matrix from the numeric vectors run_time and user_score
times_scores_matrix = matrix(cbind(run_time, user_score), ncol=2)

# Renames the rows of the "times_scores_matrix" matrix to be the same as the "movie_title" vector
rownames(times_scores_matrix) <- movie_title

# Renames the columns of the "times_scores_matrix" matrix to be "run_time" and "user_score"
colnames(times_scores_matrix) <- c('run_time', 'user_score')

# Prints the value at row 1, column 2 of the "movie_df" data frame to the console
movie_df[1,2]

# Prints the value at row 4, column 1 of the "movie_df" data frame to the console
movie_df[4,1]

# Prints the value in the "run_time" column of row 3 of the "movie_df" data frame to the console
movie_df[3, "run_time"]

# Remove the row names of the movie data frame
row.names(movie_df) <- NULL

# Add row names to the movie data frame using the movie titles
rownames(movie_df) <- movie_title

# Add row names to the times_scores_matrix using the movie titles
rownames(times_scores_matrix) <- movie_title

# Add column names to the times_scores_matrix as 'run_time' and 'user_score'
colnames(times_scores_matrix) <- c('run_time', 'user_score')

# Convert the movie_genre column of the movie data frame into a factor
as.factor(movie_genre)


# R version 4.3.0 

# MSBAR 1.05 Control Structures

# Append a column of customer recommendations to the movie data frame

movie_df$customer_01 <- ifelse(user_score > 4.7, "Recommend", "Don't Recommend")

# Print thed dataframe to check if the new column is added

print(movie_df)


# Run a while loop that prints the numbers 1 to 10

while(i < 11){
  print(i)
  i = i + 1
}

# Run a repeat loop that prints the numbers 1 to 10

i <- 1
repeat {
  print(i)
  i = i + 1
  if (i == 11){
    break
  }
}

# Write a for loop that prints the squares of numbers 1 to 5

for(i in 1:5){
  print(i^2)
}

#Let's practice
# Write a for loop recommending movies based on genre

for(row in 1:nrow(movie_df)) {
  genre <- movie_df[row, "movie_genre"]
  rec <- movie_df[row, "customer_01"]
  ifelse(rec == "Recommend", 
         print(paste("Suggest a new", genre, "movie.")), 
         print("N/A"))
}

# Write a for loop extracting and printing user scores

for(row in 1:nrow(movie_df)){
  score <- movie_df[row, "user_score"]
  print(score)
}

# Write a for loop that prints recommendations for each customer

for(row in 1:nrow(movie_df)) {              
  genre <- movie_df[row, "movie_genre"]  
  rec <- movie_df[row, "customer_01"]  
  print(paste(  
    rec, genre, "for this customer!"))  
}

# Use ifelse to check if the numbers 1 to 6 are greater than 3

ifelse(
  1:6 > 3,
  TRUE,
  FALSE
)

# Sample Answers for the MSBAR 1.05 Challenge questions

#Run a while loop that prints numbers from 5 to 105 incrementing by 5

i <- 5
while (i < 105) {
  print(i)
  i = i + 5
}

# Run a repeat loop that prints numbers from 5 to 105 incrementing by 5

i <- 5
repeat {
  print(i)
  i = i + 5
  if (i == 105) {
    break
  }
}

# Use a for loop to print multiples of 5 from 5 to 100

for(i in 1:20){
  print(i * 5)
}

# Use a for loop to check if numbers 1 to 10 are equal to 2 and print "first prime" if true

for(k in 1:10){
  ifelse(k == 2, print("first prime"), print(k))
}

# # MSBAR 1.05.5

#Create a new vector to store the rating scores given by customer_01

c1_score <- c(3,5,4,5,3)

# Add the new vector to the movie_df dataframe

movie_df <- cbind(movie_df, c1_score)

#Print the dataframe

print(movie_df)

# Use ifelse to determine movie recommendations based on customer_01 values

ifelse(movie_df$customer_01 == "Recommend", "Recommend", "Don't Recommend")

# Use a for loop to print user scores for the first 5 rows of the movie_df data frame

for(row in 1:nrow(movie_df)){
  score <- movie_df[1:5, "user_score"]
  print(score)
}


# Write a for loop that recommends movies based on genre

for(row in 1:nrow(movie_df)) {
  genre <- movie_df[row, "movie_genre"]
  rec <- movie_df[row, "customer_01"]
  ifelse(rec == "Recommend", 
         print(paste("Suggest a new", genre, "movie.")), 
         print("N/A"))
}

