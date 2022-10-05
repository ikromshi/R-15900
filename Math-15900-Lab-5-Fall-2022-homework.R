## Name: Ikrom Numonov

# Takes the length of two legs and computes the hypotenuse
findTriple <- function(a, b) {
	c <- sqrt(a^2+b^2);
	if (c %% 1 == 0) {
		print(paste("(",a,",",b,",",c,") is a right triangle triple."));
	} 
}


##################### 1 #####################
for (i in 1:100) {
	for (j in 1:100) {
		findTriple(i, j);
	}
}


##################### 2 ##################### 
# I could organize all the data with an ascending set of triples: i.e. (57, 76, 95) and not (75, 57, 95);
# Although, some of the triples I have do follow that order, there are others that don't;
# It would be nice to have a uniform pattern;


##################### 3 #####################
findTripleNoRepeats <- function(a, b) {
	c <- sqrt(a^2+b^2);
	if (c %% 1 == 0) {
		print(paste("(",a,",",b,",",c,") is a right triangle triple."));			
	} 
}

for (i in 1:100) {
	for (j in i:100) {
		findTripleNoRepeats(i, j);
	}
}


##################### 4 #####################
# The two are closely related because every element in the set (6, 8, 10) is a double of each elements in (3, 4, 5);
# Another fun couple of sets that resemble the ones above are (9, 40, 41) and (18, 80, 82);


##################### 5 #####################
# Many #


##################### 6 #####################
gcd <- function(a, b) {
	if (b == 0) {
		return (a);
	}
	gcd (b, a %% b);
}

findBasicTriples <- function(a, b) {
	c <- sqrt(a^2+b^2);
	if (c %% 1 == 0) {
		if (gcd(a, b) == 1) {
			print(paste("(",a,",",b,",",c,") is a right triangle triple."));						
		}
	} 
}

for (i in 1:100) {
	for (j in i:100) {
		findBasicTriples(i, j);
	}
}


##################### 7 #####################
# The first two of the basic triples are always different (odd/even), since they don't have a common divisor except 1,
# so it makes sense that "a" and "b" follow the order of being odd and even and "c" is always odd.


##################### 8 #####################
gcd <- function(a, b) {
	if (b == 0) {
		return (a);
	}
	gcd (b, a %% b);
}

findBasicTriples <- function(a, b) {
	c <- sqrt(a^2+b^2);
	if (c %% 1 == 0) {
		if (gcd(a, b) == 1 & a%%2 != 0) {
			print(paste("(",a,",",b,",",c,") is a right triangle triple."));						
		}
	} 
}

for (i in 1:100) {
	for (j in i:100) {
		findBasicTriples(i, j);
	}
}
# I see that there is a pattern for the first couple of sets, but it's broken after a while;
# I would have to look deeper into it to come up with the algorithm you mentioned;


##################### 9 ##################### Triples where the lowest number is a multiple of 4;
tripleWithLowestFour <- function(a, b) {
	c <- sqrt(a^2+b^2);
	if (c %% 1 == 0) {
		lowest <- a;
		if (a > b) {
			lowest = b;
		}
		if (lowest %% 4 == 0) {
			print(paste("(",a,",",b,",",c,") is a right triangle triple."));			
		}
	} 
}

for (i in 1:100) {
	for (j in 1:100) {
		tripleWithLowestFour(i, j);
	}
}





