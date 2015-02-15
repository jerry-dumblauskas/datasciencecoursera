library(stringr)

pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files

    setwd(paste("~/r_work/" ,toString(directory), sep = ""))

    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    
    # dummy var to do merging
    tst <- c(NA)
    
    # loop all files -- build a giant data fram
    for (idx in id) {
        idxy <-str_pad(idx, 3, pad = "0")

        ds<-read.csv(paste(idxy,".csv", sep = ""))
        if (is.na(tst)) {
            tst <- c(1)
            my_merged_data <-ds
            next
        }
        
        # rbind the data set (build it up)
        my_merged_data <-rbind(my_merged_data, ds)
    }
    
    # get the mean
    mean(my_merged_data[[pollutant]], na.rm = TRUE)
    
}