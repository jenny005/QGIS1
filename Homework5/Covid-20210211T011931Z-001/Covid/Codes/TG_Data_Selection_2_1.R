#load libraries and functions ====================
rm(list = ls())
library(easypackages)
libraries("tidyverse","fpp2","gridExtra","zoo","GGally","foreign","ggrepel","readxl","tictoc")
#=======================
tic()
df1=read.csv("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv")
toc()
#=======
tic()
write.csv(df1,paste0("../Data/Raw/Shapes/Raw",Sys.Date(),".csv"))
toc()

#================= Selection =================================
df2=df1%>%filter(date=="2021-02-08")
write.csv(df2,"../Data/Processed/Shapes/USA/Selection.csv")









