library(copula)
set.seed(16) #arbitrary number for reproducibility

# to create an arbitrary covariance matrix that is positive
# semi definite we need it to be a matrix in the form
# A^(t) * A so we do the following

dim <- 3

# multiplying uniform numbers by 2 then subtracting 1 
# ensures that the matrix are random numbers on the interval
# from (-1,1)
tempmat <- matrix(2*runif(dim^2)-1, nrow = dim)
covMat <- t(tempmat) %*% tempmat

sumOfVar <- sum(covMat)

print(sumOfVar)


