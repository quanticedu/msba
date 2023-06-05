
# R version 4.3.0  

#MSBAR 1.01 Introduction to R and R-Studio

sqrt(19)  # Calculates the square root of 19
abs(-2)   # Calculates the absolute value of -2, which is 2
5^6       # Raises 5 to the power of 6, which is 15625

# Before using the "dadjoke" package, you need to install it first:
# install.packages("dadjoke")

library(dadjoke)   # Loads the "dadjoke" package/library into the current R session
print(dadjoke())   # Prints a random dad joke from the package
print(dadjoke)     # Prints the function definition for "dadjoke"
help(dadjoke)      # Provides help documentation for the "dadjoke" function

