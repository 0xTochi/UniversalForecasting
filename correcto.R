correcto <- function(x, plot = F){ 
  #Inicialmente va a detectar si la serie de tiempo tiene alg?n NA
  t <- as.ts(x)
  source(file = "~/Documents/Universidad de Antioquia/Proyectos 2/Ejercicio Google energía eléctrica/Limpieza de datos/Algoritmia/naono.R")
  a <- naono(x)
  if(a > 0){library(imputeTS)
    t <- as.ts(na.kalman(t))} #Si tiene NA aplica el m?todo de imputaci?n 
  source(file = "~/Documents/Universidad de Antioquia/Proyectos 2/Ejercicio Google energía eléctrica/Limpieza de datos/Algoritmia/tsoutliers.R")
  
  m <- as.ts(as.vector(tsoutliers(t))) #Detecta los outliers 
  for(i in 1:length(t)){if(m[i] != 0 ){t[i]= NA }}
  
  b <- naono(t) #Si habia outliers, los cambia suavizando
  if(b > 0){library(imputeTS)
    t <- as.ts(na.kalman(t))}
}

