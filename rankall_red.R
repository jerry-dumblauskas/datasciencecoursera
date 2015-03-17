rankall_red <- function(outcome, num = "best") {
    dt <-read.csv("~/r_work/rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
    qaz<-data.frame(c(11,17,23),c("heart attack", "heart failure", "pneumonia"))
    if (!match(outcome,qaz[,2], nomatch=0)) stop("invalid outcome")
    state.abbr <-  c (state.abb[1:8], "DC", state.abb[9:44], 'VI', state.abb[45:50])
    rtn = matrix(nrow=52, ncol=2, dimnames=list(rep(NA,52), c("hospital", "state")))
    x<-1
    for (l_st in state.abbr[order(state.abbr)] ) {
        d_final<-subset(dt,dt[7]==l_st & dt[subset(qaz[,1],qaz[,2]==outcome)] != 'Not Available', select=c(2,subset(qaz[,1],qaz[,2]==outcome)))
        d_final[[2]]<-as.numeric(d_final[[2]])
        numx<-num
        numx<-ifelse(num == "worst",nrow(d_final), numx)
        numx<-ifelse(num == "best",c(1), numx)
        nr<-c(d_final[order(d_final[2], d_final[1]) , ][[1]][numx], l_st)
        rtn[x,]<-nr
        x<-x+1
    }
    data.frame(rtn, row.names=rtn[,2])
}