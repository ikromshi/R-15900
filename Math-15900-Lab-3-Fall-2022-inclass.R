##########################################################################
### Brown  Math-15900 Intro to R
### Lab #3: A review of for loops and if else statements plus Lists
### Work on the following in class
##########################################################################

## Try to predict what this will do before you run it:
A<-0
for (i in 1:10){
  A<-A+(-1)^i
}
print(A)

# You can add a print command to see what happens on each step
A<-0
for (i in 1:10){
  A<-A+(-1)^i
print(A)
}
print(A)

# Or better add two prints before and after

A<-0
for (i in 1:10){
 print(paste("Before A:", A))
  A<-A+(-1)^i
print(paste("After A:", A, "with i =",i))
}
print(paste("The final value of A is",A))

## Try to predict what this will do before you run it:

A<-1
for (i in 3:7)
{
A<-A+2*i
}
print(A)

# Add two print statments with paste to see how A changes in the loop:
A<-1
for(i in 3:7)
{
A<-A+2*i
}
print(A)

##########################################################
##########################################################
##Lists
##
## Lists are powerful tools for organizing work in R
##

##Here is one example 
# Run this code:
list1=c(2,5,7,12,33)

#Now, run this and explain what it does
list1

#Run the next three lines and describe what they are doing
list1[1]
list1[2]
list1[3]

#Guess what the following will do before running it:
list1[4]

#What do you think will happen if you run the following?
list1[7]

#######
## Building up a list in a loop. Explain what the follow does.
##
list2<-NULL
for (i in 1:10)
{
	list2<-append(list2,i^2)
}
list2

## Try to predict what this will do before you run it:
plot(0,0, xlim=c(0,10), ylim=c(0,10), type="n", xlab="", ylab="")
for (i in c(1,3,5,6))
{
	segments(i,i,i+1,i+2,lwd=2)
}


### If else. Try to predict what this will do before you run it:
x<-4
if (x < 0) {"negative"} else {"positive"}


# Turn this into a function. Run the following code to define the function.
NegPos<-function(x)
{ 
	if (x < 0) {temp<-"negative"} 
	else {temp<-"positive"}
	return(temp)
}

# Run each of these separately to see how the function can now be used.
NegPos(5)
NegPos(-4)


#Run the following two lines of code 5 times, then explain what it is doing.
x<- sample(-100:100,1)
if (x < 0) {paste(x, " is negative")} else {paste(x, "is positive")}


#Explain what these three lines of code are doing.
n<-3
if( n%%2==0) { n<- n/2} else {n<-3*n+1}
print(n)




### For Loop with If-Else. Explain what this code does. 
n<-7
for(i in 1:10)
{
	if( n%%2==0) {n<- n/2} else {n<-3*n+1} 
}
print(n)


# Turn the previous code into a function that takes a number n and iterates this m times
# Run the code to initialize the function
f<-function(n,m)
{
	for(i in 1:m)
	{
		if( n%%2==0) { n<- n/2} else {n<-3*n+1} 
	}
return(n)
}

## Now use the function. The following will iterate the function 12 times starting with the number 5.

f(5,12)

## Play around changing the 5 and the 12 in the example above.
###


## What does the following code do? 
test<- 1:10
for(i in 1:length(test)){
if ( test[i]%%2==0 ) { test[i]<-0} else {test[i]<-1}
}
test


##What's happening with this code?
IceCream<-20
flavor<-sample(c(0:1),IceCream, replace=TRUE)
for (i in 1:IceCream){
if (flavor[i]==0){flavor[i]<-"strawberry" } else {flavor[i]<-"chocolate"}
}
flavor



