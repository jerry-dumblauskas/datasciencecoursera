complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    setwd(paste("~/r_work/" ,toString(directory), sep = ""))
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    # loop all files -- build a result form
    
    #again, we need a switch for the first case
    ret <- c(NA)
    
    for (idx in id) {
        idxy <-str_pad(idx, 3, pad = "0")
        
        ds<-read.csv(paste(idxy,".csv", sep = ""))
        dsx <- ds[complete.cases(ds), ]
        res<-data.frame(id=idx, nobs=nrow(dsx))
        # first data frame
        if (is.na(ret)) {
            my_merged_data <-res
            ret <- c(1)
            next
        }
        
        # merge the rest of the data
        my_merged_data <-rbind(my_merged_data, res)
    }
    
    # return the data
    my_merged_data
    
}