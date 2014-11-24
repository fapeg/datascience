# mit hilfe von github-code geschrieben!
best <- function(state, outcome) {
  data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
  if (outcome == "heart attack") {
    spalte <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
  } else if (outcome == "heart failure") {
    spalte <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
  } else if (outcome == "pneumonia") {
    spalte <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
  }
  else {
    stop("invalid outcome")
  }
  staatsdaten <- data[data["State"] == state, c("Hospital.Name", spalte)]
  if (length(staatsdaten[,1]) == 0) { # wenn keine namen vorhanden sind
    stop("invalid state")
  }
  staatsdaten[,2] <- as.numeric(staatsdaten[,2]) # mortality rate numerisch
  as.character(staatsdaten$Hospital.Name[order(staatsdaten[spalte], staatsdaten$Hospital.Name)[1]])
}