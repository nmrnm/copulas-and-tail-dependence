
li1 = list(n =  10000,
dim =  20,
rho =  0.1,
thresh_hi =  1.0,
thresh_lo =  0.3,
r =  1,
numSimulations =  1,
initPopSize =  500,
carryingCapacity =  500,
timeSteps =  10000)

li2 = list(n =  10000,
dim =  20,
rho =  0.1,
thresh_hi =  0.7,
thresh_lo =  0.0,
r =  1,
numSimulations =  1,
initPopSize =  500,
carryingCapacity =  500,
timeSteps =  10000)

nm <- c("n","dim","rho","thresh_hi","thresh_lo", "r",
        "numSimulations","initPopSize","carryingCapacity", "timeSteps")
        
df <- as.data.frame(matrix(data=c(li1,li2),ncol=2,dimnames = list(nm, NULL)))

for(i in 1:ncol(dataFrame)){
  rmarkdown::render('copulaWithTailDependence.Rmd', params = df[,i],
                     output_file = paste0(paste0(paste0(names(df[,i]),'='),df[,i],collapse='|'),".html"), 
                     output_dir = paste0(getwd(),"/testhtml/"))
}
  
  
