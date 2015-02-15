corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    setwd(paste("~/r_work/" ,toString(directory), sep = ""))
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    wrk <- complete(directory)
    filter_wrk <- subset(wrk, wrk$nobs >= threshold)
    
    #return var
    res <- c()
    
    for (idx in filter_wrk[[1]]) {
        idxy <-str_pad(idx, 3, pad = "0")
        
        ds<-read.csv(paste(idxy,".csv", sep = ""))
        dsx <- ds[complete.cases(ds), ]
        xxx <- cor(dsx$nitrate, dsx$sulfate, use = "na.or.complete")
        res <- c(res, xxx)
    }
    
    if(is.null(res)) {
        res<-numeric()
    }
    res

}