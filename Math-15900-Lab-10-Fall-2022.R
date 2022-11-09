##########################################################################
### Math-15900 Intro to R - Fall 2022
### Lab #10: The Deadly Board Game Part I
### Credit: Prof. Tom Pfaff
### Name: Ikrom Numonov
##########################################################################


###############################################################################################################
### The Deadly Board Game:
### While traveling in the Kingdom of Arbitraria, you are accused of a heinous crime. Arbitraria decides who is
### guilty or innocent not through a court system, but a board game. It's played on a simple board: a track with 
### sequential spaces numbered from 0 to 1,000. The zero space is marked "START" and your token is placed on it. 
### You are handed a fair six-sided die and three coins. You are allowed to place the coins on three different
### (nonzero) spaces. Once placed, the coins may not be moved.
###
### After placing the three coins, you roll the die and move your token forward the appropriate number of spaces.
### If, after moving the token, it lands on a space with a coin on it, you are freed. If not, you roll again and 
### continue moving forward. If your token passes all three coins without landing on one, you are executed.
### On which three spaces should you place the coins to maximize your chances of survival?
###
### In Part I, we simplify the game to placing just one coin. We want to answer these questions:
### Where should we place the one coin to maximize our chance of living? What is the chance we live?
###
### In the homework, based on what we learn from this code, where should we place three coins and why?
###############################################################################################################


n=100000 #This number needs to be larger for the simulation. For now a small number to understand the code.

# step 1: Roll a six sided die 20 times.

test<-sample(6, 1, replace = TRUE)
test

# Step 2: Add the numbers consecutively to get the squares landed on

cumsum(test)

# Step 3: repeat it n times
# Note each column is a attempt at the game.

simulation=replicate(n, cumsum(sample(6, 20, replace = TRUE)))
simulation

# Count up how many times each square gets landed on.
# We'll stop this at 50. We'll have to argue why we aren't likely to place our coin past square 50.

totals=tabulate(simulation, 50)
totals

# Calculate probabilities

probabilities=totals/sum(totals)
probabilities

# Create a visual

plot(1:50, probabilities, type="h", main=paste(n,"Simulations"), xlab="Square on Board", ylab="Probability")


## we want to order the squares based on probabilties

square=1:50
prob=probabilities*100  #percent is easier to read than decimal.

# this creates a data frame, essentially a matrix with column headers.

Prob_Position = data.frame(square, prob)
Prob_Position

# now we order the rows based on the prob column. Note the - gets us largest to smallest.
# take out hte - to see the difference

Prob_Position[order(-Prob_Position$prob),]

# Go back and make n really large for the simulation. Comment out code that prints out info we don't need to see.



#########################################################################################################
### Homework
##########################################################################################################

### Problem 1 #############################################################################################################
### Where should you put your one coin and what is your chance of surviving?
### Based on this simulation, where should we put three coins? Explain
### Provide the code here to answer this question. No unnessary code.
### Your answer should be based on numerical output, not reading the graph.

# I would have my best chance of survival if put my coin on square 6.
# Based on the simulation we did, the best 3 spots seem to be squares 6, 5, and 11. (Sometimes 12 replaces 11);
# Consider the top 3 options for the output from the code below.
n=100000
test<-sample(6, 20, replace = TRUE)
simulation=replicate(n, cumsum(sample(6, 20, replace = TRUE)))
totals=tabulate(simulation, 50)
probabilities=totals/sum(totals)
square=1:50
prob=probabilities*100
Prob_Position = data.frame(square, prob)
Prob_Position[order(-Prob_Position$prob),]



### Problem 2 #############################################################################################################
### We want to roll a 7-sided die 11 times. Create the code for one instance of the squares we could land on.

# Instances of the squares we could land on: (7 being the highest)
n=100000
test<-sample(7, 11, replace = TRUE)
simulation=replicate(n, cumsum(sample(7, 20, replace = TRUE)))
totals=tabulate(simulation, 50)
probabilities=totals/sum(totals)
square=1:50
prob=probabilities*100
Prob_Position = data.frame(square, prob)
Prob_Position[order(-Prob_Position$prob),]

### Problem 3 #############################################################################################################
### If we roll a 7-sided die what is the mean and standard deviation of the value of the square we are on after the 13th roll?
### Hint: Run a simulation, select the 13th row, and take the mean and standard deviation (sd).

n=10
test<-sample(7, 11, replace = TRUE)
simulation=replicate(n, cumsum(sample(7, 20, replace = TRUE)))
# select col 13

## I calculated the mean for col 13 manually, and it's usually about 49.

### Problem 4 #############################################################################################################
### Create a function that returns the number of rolls needed to get to square 50 for an n-sided die.
### This uses a while loop. I've sketched out a solutions, each "xyz" is replaced with appropiate variables or numbers and 
### "xyz" will different in lines of the code.
###

get_to<-function(die_sides){
	count<-0
	square<-0
	while (square < 50){ # while we're not at 50
		square<- square+sample(die_sides,1) # roll the die once and add it to the previous value of square
		count<- count+1 # increment count by one
	}
	return(count) # return count when we're at square 50
}

output<-get_to(7);
output;


### Problem 5 #############################################################################################################
### Challenge: Run a simulation to find the average number of rolls to get to square 50 with a 6-sided die.
### You need problem 4 to do this.

n<-1000
simulation=replicate(n, cumsum(get_to(6)))
totals = sum(simulation)/n
totals

## about 14 rolls