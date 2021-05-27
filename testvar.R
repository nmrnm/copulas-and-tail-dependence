
#library(pracma)
library(copula)
library(pracma)
#reuman's function
newCopulaWithTailDependence<-function(n,dim,rho,thresh_lo,thresh_hi)
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


makeVar <- function(amount,param,tail){
  n <- 10000000
  n1 <- floor(n*(1-amount))
  n2 <- n-n1
  U <- runif(n1,max=(1-amount))
  U <- cbind(U,U)
  ncop <- normalCopula(param=param, dim=2)
  if(!tail) {return((amount)*rCopula(n2,ncop)+(1-amount))}
  else{
    x <- (amount)*rCopula(n2,ncop)+(1-amount)
  }
    
  U <- rbind(U,x)
}
x <- newCopulaWithTailDependece(100000,2,0.1,0.3,0.7)
plot(x)
mean(x)
temp1<-cov(x[,1][x[,1]<0.3],x[,2][x[,2]<0.3])
temp2<-cov(x[,1][x[,1]>0.3&x[,1]<0.7],x[,2][x[,2]>0.3&x[,1]<0.7])
temptop<-cov(x[,1][x[,1]>0.7],x[,2][x[,2]>0.7])
temp1 <- 0.3*(temp1+0.0225)
temp2 <- (0.7-0.3)*(temp2+((0.3+0.7)*0.5)^2)
temptop <- (1-0.7)*(temptop+0.7255)
temp3 <- temp1+temp2+temptop-0.25
temp3
temp1
temp2
temptop
cov(x)[1,2]
cov(x)[1,2]+0.25#(0.5*(0.3+(0.3+amount)))^2
plot.ecdf(x[,1]*x[,2])
plot.ecdf(runif(10000)*runif(10000))
plot(runif(10000),runif(10000))
x <- makeVar(0.7,0.4,F)

eUnif <- function(a,b){
  return(0.5*(a+b))
}
varUnif <- function(a,b){
  return((1/12)*(b-a)^2)
}
covTailedNormalCopula <- function(lower,upper,rho){
  f <- function(x,y){
    a <- function(x){sqrt(2)*erfinv(2*((1)*(x-lower)/(upper-lower))-1)}
    b <- function(y){sqrt(2)*erfinv(2*((1)*(y-lower)/(upper-lower))-1)}
    (x*y)*(1/(upper-lower))*(1/sqrt(1-rho^2))*exp(-1*((a(x)^2+b(y)^2)*rho^2-(2*a(x)*b(y)*rho))/(2*(1-rho^2)))
  } 
  
  int1 <- lower*(varUnif(0,lower)+eUnif(0,lower)^2)
  int2 <- (1-upper)*(varUnif(upper,1)+eUnif(upper,1)^2)
  int3 <- integral2(f,xmin=lower,xmax=upper,ymin=lower,ymax=upper)$Q
  return(int1+int2+int3-eUnif(0,1)^2)
}
covTailedNormalCopula(0.4,0.7,0.1)

tailcop <- newCopulaWithTailDependence(10000,2,0.1,0.1,0.7)
mycov <- cov(tailcop)[1,2]
mycov
plot(tailcop)
thingy <- mycov+0.25

dTailCop <- qnorm(tailcop)

plot(dTailCop[,1][dTailCop[,1]<(-1.285)],dTailCop[,2][dTailCop[,2]<(-1.285)])
hist(dTailCop[,1][dTailCop[,1]<(-1.28)])
length(dTailCop[,1][dTailCop[,1]< (-1.28) ])
length(dTailCop[,2][dTailCop[,2]< (-1.28) ])

thingy


covNormalCopula <- function(u,v,rho){
  
  f3 <- function(x,y){
    p <- rho 
    a <- function(x){sqrt(2)*erfinv(2*((x-u)/(v-u))-1)}
    b <- function(y){sqrt(2)*erfinv(2*((y-u)/(v-u))-1)}
    
    (x*y)*(1/((v-u)^2))*(1/sqrt(1-p^2))*exp(-1*((a(x)^2+b(y)^2)*p^2-(2*a(x)*b(y)*p))/(2*(1-p^2)))
  } 
 
  ex <- eUnif(0,1)
  ey <- eUnif(0,1)
  
  sum3 <- (integral2(f3,xmin=u,xmax=v,ymin=u,ymax=v)$Q)
  
  return(sum3-(ex*ey))
  
  
}

rho <- 0.1
ncop <- normalCopula(param= rho, dim =2)
mycop <- rCopula(1000000,ncop)
cov(mycop)[1,2]
covNormalCopula(0,1,rho)

#wikiped
testvarlower <- function(u,v,tail,rho){
  u <-0.3
  v <-1
  tail <- 0.3
  rho <- 0.4
  # sum1 <- 0.3*integral2(function(x,y) (x*y)/(v-u)^2,u,v,u,v)$Q
  sum1 <- (1/12)*(tail-0)^2 
  
  f3 <- function(x,y){
    p <- rho 
    a <- function(x){sqrt(2)*erfinv(2*((x-u)/(v-u))-1)}
    b <- function(y){sqrt(2)*erfinv(2*((y-u)/(v-u))-1)}
    
    (x*y)*(1/((v-u)^2))*(1/sqrt(1-p^2))*exp(-1*((a(x)^2+b(y)^2)*p^2-(2*a(x)*b(y)*p))/(2*(1-p^2)))
  } 
 
  ex <- eUnif(0.3,1)
  ey <- eUnif(0.3,1)
  
  sum3 <- (integral2(f3,xmin=u,xmax=v,ymin=u,ymax=v)$Q)
  thing <- (sum1 + (sum3-ex*ey))
  
  return(sum3-(ex*ey))
  
}

avg <- vector()
for(i in range(1:100000000)){
  cop <- newCopulaWithTailDependence(10000,2,0.4,0.3,1) 
  cov_cop <- cov(cop)
  avg <- append(avg,cov_cop[1,2])
}
mean(avg)



t <- testvarlower(0,1,0.4,0.3)


eUnif(0,1)
eUnif(1,2)

