# DATA DESCRIPTION
#data set AC

#rm(list = ls())

setwd("/Users/Ozrenka/Desktop/PoliMi/II_semester/Applied Statistics/Project/code")

load("data_curr.RData")
load("data_torque.RData")

#----------------------------------
#   downsampling with step = 100
#----------------------------------
step <- 100
sample <- seq(1, ncol(data_curr)-1, step)

curr_downsample <- data_curr[1, sample]
curr_downsample <- cbind(curr_downsample, data_curr[1,ncol(data_curr)])

for(index in 2:nrow(data_curr)){
  row <- data_curr[index, sample]
  row <- cbind(row, data_curr[index,ncol(data_curr)])
  colnames(row) <- colnames(curr_downsample)
  
  curr_downsample <- rbind(curr_downsample, row)
}


torque_downsample <- data_torque[1, sample]
torque_downsample <- cbind(torque_downsample, data_torque[1,ncol(data_torque)])

for(index in 2:nrow(data_torque)){
  row <- data_torque[index, sample]
  row <- cbind(row, data_curr[index,ncol(data_torque)])
  colnames(row) <- colnames(torque_downsample)
  
  torque_downsample <- rbind(torque_downsample, row)
}

#---------------------------------------
#  working_grasso vs faulty_grasso
#---------------------------------------
working_grasso_curr <- 0
faulty_grasso_curr <- 0

working_grasso_torque <- 0
faulty_grasso_torque <- 0

columns <- ncol(curr_downsample)

for (i in 1:nrow(curr_downsample)){
  if (curr_downsample[i, columns] == "working_grasso"){
    working_grasso_curr <- cbind(working_grasso_curr, curr_downsample[i, 1:columns-1])
    working_grasso_torque <- cbind(working_grasso_torque, torque_downsample[i, 1:columns-1])
  }
  
  if(curr_downsample[i, columns] == "faulty_grasso"){
    faulty_grasso_curr <- cbind(faulty_grasso_curr, curr_downsample[i, 1:columns-1])
    faulty_grasso_torque <- cbind(faulty_grasso_torque, torque_downsample[i, 1:columns-1])
  }
}

working_grasso_curr <- working_grasso_curr[2:length(working_grasso_curr)]
faulty_grasso_curr <- faulty_grasso_curr[2:length(faulty_grasso_curr)]

working_grasso_torque <- working_grasso_torque[2:length(working_grasso_torque)]
faulty_grasso_torque <- faulty_grasso_torque[2:length(faulty_grasso_torque)]


#mean
mean_working_grasso_curr <- as.numeric(apply(working_grasso_curr,1,mean)) 
mean_faulty_grasso_curr <- as.numeric(apply(faulty_grasso_curr,1,mean)) 
mean_working_grasso_torque <- as.numeric(apply(working_grasso_torque,1,mean)) 
mean_faulty_grasso_torque <- as.numeric(apply(faulty_grasso_torque,1,mean)) 


#variance
var_working_grasso_curr <- as.numeric(apply(working_grasso_curr,1,var)) 
var_faulty_grasso_curr <- as.numeric(apply(faulty_grasso_curr,1,var)) 
var_working_grasso_torque <- as.numeric(apply(working_grasso_torque,1,var)) 
var_faulty_grasso_torque <- as.numeric(apply(faulty_grasso_torque,1,var)) 


#-------------------------------------
#  working_piega1 vs faulty_piega1
#-------------------------------------
working_piega1_curr <- 0
faulty_piega1_curr <- 0

working_piega1_torque <- 0
faulty_piega1_torque <- 0

for (i in 1:nrow(curr_downsample)){
  if (curr_downsample[i, columns] == "working_piega1"){
    working_piega1_curr <- cbind(working_piega1_curr, curr_downsample[i, 1:columns-1])
    working_piega1_torque <- cbind(working_piega1_torque, torque_downsample[i, 1:columns-1])
  }
  
  if(curr_downsample[i, columns] == "faulty_piega1"){
    faulty_piega1_curr <- cbind(faulty_piega1_curr, curr_downsample[i, 1:columns-1])
    faulty_piega1_torque <- cbind(faulty_piega1_torque, torque_downsample[i, 1:columns-1])
  }
}

working_piega1_curr <- working_piega1_curr[2:length(working_piega1_curr)]
faulty_piega1_curr <- faulty_piega1_curr[2:length(faulty_piega1_curr)]

