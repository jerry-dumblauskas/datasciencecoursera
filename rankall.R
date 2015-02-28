rankall <- function(outcome, num = "best") {
    ## Read outcome data
    dt <-read.csv("~/r_work/rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
    ## Check that state and outcome are valid
    
    # coerce num
    if (num == "best") {
        numx<-c(1)
    }else {
        numx<-num
    }

    outcomes<-c("heart attack", "heart failure", "pneumonia")
    idx<-c(11,17,23)
    if (!match(outcome,outcomes, nomatch=0)) {
        stop("invalid outcome")
    }
    
    qaz<-data.frame(idx,outcomes)
    ind<-subset(qaz$idx,qaz$outcomes==outcome)
    state.abbr <-  c (state.abb[1:8], "DC", state.abb[9:44], 'VI', state.abb[45:50])

    rtn = matrix(nrow=52, ncol=2)
    x<-1
    # filter the data
    for (l_st in state.abbr[order(state.abbr)] ) {

        d_final<-subset(dt,dt[7]==l_st & dt[ind] != 'Not Available', select=c(2,ind))
        # bs step to convert to numeric
        d_final[[2]]<-as.numeric(d_final[[2]])
        # sort the data
        d_final_x <- d_final[order(d_final[2], d_final[1])  ,  ]
        # return it
        if (num == "worst") {
            numx<-nrow(d_final_x)
        }
        if (l_st=='WI') {
            print (l_st)
        }
        nr<-c(d_final_x[[1]][numx], l_st)
        rtn[x,]<-nr
        x<-x+1
    }

    zzz<-data.frame(rtn, row.names=rtn[,2])
    colnames(zzz) <- c("hospital", "state")
    zzz
}