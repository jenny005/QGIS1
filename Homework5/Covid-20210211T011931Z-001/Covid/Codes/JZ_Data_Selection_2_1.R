#load libraries and functions ====================
rm(list = ls()) # remove all variables in Environment
library(easypackages) # install easypackages, the libraries including the following:
libraries("tidyverse","fpp2","gridExtra","zoo","GGally","foreign","ggrepel","readxl","tictoc")
#=======================
tic() # start counting time
df1=read.csv("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv") # from internet read us-counties.csv file into df1
toc() # end counting time
#=======
tic() # start counting time
write.csv(df1,paste0("../Data/Raw/Shapes/Raw",Sys.Date(),".csv")) # write all information in df1 into Raw.csv file with required path
toc() # end counting time

#================= Selection =================================
df2=df1%>%filter(date=="2021-02-08") # choose the required date data and named df2
write.csv(df2,"../Data/Processed/Shapes/USA/Selection.csv") # write df2 information into selection.csv file

#================= Selection =================================
df2=df1%>%filter(date=="2021-02-09") # choose the required date data and named df2
write.csv(df2,"../Data/Processed/Shapes/USA/Selectionzj.csv") # write df2 information into selectionzj.csv file







