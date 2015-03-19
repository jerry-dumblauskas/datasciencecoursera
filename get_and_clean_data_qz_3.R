
#con<-download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", "~/Downloads/hw3.csv",method="curl")
#xxx<-read.csv("~/Downloads/hw3.csv")

#library(dplyr)
#agricultureLogical<-xxx$ACR == 3 & xxx$AGS == 6
#which(agricultureLogical)
#  [1]  125  238  262

#install.packages('jpeg')
#library(jpeg)

#xqw<-readJPEG('~/Downloads/getdata-jeff.jpg', native=TRUE)
#print (quantile(xqw, probs = seq(0, 1, .1)))


#con<-download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", "~/Downloads/hw31.csv",method="curl")
gdp_dt<-read.csv("~/Downloads/hw31.csv", header=FALSE)

#con<-download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", "~/Downloads/hw32.csv",method="curl")
ed_dt<-read.csv("~/Downloads/hw32.csv")

mg<-merge(gdp_dt,ed_dt, by.x='V1', by.y='CountryCode')

d_final_x <- mg[order(mg[2] , decreasing=TRUE) ,  ]

#print (head(d_final_x,13))

#High income: OECD

qqq<-filter(d_final_x, Income.Group == 'High income: OECD')
print (mean(qqq$V2))
qqq1<-filter(d_final_x, Income.Group == 'High income: nonOECD')
print (mean(qqq1$V2))


filter
