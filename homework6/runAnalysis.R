## Test- und Trainingsdaten vereinen 
## nicht vergessen: working-directory auf Datensatz einstellen
## und reshape2 installieren für melt und dcast
## mit hilfe von github: https://github.com/Themosp/Getting-and-Cleaning-Data-project/blob/master/run_analysis.R

library(reshape2)

activity_labels <- read.table("./activity_labels.txt",col.names=c("activity_id","activity_name"))
feature_names <- read.table("features.txt")[,2]

## read data funktion ("rd") zum einlesen aller dateien:
rd <- function(variable, file, cnames=NULL) {
  x <- paste0(variable)
  z <- assign(paste0(x), read.table(file), envir=.GlobalEnv)
  if(missing(cnames)) {
    colnames(z) <- feature_names
  }
  else {
    colnames(z) <- cnames
  }
  assign(paste0(x), z, envir=.GlobalEnv)
  
}

## jetzt können die daten einfach in einer zeile eingelesen werden:
rd("testdata", "./test/X_test.txt")
rd("traindata", "./train/X_train.txt")
rd("test_subject_id", "./test/subject_test.txt", cnames="subject_id")
rd("test_activity_id", "./test/y_test.txt", cnames="activity_id")
rd("train_subject_id", "./train/subject_train.txt", cnames="subject_id")
rd("train_activity_id", "./train/y_train.txt", cnames="activity_id")

test_data <- cbind(test_subject_id , test_activity_id , testdata)
train_data <- cbind(train_subject_id , train_activity_id , traindata)
all_data <- rbind(train_data,test_data)

## nur mean oder std spalten behalten, verkürzt auf drei zeilen
ms_col_idx <- grep("mean|std",names(all_data),ignore.case=TRUE)
ms_col_names <- names(all_data)[ms_col_idx]
msdata <-all_data[,c("subject_id","activity_id",ms_col_names)]


## die letzten vier zeilen habe ich übernommen, wusste nicht wie ich es anders lösen kann:



descrnames <- merge(activity_labels,msdata,by.x="activity_id",by.y="activity_id",all=TRUE)

data_melt <- melt(descrnames,id=c("activity_id","activity_name","subject_id"))

mean_data <- dcast(data_melt,activity_id + activity_name + subject_id ~ variable,mean)

write.table(mean_data, "./tidy_data.txt")

