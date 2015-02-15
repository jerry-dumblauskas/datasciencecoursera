library(stringr)

pollutantmean <- function(directory, pollutant, id = 332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    zzz <- paste("~/r_work/" ,toString(directory), sep = "")
    print (zzz)
    setwd(zzz)
    print (getwd())
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    
    tst <- c(NA)
    for (idx in id) {
        idxy <-str_pad(idx, 3, pad = "0")
        print (idxy)
        qq<-read.csv(paste(idxy,".csv", sep = ""))
        if (is.na(tst)) {
            tst <- c(1)
            my_merged_data <-qq
            next
        }
        my_merged_data <-rbind(my_merged_data, qq)
    }
    
    # get the mean
    mean(my_merged_data[[pollutant]], na.rm = TRUE)
    
}