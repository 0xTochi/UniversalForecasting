#Este script trae la data de la carpeta Data inicial que se ha creado para ello

library(readr)
t <- read.table(file = "~/Documents/Universidad de Antioquia/Proyectos 2/Ejercicio Google energía eléctrica/Limpieza de datos/Algoritmia/Data inicial/turkey_elec1.csv", sep = ";", header = TRUE) 
View(t)

# este scrip lo uso para llamar mis funciones
source(file = "~/Documents/Universidad de Antioquia/Proyectos 2/Ejercicio Google energía eléctrica/Limpieza de datos/Algoritmia/correcto.R")
