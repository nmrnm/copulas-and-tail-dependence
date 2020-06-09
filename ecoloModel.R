library(ggplot2)


timeSteps <- 50 # in years

popSize_T <- 100 # initial population 
growthRate <- 1
carryingCapac <- 10000

for(i in 2:timeSteps){
  popSize_T[i] <- popSize_T[i-1]*exp(1-(popSize_T[i-1]/carryingCapac))  
}

popTimeSer <- ts(popSize_T)
plot(popTimeSer)

