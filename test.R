# make sure to set the correct working directory!
li1 = list(n =  10000,
           dim =  10,
           rho =  0.1,
           thresh_hi =  0.8,
           thresh_lo =  0.2,
           r =  1,
           numSimulations =  1,
           initPopSize =  500,
           carryingCapacity =  500,
           timeSteps =  10000)

li2 = list(n =  10000,
           dim =  30,
           rho =  0.1,
           thresh_hi =  0.8,
           thresh_lo =  0.2,
           r =  1,
           numSimulations =  1,
           initPopSize =  500,
           carryingCapacity =  500,
           timeSteps =  10000)

li3 = list(n =  10000,
           dim =  20,
           rho =  0.1,
           thresh_hi =  0.8,
           thresh_lo =  0.2,
           r =  1,
           numSimulations =  1,
           initPopSize =  500,
           carryingCapacity =  500,
           timeSteps =  10000)


nm <- c("n","dim","rho","thresh_hi","thresh_lo", "r",
        "numSimulations","initPopSize","carryingCapacity", "timeSteps")
        
df <- as.data.frame(matrix(data=c(li1,li2,li3),ncol=3,dimnames = list(nm, NULL)))

for(i in 1:ncol(df)){
  rmarkdown::render('copulaWithTailDependence.Rmd', params = df[,i],
                     output_file = paste0(paste0(paste0(names(df[,i]),'='),df[,i],collapse='|'),".html"), 
                     output_dir = paste0(getwd(),"/html/"))
}
  
  

