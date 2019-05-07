#Detecta inicialmente si la serie de tiempo tiene valores NA
#Recibe un vector o serie de tiempo y lo vuelve un vector lógico
#Verifica si tiene NA's si no tiene continua a hacer la detección de OUtliers


naono <- function(h){ a <- 0 
h <- is.na(h)
  for(k in 1:length(h)){
    if(h[k]==TRUE){a <- a+1} 
    if(a > 0){
      break}
    }
    
as.numeric(a) 
}
