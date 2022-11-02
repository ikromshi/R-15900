 ##########################################################################
### Math-15900 Intro to R
### Fall 2022
### Lab #9 Collatz Conjecture, or Syracuse Problem
##########################################################################

##########################################################################################################
### What is the Collatz conjecture? Choose a positive integer and define a sequence of numbers in a particular
### way.
### Given a number n, the next number in the sequence is obtained as follows.
### If n is even then divide n by 2. If it is odd, then multiply it by 3 and add 1.
### Do the same with the newly created number in the sequence.
### Here is an example: Start with 12
### 12 is even so the next number is 6.
### 6 is even so the next number is 3.
### 3 is odd so multiply by 3 and add 1 to get 10.
### 10 is even so the next number is 5
### 5 is odd so 3*5+1=16
### 16 is even so we get 8
### 8 is even so we get 4
### 4 is even so we get 2
### 2 is even so we get 1
### 1 is odd so 1*3+1=4.
### Note that the sequence will now keep repeating 4, 2, 1. 
### The number 12 terminates after 9 steps (gets to 1 in 9 steps).
### The Collatz conjecture says that all starting numbers n will eventually end up at 1.
### This is has not been proven, that is why it is called a conjecture.
### The problem was first stated in 1937.
### Today's lab will explore this conjecture.
#########################################################################################################


#########################################################################################################
### We first define a function that gets the next number in the sequence.
### Recall that %% returns the remainder after division.
### num%%2==0 checks if a number is even.
#########################################################################################################

next_n <- function(num){
    if(num == 1)
      return("Done")
   
    if(num %% 2 == 0)
      return(num / 2)
     
    return(3 * num + 1)
}

## You should check to see if the function works.

next_n(12)

### A quick explanation of the while loop.
### A for loop continues over the number of steps you set
### for (i in 1:10) does something 10 times.
### A while loop continues until a condition is satisfied.
### This example starts with x=3 and will continue while
### x < 20. Each time through the loop it doubles x
### and then checks to see if it is less than 20. Repeat.

###
### Why was the final value of x 24?

x=3
while (x < 20){
x<-2*x}
x

### Let's get the Collatz sequence length. Note that != is not equal.

get_length <- function(x)
{
  count=0
  while(x != 1)
  {
    x <- next_n(x)
    count=count+1
    }
    return(count)
}

### Check the function with 12, our example above.

get_length(12)


### Let's plot results from 1 to 100.

max_n=100
range=1:max_n

results<-sapply(range, get_length) ## What does sapply() do?

plot(range,results,type="l",lwd=2,xlab="Starting Number", ylab="Number of Steps to Reach 1")
grid(NULL,NULL,col="black")

# The longest sequence from 1 to 100 seems to be 118 starting with 97.

get_length(97)

# Any patterns in the data?


### Let's plot results from 1 to 10000.


max_n=10000
range=1:max_n

results<-sapply(range, get_length)

plot(range,results,lwd=2,xlab="Starting Number", ylab="Number of Steps to Reach 1")
grid(NULL,NULL,col="black")

# Note the longest sequence in this range is around 250

# Any patterns in the data?


### Now let's plot the sequence or path a number takes to get to 1.

get_seq <- function(x)
{
    result <- x
    while(x != 1)
    {
      x <- next_n(x)
	result <- c(result,x)	
     }
      return(result)
}

get_seq(12) # THis gives us the "path" to 1


### A plot of the path of 97.

start_n=97

range <- 0:get_length(start_n)
result <- get_seq(start_n)

plot(range,result,type="l", lwd=2,xlab="Step Number", ylab="Value in the Sequence")
grid(NULL,NULL,col="black")

# This is odd. The 97 sequence got close to 1 in the first 20 and then exploded
# to 9232, max(result) will get you this,
# on the other hand, the number 8961 gets to 1 fairly quickly.

range<- 0:get_length(8961)
result<- get_seq(8961)

length(range)
length(result)

plot(range,result,type="l", lwd=2, xlab="Step Number", ylab="Value in the Sequence")
grid(NULL,NULL,col="black")



#########################################################################################################
### Homework
##########################################################################################################

#Need these functions:

next_n <- function(num){
    if(num == 1)
      return("Done")
   
    if(num %% 2 == 0)
      return(num / 2)
     
    return(3 * num + 1)
}

get_seq <- function(x)
{
    result <- x
    while(x != 1)
    {
      x <- next_n(x)
	result <- c(result,x)	
     }
      return(result)
}


get_length <- function(x)
{
    count=0
    while(x != 1)
    {
      x <- next_n(x)
	count=count+1	
     }
      return(count)
}

### Problem 1 #############################################################################################################
### How long is the sequence if we start with 4242?

next_n <- function(num){
    if(num == 1)
      return("Done")
   
    if(num %% 2 == 0)
      return(num / 2)
     
    return(3 * num + 1)
}

get_length <- function(x)
{
  count=0
  while(x != 1)
  {
    x <- next_n(x)
    count=count+1
    }
    return(count)
}

get_length(4242) # the sequence has 108 steps until it reaches 0;

### Problem 2 #############################################################################################################
### Plot the sequence of numbers starting with 4242 and find the exact maximum value the
### sequence achieves (not reading off the graph - write code to do this).

get_seq <- function(x)
{
    result <- x
    while(x != 1)
    {
      x <- next_n(x)
	result <- c(result,x)	
     }
      return(result)
}

start_n=4242

range <- 0:get_length(start_n)
result <- get_seq(start_n)


plot(range,result,type="l", lwd=2,xlab="Step Number", ylab="Value in the Sequence")
grid(NULL,NULL,col="black")

max(result) # the max value is 39364

### Problem 3 #############################################################################################################
### Graph the length of the sequences with starting numbers from 750 to 820 

get_length <- function(x)
{
  count=0
  while(x != 1)
  {
    x <- next_n(x)
    count=count+1
    }
    return(count)
}

max_n=820
range=750:max_n

results<-sapply(range, get_length)

plot(range,results,lwd=2,xlab="Starting Number", ylab="Number of Steps to Reach 1")
grid(NULL,NULL,col="black")


### Problem 4 #############################################################################################################
### What number takes the most interesting path, graph the path, explain why you think it is interesting.

get_seq <- function(x)
{
    result <- x
    while(x != 1)
    {
      x <- next_n(x)
	result <- c(result,x)	
     }
      return(result)
}

start_n=780

range <- 0:get_length(start_n)
result <- get_seq(start_n)


plot(range,result,type="l", lwd=2,xlab="Step Number", ylab="Value in the Sequence")
grid(NULL,NULL,col="black")

max(result)
# Numbers 780-783, 785 all have interesting paths in that they look the same after about 20 steps,
# and they also have the same max value


### Problem 5 #############################################################################################################
### Create a while loop that starts with the number 9 and keeps dividing it in half
### until the number is below 0.0001. The while loop should count how many steps it takes.
### How many steps does it take?

x <- 9;
counter <- 0;
while (x>0.0001) {
  x <- x/2;
  counter <- counter + 1;
}
counter; # 17 steps
