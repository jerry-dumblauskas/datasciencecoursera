rankall_red <- function(outcome, num = "best") {
    dt <-read.csv("~/r_work/rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
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
    for (l_st in state.abbr[order(state.abbr)] ) {
        d_final<-subset(dt,dt[7]==l_st & dt[ind] != 'Not Available', select=c(2,ind))
        d_final[[2]]<-as.numeric(d_final[[2]])
        d_final_x <- d_final[order(d_final[2], d_final[1]) , ]
        numx<-num
        numx<-ifelse(num == "worst",nrow(d_final_x), numx)
        numx<-ifelse(num == "best",c(1), numx)
        nr<-c(d_final_x[[1]][numx], l_st)
        rtn[x,]<-nr
        x<-x+1
    }
    zzz<-data.frame(rtn, row.names=rtn[,2])
    colnames(zzz) <- c("hospital", "state")
    zzz
}