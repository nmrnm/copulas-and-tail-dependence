# make sure to set the correct working directory!
li0 = list(n =  10000,
           dim =  100,
           rho =  0.1,
           thresh_hi =  0.6,
           thresh_lo =  0.0,
           r =  1,
           numSimulations =  1,
           initPopSize =  500,
           carryingCapacity =  500,
           timeSteps =  10000,
           setseed = FALSE,
           seed = 10)

li1 = list(n =  10000,
           dim =  150,
           rho =  0.1,
           thresh_hi =  0.6,
           thresh_lo =  0.0,
           r =  1,
           numSimulations =  1,
           initPopSize =  500,
           carryingCapacity =  500,
           timeSteps =  10000,
           setseed = FALSE,
           seed = 10)

li2 = list(n =  10000,
           dim =  300,
           rho =  0.1,
           thresh_hi =  0.6,
           thresh_lo =  0.0,
           r =  1,
           numSimulations =  1,
           initPopSize =  500,
           carryingCapacity =  500,
           timeSteps =  10000,
           setseed = FALSE,
           seed = 10)

li3 = list(n =  10000,
           dim =  250,
           rho =  0.1,
           thresh_hi =  0.6,
           thresh_lo =  0.0,
           r =  1,
           numSimulations =  1,
           initPopSize =  500,
           carryingCapacity =  500,
           timeSteps =  10000,
           setseed = FALSE,
           seed = 10)

li4 = list(n =  10000,
           dim =  10,
           rho =  0.1,
           thresh_hi =  1.0,
           thresh_lo =  0.4,
           r =  1,
           numSimulations =  1,
           initPopSize =  500,
           carryingCapacity =  500,
           timeSteps =  10000,
           setseed = FALSE,
           seed = 10)


nm <- c("n","dim","rho","thresh_hi","thresh_lo", "r",
        "numSimulations","initPopSize","carryingCapacity", "timeSteps","setseed","seed")
        
df <- as.data.frame(matrix(data=c(li4),ncol=1,dimnames = list(nm, NULL)))

for(i in 1:ncol(df)){
  rmarkdown::render('copulaWithTailDependence.Rmd', params = df[,i],
                     output_file = paste0(paste0(paste0(names(df[,i]),'='),df[,i],collapse='|'),".html"), 
                     output_dir = paste0(getwd(),"/testtailhtml/"))
}
  
  