working_piega1_torque <- working_piega1_torque[2:length(working_piega1_torque)]
faulty_piega1_torque <- faulty_piega1_torque[2:length(faulty_piega1_torque)]


#mean
mean_working_piega1_curr <- as.numeric(apply(working_piega1_curr,1,mean)) 
mean_faulty_piega1_curr <- as.numeric(apply(faulty_piega1_curr,1,mean)) 
mean_working_piega1_torque <- as.numeric(apply(working_piega1_torque,1,mean)) 
mean_faulty_piega1_torque <- as.numeric(apply(faulty_piega1_torque,1,mean)) 

#variance
var_working_piega1_curr <- as.numeric(apply(working_piega1_curr,1,var)) 
var_faulty_piega1_curr <- as.numeric(apply(faulty_piega1_curr,1,var)) 
var_working_piega1_torque <- as.numeric(apply(working_piega1_torque,1,var)) 
var_faulty_piega1_torque <- as.numeric(apply(faulty_piega1_torque,1,var)) 




#-------------------------------------
#  working_piega2 vs faulty_piega2
#-------------------------------------
working_piega2_curr <- 0
faulty_piega2_curr <- 0

working_piega2_torque <- 0
faulty_piega2_torque <- 0

for (i in 1:nrow(curr_downsample)){
  if (curr_downsample[i, columns] == "working_piega2"){
    working_piega2_curr <- cbind(working_piega2_curr, curr_downsample[i, 1:columns-1])
    working_piega2_torque <- cbind(working_piega2_torque, torque_downsample[i, 1:columns-1])
  }
  
  if(curr_downsample[i, columns] == "faulty_piega2"){
    faulty_piega2_curr <- cbind(faulty_piega2_curr, curr_downsample[i, 1:columns-1])
    faulty_piega2_torque <- cbind(faulty_piega2_torque, torque_downsample[i, 1:columns-1])
  }
}

working_piega2_curr <- working_piega2_curr[2:length(working_piega2_curr)]
faulty_piega2_curr <- faulty_piega2_curr[2:length(faulty_piega2_curr)]

working_piega2_torque <- working_piega2_torque[2:length(working_piega2_torque)]
faulty_piega2_torque <- faulty_piega2_torque[2:length(faulty_piega2_torque)]

#mean
mean_working_piega2_curr <- as.numeric(apply(working_piega2_curr,1,mean)) 
mean_faulty_piega2_curr <- as.numeric(apply(faulty_piega2_curr,1,mean)) 
mean_working_piega2_torque <- as.numeric(apply(working_piega2_torque,1,mean)) 
mean_faulty_piega2_torque <- as.numeric(apply(faulty_piega2_torque,1,mean)) 


#variance
var_working_piega2_curr <- as.numeric(apply(working_piega2_curr,1,var)) 
var_faulty_piega2_curr <- as.numeric(apply(faulty_piega2_curr,1,var)) 
var_working_piega2_torque <- as.numeric(apply(working_piega2_torque,1,var)) 
var_faulty_piega2_torque <- as.numeric(apply(faulty_piega2_torque,1,var)) 




#-------------------------------------
#  working_rott1 vs faulty_rott1
#-------------------------------------
working_rott1_curr <- 0
faulty_rott1_curr <- 0

working_rott1_torque <- 0
faulty_rott1_torque <- 0

for (i in 1:nrow(curr_downsample)){
  if (curr_downsample[i, columns] == "working_rott1"){
    working_rott1_curr <- cbind(working_rott1_curr, curr_downsample[i, 1:columns-1])
    working_rott1_torque <- cbind(working_rott1_torque, torque_downsample[i, 1:columns-1])
  }
  
  if(curr_downsample[i, columns] == "faulty_rott1"){
    faulty_rott1_curr <- cbind(faulty_rott1_curr, curr_downsample[i, 1:columns-1])
    faulty_rott1_torque <- cbind(faulty_rott1_torque, torque_downsample[i, 1:columns-1])
  }
}

working_rott1_curr <- working_rott1_curr[2:length(working_rott1_curr)]
faulty_rott1_curr <- faulty_rott1_curr[2:length(faulty_rott1_curr)]

working_rott1_torque <- working_rott1_torque[2:length(working_rott1_torque)]
faulty_rott1_torque <- faulty_rott1_torque[2:length(faulty_rott1_torque)]


