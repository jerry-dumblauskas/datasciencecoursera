#con<-download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", "~/Downloads/hw4.csv",method="curl")
#xxx<-read.csv("~/Downloads/hw4.csv")

#q1<-strsplit(names(xxx),'wgtp')
#print (q1[[123]])

#con<-download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", "~/Downloads/hw4_2.csv",method="curl")
#xxx2<-read.csv("~/Downloads/hw4_2.csv")

#q4_2<-xxx2[c(5:194),5]

#print ( mean( as.numeric( gsub(" ", "", gsub(",", "", q4_2) ) ) ) )

#countryNames <- xxx2$X.2

#print ( grep("^United",countryNames) )

#con<-download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", "~/Downloads/hw4_4_1.csv",method="curl")
#xxx4_1<-read.csv("~/Downloads/hw4_4_1.csv")

#con<-download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", "~/Downloads/hw4_4_2.csv",method="curl")
#xxx4_2<-read.csv("~/Downloads/hw4_4_2.csv")

#total_data <- merge(xxx4_1[5:194,],xxx4_2,by.x="X", by.y="CountryCode")

#print ( length(grep("Fiscal year end: June ", total_data$Special.Notes)) )

#total_data$Speci
#library(quantmod)
#amzn = getSymbols("AMZN",auto.assign=FALSE)
#sampleTimes = index(amzn) 

#install.packages('lubridate')
#library(lubridate)
#print ( sum(year(sampleTimes) == 2012))
