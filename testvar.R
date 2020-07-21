
#library(pracma)
library(copula)
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

eUnif <- function(a,b){
  return(0.5*(a+b))
}

makeVar <- function(){
  U <- runif(3000,max=0.3)
  U <- cbind(U,U)  
  ncop <- normalCopula(param=0.4, dim=2)
  x <- 0.7*rCopula(7000,ncop)+0.3
  U <- rbind(U,x)  
}


varNormalCopula <- function(u,v,rho){
  
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
varNormalCopula(0,1,rho)

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

