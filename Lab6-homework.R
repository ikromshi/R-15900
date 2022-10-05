#######################
## Lab 6 - GCD and Euclidean algorithm
## D. Brown - MATH 15900 - Fall 2022
######################################### Ikrom Numonov;
#####################

##Basic Euclidean algorithm for computing gcd

a<-4883
b<-3431
div<-a
remainder<-b
while (remainder>0){
	oldremainder<-remainder
	remainder<-div%%remainder
	div<-oldremainder
}
print(paste("The GCD of",a,"and",b,"is",div,"."))

#####################
## We can turn this into a function:
#####################

gcd<-function(a,b){
	div<-a
	remainder<-b
	while (remainder>0){
		oldremainder<-remainder
		remainder<-div%%remainder
		div<-oldremainder
	}
	return(div)
}
gcd(4883,3341)



#####################
## Code for homework
####################
counter<-NULL # initializing counter as null;
for (j in 1:30){counter[j]<-0} # populating counter with 30 elements that are 0;
for (k in 1:1000){ # running a loop 1000 times;
	b<-sample(1:10000,1,replace=TRUE) # initializing b as a random integer between 1 and 10,000
	a<-sample(b:10000,1,replace=TRUE) # initializing a as a random integer between b and 10,000
	stepcounter<-0 # initializing stepcounter as 0;
	div<-a # initializing div as a;
	remainder<-b # initializing remainder as b;
	while (remainder>0){ # the while block is finding the GCD of a and b, while also keeping the track of steps;
		oldremainder<-remainder
		remainder<-div%%remainder
		div<-oldremainder
		stepcounter<-stepcounter+1
	}
	counter[stepcounter]<-counter[stepcounter]+1 # populating counter with the number of attempts+1
}
for (j in 1:30){ # running a loop that runs 30 times;
	print(paste("The Euclidean algorithm required",j,"steps", counter[j],"times.")) # printing how many times a number of steps happened; (e.g. 30 steps happened 0 times);
}


########################################## Homework ##########################################
###### Question 1

gcd<-function(a,b, steps){
	div<-a;
	remainder<-b;
	while (remainder>0){
		steps <- steps+1;
		oldremainder<-remainder;
		remainder<-div%%remainder;
		div<-oldremainder;
	}
	print(paste("The GCD: ", div, ". Number of steps: ", steps));
}

### a) The largest number of steps found is 3;
gcd(50,49, 0);
gcd(99,5, 0);
gcd(80,2, 0);
gcd(32,1, 0);


### b) The largest number of steps is 6;
gcd(999,101, 0);
gcd(500,499, 0);
gcd(312,120, 0);
gcd(997,101, 0);

### c) The largest number of steps is 9; 
gcd(9999,1001, 0);
gcd(5000,4999, 0);
gcd(3121,1201, 0);
gcd(9973,1009, 0);



###### Question 2

### a) Not necessarily. If the gap between the numbers is huge and if they both are prime, then the steps would be more;

### b) About 12;

### c) Yes there are, for example the pair (32, 1);


###### Question 3

### a) I did;

### b) It's getting a hold of random values for a divisor and a remainder and calculating how many steps it takes to get the GCD;

### c) That for values of a and b in, where 1<b<a<10000, it rarely takes more than 15 steps to get the GCD of a and b;

### d) I did my best;



