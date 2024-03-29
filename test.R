li0= list(n =  10000,
           dim =  10,
           rho =  0.1,
           thresh = 0.3,
           eps_sd=0.01,
           r =  1,
           initPopSize =  500,
           carryingCapacity =  500,
           timeSteps =  10000,
           setseed = FALSE,
           seed = 10)

li1= list(n =  10000,
           dim =  10,
           rho =  0.1,
           thresh = 0.3,
           eps_sd=0.05,
           r =  1,
           initPopSize =  500,
           carryingCapacity =  500,
           timeSteps =  10000,
           setseed = FALSE,
           seed = 10)
li2 = list(n =  10000,
           dim =  10,
           rho =  0.1,
           thresh = 0.3,
           eps_sd=0.1,
           r =  1,
           initPopSize =  500,
           carryingCapacity =  500,
           timeSteps =  10000,
           setseed = FALSE,
           seed = 10)
li3 = list(n =  10000,
           dim =  10,
           rho =  0.1,
           thresh = 0.3,
           eps_sd=0.2,
           r =  1,
           initPopSize =  500,
           carryingCapacity =  500,
           timeSteps =  10000,
           setseed = FALSE,
           seed = 10)


li4 = list(n =  10000,
           dim =  10,
           rho =  0.1,
           thresh = 0.3,
           eps_sd=0.3,
           r =  1,
           initPopSize =  500,
           carryingCapacity =  500,
           timeSteps =  10000,
           setseed = FALSE,
           seed = 10)

li5 = list(n =  10000,
           dim =  10,
           rho =  0.1,
           thresh = 0.3,
           eps_sd=0.4,
           r =  1,
           initPopSize =  500,
           carryingCapacity =  500,
           timeSteps =  10000,
           setseed = FALSE,
           seed = 10)

nm <- c("n","dim","rho","thresh", "eps_sd", "r",
        "initPopSize","carryingCapacity", "timeSteps","setseed","seed")
        
df <- as.data.frame(matrix(data=c(li0),ncol=1,dimnames = list(nm, NULL)))

for(i in 1:ncol(df)){
  rmarkdown::render('copulaWithTailDependence.Rmd', params = df[,i],
                     output_file = paste0(paste0(paste0(names(df[,i]),'='),df[,i],collapse='|'),".html"), 
                     output_dir = paste0(getwd(),"/tohtml/"))
}
  
  

