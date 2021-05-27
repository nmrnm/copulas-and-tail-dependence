library(copula)
newCopulaWithTailDependece<-function(n,dim,rho,thresh_lo,thresh_hi)
{
  U<-runif(n)
  ncop<-normalCopula(rho,dim=dim) 
  res<-rCopula(n,ncop)
  res<-(thresh_hi-thresh_lo)*res+thresh_lo
  res[U>thresh_hi,]<-rep(U[U>thresh_hi],times=dim) #this line takes the rows of res for which the corresponding
  #entry of U is bigger than thresh_hi and replaces both entries of those rows by the corresponding value of U
  res[U<thresh_lo,]<-rep(U[U<thresh_lo],times=dim) #this line takes the rows of res for which the corresponding
  #entry of U is smaller than thresh_lo and replaces both entries of those rows by the corresponding value of U
  return(res)
}

#this function assumes yval is between 0 and 1
conditionalExpect <- function(lower,upper,rho,yval){
  if(yval<=lower || yval >= upper){
    return(yval)
  } 
  
  f <- function(x){
    a <- function(x){sqrt(2)*erfinv(2*((1)*(x-lower)/(upper-lower))-1)}
    b <- sqrt(2)*erfinv(2*((1)*(yval-lower)/(upper-lower))-1)
    x*(1/(upper-lower))*(1/sqrt(1-rho^2))*exp(-1*((a(x)^2+b^2)*rho^2-(2*a(x)*b*rho))/(2*(1-rho^2)))
  } 
  
  integrate(f,lower,upper)$value
}


gm_mean = function(x, na.rm=TRUE){
  exp(sum(log(x[x > 0]), na.rm=na.rm) / length(x))
}

l <- 0.3
u <- 0.7
rho <- 0 
y <- 0.65

s <- sapply(y, conditionalExpect, lower=l, upper=u, rho=rho)

tailCop <- newCopulaWithTailDependece(30000000,2,rho,l,u)

t <- tailCop[tailCop[,1]>=0.64999&tailCop[,1]<=0.65,]
dim(t)
mean(t[,2])
gm_mean(t[,2])
