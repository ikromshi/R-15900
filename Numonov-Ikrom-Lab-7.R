##########################################################################
### Brown  Math-15900 Intro to R
### Lab #7: Fibonacci and Using What We've Learned
### Submit your R file in canvas
### Your name should be in the file name such as: Brown-Dave-Lab-7
### Your file should include comments and relevent code.
##########################################################################

## Name: Ikrom Numonov

################################################
## First, we'll define a function that gives us the Fibonacci sequence
## Be sure you can explain how it works.
################################################

fibonacci<-function(n){
	if (n<=2){
		return(1)
	} else {
		return(fibonacci(n-1)+fibonacci(n-2))
	}
}

fibonacci(10)

###############################
## What does the next code do?
###############################

for (n in 1:10){print(fibonacci(n))}


###############################
## Run the next block of code and explain what it does
###############################
fiblist<-NULL
for (j in 1:15){fiblist[j]<-fibonacci(j)}

fiblist

###############################
## Now, we'll execute a couple of plots, which are good for visualizing output.
## Run each separately and observe what each does.
###############################
plot(fiblist,pch=6)

plot(fiblist,type="l",col="red")



###########################################
##
## Homework for Lab 7
##
###########################################

#############
##Question 1: Use a loop to create a list of the first 30 fibonacci numbers
#############
fibonacci<-function(n) {
	if (n<=2) {
		return(1);
	} else {
		return(fibonacci(n-1)+fibonacci(n-2))
	};
};

fiblist <- NULL;
for (idx in 1:30) {
	fiblist[idx]<-fibonacci(idx);
};
fiblist;


#############
##Question 2a: Use a loop to create a list of the consecutive ratios of first 20 fibonacci numbers.
##             That is, produce the list that begins fibonacci(2)/fibonacci(1), fibonacci(3)/fibonacci(2),
##			    etc, up to fibonacci(20)/fibonacci(19)
#############

fibonacci<-function(n) {
	if (n<=2) {
		return(1);
	} else {
		return(fibonacci(n-1)+fibonacci(n-2))
	};
};

fibRatioList <- NULL;
for (idx in 1:20) {
	fibRatioList[idx] <- fibonacci(idx+1)/fibonacci(idx);
};
fibRatioList; # ~ the golden ratio???

#############
##Question 2b: What do you notice about the trend of the sequence of ratios in 2a?
#############

# That they converge to a number: approx 1.618...

#############
##Question 2c: Create a plot of the sequence of ratios in 2a. 
#############

plot(fibRatioList,pch=16)
plot(fibRatioList,type="l",col="red")

#############
##Question 3a: Create a function (named FibSum) that produces the sum of the first n fibonacci numbers.
##             For example, FibSum(3) equals fibonacci(1)+fibonacci(2)+fibonacci(3)	    
#############

fibSum<-function(n) {
	if (n==1) {
		return(1);
	} else if (n==2) {
		return(2);
	} else {
		return(fibSum(n-1) + fibSum(n-2)+1);
	};
};

sum <- fibSum(6);
sum;

#############
##Question 3b: Use a loop to print out the first 20 values of FibSum	.    
#############

for (idx in 1:20) {
	print(fibSum(idx));
};

#############
##Question 3c: Compare your list of sums from Question 3b with the list from Question 1. What do you notice
##             about the sum of the first n Fibonacci numbers and the list of Fibonacci numbers?            	    
#############

# That they both get exponentially higher;

#############
##Question 4a: Create a function (named EvenFibSum) that produces the sum of the first n even-indexed fibonacci
##             numbers. For example, EvenFibSum(2) equals fibonacci(2)+fibonacci(4),
##			   EvenFibSum(3) equals fibonacci(2)+fibonacci(4)+fibonacci(6)
#############
fibSum<-function(n) {
	if (n==1) {
		return(1);
	} else if (n==2) {
		return(2);
	} else {
		return(fibSum(n-1) + fibSum(n-2)+1);
	};
};

evenFibSum<-function(n) {
	sum <- 0;
	currentParam <- 0;
	for (idx in 1:n) {
		sum <- sum + fibSum(currentParam+2);
		currentParam <- currentParam+2;
	};
	return(sum);
};

evenFibSum(2);

#############
##Question 4b: Use a loop to print out the first 10 values of EvenFibSum	.
#############

for (idx in 1:10) {
	print(evenFibSum(idx));
};

#############
##Question 4c: Compare your list of sums from Question 4b with the list from Question 1. What do you notice
##             about the sum of the first n even-indexed Fibonacci numbers and the list of Fibonacci numbers?     
##########

# That they both grow exponentially;

#############
##Question 5a: Create a function (named tribonacci) that returns the n-th element of the 
##            sequence that begins with three 1s and every element of the sequence after that
## 	          is the sum of the previous three terms. (This sequences begins 1,1,1,3,5,9,17,...)
#############

tribonacci<-function(n){
	if (n<=3){
		return(1);
	} else {
		return(tribonacci(n-1)+tribonacci(n-2)+tribonacci(n-3));
	};
};

tribonacci(7);

#############
##Question 5b: Use a loop to create a list of the first 15 tribonacci numbers.
#############

tribList <- NULL;
for (idx in 1:15) {
	tribList[idx] <- tribonacci(idx);
};

tribList;




