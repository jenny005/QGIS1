#load libraries and functions ====================
rm(list = ls())
library(easypackages)
libraries("tidyverse","fpp2","gridExtra","zoo","GGally","foreign","ggrepel","readxl","tictoc")
#=======================
tic()
df1=read.csv("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv")
write.csv(df1,paste0("../Data/Raw/Shapes/Raw",Sys.Date(),".csv"))
toc()




#================= Subselections =================================
#stnames=c("Texas","Florida","Louisiana","South Carolina","North Carolina","Maryland")
curdates=c("2020-04-01","2020-07-01","2020-10-01","2021-01-01")

df2=df1%>%filter( DATE %in% curdates)
df2long1=df2%>%select(DATE,CASES,FIPS)
df2wide1=spread(df2long1,DATE,CASES)                 
df2long2=df2%>%select(DATE,DEATHS,FIPS)
df2wide2=spread(df2long2,DATE,DEATHS)   
df2wide=merge(df2wide1,df2wide2, by=c("STATE","COUNTY"))
write.csv(df2wide,"../Data/Processed/Shapes/USA/Selection.csv")




#================== County Level data addition ===================


df3=read.dbf("../Data/Processed/Shapes/USA/USA_Counties-shp/USA_Counties.dbf")
df4=merge(df2wide,df3,by.x="FIPS.x",by.y="FIPS")
write.dbf(df4,"../Data/Processed/Shapes/USA/USA_Counties-shp/USA_Counties.dbf")




