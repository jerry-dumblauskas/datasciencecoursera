#l_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

#download.file(l_url, "l_data.csv", method="curl")
print (getwd())
fff<-read.csv("l_data.csv")
ggg<-subset(fff,fff$VAL == 24 & fff$TYPE==1)

#l_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
#download.file(l_url, "l_data.xlsx", method="curl")

library(xlsx)
raw_d<-read.xlsx('l_data.xlsx', sheetIndex=1, header=TRUE)
dat<-raw_d[ 7:15, 18:23]
print (sum(dat$Zip*dat$Ext,na.rm=T) )

library(XML)
l_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
#download.file(l_url, "l_res_dat.xml", method="curl")
l_res<-xmlTreeParse("l_res_dat.xml", useInternal=TRUE)
rootNode<-xmlRoot(l_res)
xmlName(rootNode)

zippy<-xpathSApply(rootNode, "//zipcode", xmlValue)
