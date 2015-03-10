
#install.packages('httr')
#library('httr')

#dt<-GET('https://api.github.com/repos/jtleekzz/datasharing')

#zz<-content(dt)
#2013-11-07
#install.packages('sqldf')
#library('sqldf')

#acs <-read.csv("~/Downloads/getdata-data-ss06pid.csv")

#con<-url("http://biostat.jhsph.edu/~jleek/contact.html")
#xxx<-readLines(con)

#con<-download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for", "~/Downloads/xxx.for",method="curl")
xxx<-read.fwf("~/Downloads/xxx.for", skip=4, widths=c(16,4,8,4,9,4,9,4,4))