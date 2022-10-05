##########################################################################
### Brown  Math-15900 Intro to R
### Lab #2: For loops, printing, and divisibility
### Submit your R file in canvas
### Your name should be in the file name such as: Brown-Dave-Lab-2
### Your file should include comments and relevent code.
##########################################################################

## Name: Ikrom Numonov



#########################################################################################################
### Homework
### Each of the solutions to problems should be independent. In other words I should only have to
### run the code for that particular problem to get a solution.
##########################################################################################################

### Problem 1 ########################################################################################
### Explain what following code does. Explain what is does as a whole and what each line of code is doing.
 
## This block of code will print all the multiples of 5 that have a remainder of 1 when devided by 2 in the range of 1-100;
for (k in 1:100) # this line is iterating through integers 1 to 100;
{
	if(k%%2==1 & k%%5==0) # asking if the integer is cleanly devisible by 5 and has a remainder of 1 when devided by 2;
	{print(k)} # printing the integer if the above condition is met;
}



### Problem 2 ########################################################################################
### Write code that prints all the odd numbers from 100 to 200 that are multiples of 7.
###
for (i in 100:200) {
	if (i%%7==0 & i%%2==1) {
		print(i)
	}
}


### Problem 3 ########################################################################################
### Write code that counts how many numbers from 1 to 10,000 are multiples of both 23 and 37, and prints 
### each of those numbers.
counter <- 0;
for (i in 1:10000) {
	if (i%%23==0 & i%%37==0) {
		print(paste(i, " is divisible by 23 and 37"))
		counter = counter + 1
	}
}
print(paste(counter, " numbers are divisble by 23 and 37 in the range of 1-10,000"))



### Bonus Problem ########################################################################################
### Write code that finds the first 197 numbers that are divisible by 7, 11, and 13.

# You didn't specifically say it, but I'm going to print the numbers to the console.
###
counter <- 0; # gets incremented when a number divisible by 7, 11, and 13 is found;
currentPointer <- 0; # gets incremented every loop
while (counter != 197) {
	if (currentPointer%%7==0 & currentPointer%%11==0 & currentPointer%%13==0) {
		print(currentPointer) # printing the first 197 numbers divisble by 7, 11, and 13;
		counter = counter + 1
	}
	currentPointer = currentPointer + 1
}
print(counter) # making sure we are at 197 numbers;

