tsoutliers <- function(x,plot=FALSE) #Recibe la data a una sola columna, Gr?gica pro defecto esta FALSE
{
  x <- as.ts(x)
  if(frequency(x)>1)
    resid <- stl(x,s.window="periodic",robust=TRUE)$time.series[,3]
  #La funci?n STL te da una tabla con de la forma c(Estacionalidad,ttendencia,residuo)
  else
  {#En caso de la serie de tiempo no tener frequency preestablecida
    tt <- 1:length(x)
    resid <- residuals(loess(x ~ tt))
  }
  resid.q <- quantile(resid,prob=c(0.25,0.75))#Los valores para hallar las anomal?as
  #sE PUEDE MODIFICAR, dependiendo de la distribuci?n de la data
  iqr <- diff(resid.q) #Diferencia para quitar la estacionalidad
  limits <- resid.q + 1.5*iqr*c(-1,1) #STL 1,5 STANDAR PARA boxplot
  score <- abs(pmin((resid-limits[1])/iqr,0) + pmax((resid - limits[2])/iqr,0))
  if(plot) #Si se desea graficar
  {
    plot(x)
    x2 <- ts(rep(NA,length(x)))
    x2[score>0] <- x[score>0]
    tsp(x2) <- tsp(x)
    points(x2,pch=19,col="red")
    return(invisible(score))
  }
  else
    return(score)
}