#mean
mean_working_rott1_curr <- as.numeric(apply(working_rott1_curr,1,mean)) 
mean_faulty_rott1_curr <- as.numeric(apply(faulty_rott1_curr,1,mean)) 
mean_working_rott1_torque <- as.numeric(apply(working_rott1_torque,1,mean)) 
mean_faulty_rott1_torque <- as.numeric(apply(faulty_rott1_torque,1,mean)) 

#variance
var_working_rott1_curr <- as.numeric(apply(working_rott1_curr,1,var)) 
var_faulty_rott1_curr <- as.numeric(apply(faulty_rott1_curr,1,var)) 
var_working_rott1_torque <- as.numeric(apply(working_rott1_torque,1,var)) 
var_faulty_rott1_torque <- as.numeric(apply(faulty_rott1_torque,1,var)) 





#-------------------------------------
#  working_rott2 vs faulty_rott2
#-------------------------------------
working_rott2_curr <- 0
faulty_rott2_curr <- 0

working_rott2_torque <- 0
faulty_rott2_torque <- 0

for (i in 1:nrow(curr_downsample)){
  if (curr_downsample[i, columns] == "working_rott2"){
    working_rott2_curr <- cbind(working_rott2_curr, curr_downsample[i, 1:columns-1])
    working_rott2_torque <- cbind(working_rott2_torque, torque_downsample[i, 1:columns-1])
  }
  
  if(curr_downsample[i, columns] == "faulty_rott1"){
    faulty_rott2_curr <- cbind(faulty_rott2_curr, curr_downsample[i, 1:columns-1])
    faulty_rott2_torque <- cbind(faulty_rott2_torque, torque_downsample[i, 1:columns-1])
  }
}

working_rott2_curr <- working_rott2_curr[2:length(working_rott2_curr)]
faulty_rott2_curr <- faulty_rott2_curr[2:length(faulty_rott2_curr)]

working_rott2_torque <- working_rott2_torque[2:length(working_rott2_torque)]
faulty_rott2_torque <- faulty_rott2_torque[2:length(faulty_rott2_torque)]


#mean
mean_working_rott2_curr <- as.numeric(apply(working_rott2_curr,1,mean)) 
mean_faulty_rott2_curr <- as.numeric(apply(faulty_rott2_curr,1,mean)) 
mean_working_rott2_torque <- as.numeric(apply(working_rott2_torque,1,mean)) 
mean_faulty_rott2_torque <- as.numeric(apply(faulty_rott2_torque,1,mean)) 

#variance
var_working_rott2_curr <- as.numeric(apply(working_rott2_curr,1,var)) 
var_faulty_rott2_curr <- as.numeric(apply(faulty_rott2_curr,1,var)) 
var_working_rott2_torque <- as.numeric(apply(working_rott2_torque,1,var)) 
var_faulty_rott2_torque <- as.numeric(apply(faulty_rott2_torque,1,var))

#---------------
#   charts
#---------------

#install.packages('plotly')

library(plotly)

#means of curr
Faults <- c("grasso", "piega1", "piega2", "rott1", "rott2")
working <- c(mean_working_grasso_curr, mean_working_piega1_curr, mean_working_piega2_curr, mean_working_rott1_curr, mean_working_rott2_curr)
faulty <- c(mean_faulty_grasso_curr, mean_faulty_piega1_curr, mean_faulty_piega2_curr, mean_faulty_rott1_curr, mean_faulty_rott2_curr)
data <- data.frame(Faults, working, faulty)

plot_ly(data, x = ~Faults, y = ~working, type = 'bar', name = 'working', marker = list(color = 'red')) %>%
  add_trace(y = ~faulty, name = 'faulty',marker = list(color = 'grey')) %>%
  layout(yaxis = list(title = 'Mean of Current'),  barmode = 'group')


#means of torque
Faults <- c("grasso", "piega1", "piega2", "rott1", "rott2")
working <- c(mean_working_grasso_torque, mean_working_piega1_torque, mean_working_piega2_torque, mean_working_rott1_torque, mean_working_rott2_torque)
faulty <- c(mean_faulty_grasso_torque, mean_faulty_piega1_torque, mean_faulty_piega2_torque, mean_faulty_rott1_torque, mean_faulty_rott2_torque)
data <- data.frame(Faults, working, faulty)

plot_ly(data, x = ~Faults, y = ~working, type = 'bar', name = 'working', marker = list(color = 'red')) %>%
  add_trace(y = ~faulty, name = 'faulty', marker = list(color = 'grey')) %>%
  layout(yaxis = list(title = 'Mean of Torque'), barmode = 'group')








