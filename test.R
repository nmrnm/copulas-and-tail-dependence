
li = list(n =  10000,
dim =  20,
rho =  0.1,
thresh_hi =  1.0,
thresh_lo =  0.3,
r =  1,
numSimulations =  1,
initPopSize =  500,
carryingCapacity =  500,
timeSteps =  10000)

rmarkdown::render('copulaWithTailDependence.Rmd', params = li,
                    output_file = paste0(paste0(paste0(names(li),'='),li,collapse='|'),".html"),  
                    output_dir = paste0(getwd(),"/html/"))

li = list(n =  10000,
dim =  20,
rho =  0.1,
thresh_hi =  0.7,
thresh_lo =  0.0,
r =  1,
numSimulations =  1,
initPopSize =  500,
carryingCapacity =  500,
timeSteps =  10000)

rmarkdown::render('copulaWithTailDependence.Rmd', params = li,
                   output_file = paste0(paste0(paste0(names(li),'='),li,collapse='|'),".html"), 
                   output_dir = paste0(getwd(),"/html/"))

li = list(n =  10000,
          dim =  3,
          rho =  0.1,
          thresh_hi =  0.8,
          thresh_lo =  0.2,
          r =  1,
          numSimulations =  1,
          initPopSize =  500,
          carryingCapacity =  500,
          timeSteps =  10000)

rmarkdown::render('copulaWithTailDependence.Rmd', params = li,
                  output_file = paste0(paste0(paste0(names(li),'='),li,collapse='|'),".html"), 
                  output_dir = paste0(getwd(),"/html/"))

li = list(n =  10000,
          dim =  10,
          rho =  0.1,
          thresh_hi =  0.8,
          thresh_lo =  0.2,
          r =  1,
          numSimulations =  1,
          initPopSize =  500,
          carryingCapacity =  500,
          timeSteps =  10000)

rmarkdown::render('copulaWithTailDependence.Rmd', params = li,
                  output_file = paste0(paste0(paste0(names(li),'='),li,collapse='|'),".html"), 
                  output_dir = paste0(getwd(),"/html/"))

li = list(n =  10000,
          dim =  20,
          rho =  0.1,
          thresh_hi =  0.8,
          thresh_lo =  0.2,
          r =  1,
          numSimulations =  1,
          initPopSize =  500,
          carryingCapacity =  500,
          timeSteps =  10000)

rmarkdown::render('copulaWithTailDependence.Rmd', params = li,
                  output_file = paste0(paste0(paste0(names(li),'='),li,collapse='|'),".html"), 
                  output_dir = paste0(getwd(),"/html/"))