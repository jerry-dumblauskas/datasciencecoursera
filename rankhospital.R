rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    dt <-read.csv("~/r_work/rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
    ## Check that state and outcome are valid
    if (!match(state,state.abb, nomatch=0)) {
        stop("invalid state")
    }
    
    # coerce num
    if (num == "best") {
        num<-c(1)
    }
    
    outcomes<-c("heart attack", "heart failure", "pneumonia")
    idx<-c(11,17,23)
    if (!match(outcome,outcomes, nomatch=0)) {
        stop("invalid outcome")
    }
    
    qaz<-data.frame(idx,outcomes)
    ind<-subset(qaz$idx,qaz$outcomes==outcome)
    
    # filter the data
    d_final<-subset(dt,dt[7]==state & dt[ind] != 'Not Available', select=c(2,ind))
    # bs step to convert to numeric
    d_final[[2]]<-as.numeric(d_final[[2]])
    # sort the data
    d_final_x <- d_final[order(d_final[2], d_final[1])  ,  ]
    # return it
    if (num == "worst") {
        num<-nrow(d_final_x)
    }
    d_final_x[[1]][num]
}