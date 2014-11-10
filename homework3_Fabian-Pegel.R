pollutantmean <-  function (directory , pollutant , id = 1:332) {
  orte <- id
  orte_neu <- character()
  for (ort in orte) {
    if (ort<10) {
      
      ort_x <- paste(directory,"00",ort,".csv", sep="")
      orte_neu[ort] <- ort_x
    }
    else if (ort > 9 && ort < 100) {
      ort_x <- paste(directory,"0",ort,".csv", sep="")
      orte_neu[ort] <- ort_x
    }
    else if (ort>=100){
      ort_x <- paste(directory,ort,".csv", sep="")
      orte_neu[ort] <- ort_x    
    }

  
  }
  means <- numeric()
  for (ort in orte) {
    data <- read.csv(orte_neu[ort])
    mean_x <- mean(data[pollutant][!is.na(data[pollutant])])
    means[ort] <- mean_x
    # in means sind jetzt alle durchschnittswerte des pollutants für jede ortschadt gespeichert
    # jetzt müssen wir noch den durchschnitt für alle übergebenen ortschaften ermitteln
  }
means_gesamt <- mean(means, na.rm = TRUE)
means_gesamt
}
# aufruf zb mit: pollutantmean("/Users/fabian/datascience/specdata/",id=331:332, pollutant="nitrate")