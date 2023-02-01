### -------------------- Lab 3 --------------------
### This lab is designed to prepare you for PS3

## Create a vector of the number of points the Seahawks scored in the
## first (at least) 5 games
## Hint: google "Seahawks scores", or check the football database:
## http://www.footballdb.com/teams/nfl/seattle-seahawks/results
## here 'Final' displays scores
## Use an appropriate variable name for the scores
## 
## Hint: feel free to invent if you cannot figure this out
seahawks <- c(17,7,23,48,32)
seahawks
## Create a vector of the number of points the opponent
## scored against Seahawks in the first 5 games
## use an appropriate variable name
opponent <- c(16,27,27,45,39)
opponent
## Combine your two vectors into a dataframe
football <- data.frame(seahawks,opponent)
football

## Create a new column "diff" that is the difference in points
## (in favor of Hawks)
football$diff <- (seahawks - opponent)
football

## Create a new column "won" which is TRUE if the Seahawks won,
## ie if Seahawks scored more than the opponent scored against them
football$won <- seahawks > opponent
football

## Create a vector of the opponents name (such as "Denver Broncos")
opponentname <- c("Denver Broncos","San Francisco 49ers","Atlanta Falcons","Detroit Lions","New Orleans Saints")
opponentname

## Add the vector of opponents into the data frame
football$opponentname <- opponentname
football

## Compute the average score of Seahawks
mean(football$seahawks)

## Compute how many games did Seahawks won
## (use the 'won' variable to compute it)
length(football$won[football$won==TRUE])

## What was the largest difference in scores (in favor of Seahawks)?
football$diff[football$diff < 0] <- -football$diff[football$diff < 0]
max(football$diff)

## How many different opponents did Seahawks have in these games?
## Hint: use `unique()` and `length()`
length(unique(football$opponentname))

## Print the variable names in your data frame
names(football)

## Write a loop over all variables in your data frame
## print the variable name inside the loop
for(element in names(football)){
  cat(element,":",football[[element]],"\n")
}

## Write a loop over all variables in your data frame
## print the variable name inside the loop,
## and true/false, depending if the variable is numeric
## check out 'is.numeric()'

for(element in names(football)){
  cat(element,":",is.numeric(football[[element]]),"\n")
}   ##does all the variables need to be printed with true/false?

## Write a loop over all variables in your data frame
## print the variable name inside the loop,
## and the average value of the variable
## if the variable is numeric
for(element in names(football)){
  if(is.numeric(football[[element]])==TRUE){
    cat(element,":",mean(football[[element]]),"\n")
  }
}




##
## HR data
## You are working in HR for a large firm with 100 employees.
## You are analyzing their salaries.

## Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee
## 100")
## Hint: use 'paste()` or `str_c`
library(stringr)
employees <- str_c(paste("Employee "),1:100)
employees
## Create a random vector of their 2021 salaries.
## Hint: you may use the runif function to create uniform random numbers,
## e.g. 'runif(100, 60, 120)' creates 100 random numbers between 60 and 120
salaries2021 <- runif(100,60,120)
salaries2021

## Create a random vector of 2022 salaries that are typically
## higher than the 2014 salaires (use runif again).
## For instance, if you create random numbers between 65 and 130, then 2022
## salaries tend to be larger than 2021 salaries.
salaries2022 <- runif(100,70,150)
salaries2022

## Create a data.frame 'salaries' by combining the vectors you just made
salaries <- data.frame(employees,salaries2021,salaries2022)
salaries

## Create a column 'raise' that stores the size of the
## raise between 2021 and 2022
salaries$raise <- salaries2022 - salaries2021
salaries

## Retrieve values from your data frame to answer the following questions:
##
## What was the 2015 salary of employee 57
employee57 <- salaries$salaries2022[salaries$employee =="Employee 57"]
employee57
## Now round the answer down to two digits after comma
## check out 'round()' function
round(employee57,digits = 2)
## How many employees got a raise?
length(salaries$raise[salaries$raise > 0])

## What was the value of the highest raise?
## Round the number to two digits!
max(round(salaries$raise[salaries$raise > 0],digits = 2))

## What was the name of the employee who recieved the highest raise?
highestraise <- max(salaries$raise)
salaries$employees[salaries$raise==highestraise]

## What was the average salary increase?
## Round the number!
mean(salaries$raise[salaries$raise > 0])

## For people who did not get a raise, how much money did they lose?
## Round the number!
sum(round(salaries$raise[salaries$raise < 0],digits = 2))