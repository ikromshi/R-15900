##########################################################################
### Brown  Math-15900 Intro to R
### Lab #1: Intro to Graphing
### Submit your R file in canvas
### Your name should be in the file name such as: Brown-Dave-Lab-1
### Your file should include comments and relevent code.
##########################################################################

## Name: 

## Some code to get your started

plot(0,0, xlim=c(0,10), ylim=c(0,10), type="n", axes=FALSE, xlab="", ylab="")

segments( 1,1, 1,7, col="blue", lwd=4, lty=1)

f <- function(x){ sqrt( 4^2-(x-1)^2) +3}

curve(f, 1, 5, lwd=4, col="red", add=TRUE)

points(3,8, pch=15, cex=5, col="purple")


## Example: Create a function that draws a horizontal line segment from a point (a,b) of length n.

H_line <- function(a,b,n,color){ segments(a,b,a+n,b, col=color, lwd=3)}

H_line(1,1,6,"red")



#########################################################################################################
### Homework
### Each solution to problems should be independent. In other words I should only have to
### run the code for that particular problem to get a solution.
##########################################################################################################

### Problem 1 ########################################################################################
### Create a "graph" of your initials/name/or something equivalent
### Be creative and try to have at least one curved piece.

#Setting up the plot
plot(0,0, xlim=c(0,20), ylim=c(0,20), type="y", axes=FALSE, xlab="", ylab="", color="black")
func <- function(x1,y1,x2,y2) { segments(x1,y1, x2,y2, col="black", lwd=4, lty=1)}

#First letter
func(1,1,1,5)
func(0,1,2,1)
func(0,5,2,5)

#Second letter
func(3,1,3,5)
func(5,1,3,5)
func(5,1,5,5)

#Period
f <- function(x){ sqrt(4-x^2)}
curve(f, 1,1, lwd=5, col="black", add=TRUE)
### Problem 2 ########################################################################################
### Create a function called V_line that will draw a vertical line starting at (a,b) of length n 
### with variables for color and line width: Hint: V_line <- function(a,b,n,color,w){ }
