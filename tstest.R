# setwd("/home/m/Documents/research/copulaBegin/copulas-and-tail-dependence/")
# library(forecast)
# library(readxl)
# tute1 <- read.csv("tute1.csv", header=TRUE)
# View(tute1)
# myts <- ts(tute1[,-1],start=1981,frequency=4)
# autoplot(myts,facets= TRUE)
# 
# 
# f <- function(x){
#   if(x==0){
#     return(0)
#   }
#   return(x+10*x^2*sin(1/x))
# }
# l = 1000
# myseq <- seq(from=-1,to=50)
# val <- unlist(lapply(myseq,f))
# plot(myseq,val)
# myts <- ts(val,start=-1,end=50,deltat=51/999)
# hist(val)
# plot.ts(myts)
# pacf(myts)
# acf(myts)

f <- function(x){
 if(x<=0){
   return(10000)
 } 
  return(log(x))
}

g <- 1
for(i in 1:10001){
  g <- append(g, f(g[i]+rnorm(1)))
}
pacf(g)

