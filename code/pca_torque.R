# set&load dataset
# used downsampled data as computations for the whole dataset wasn't successfull due to pc memory
setwd("~/Documents/code")
options(max.print = 999999)
load("torque_downsample.RData")


# dividing into working and faulty curr
working_torque <- 0
faulty_torque <- 0
columns <- ncol(torque_downsample)
rows <- nrow(torque_downsample)

for (i in 1:nrow(torque_downsample)){
  if ((torque_downsample[i, columns] == "working_grasso") || (torque_downsample[i, columns] == "working_piega1") || 
      + (torque_downsample[i, columns] == "working_rott1") || (torque_downsample[i, columns] == "working_piega2") ||
      + (torque_downsample[i, columns] == "working_rott2"))
  {
    working_torque <- rbind(working_torque, torque_downsample[i, 1:columns-1])
  }
  
  if((torque_downsample[i, columns] == "faulty_grasso") || (torque_downsample[i, columns] == "faulty_piega1") || 
     + (torque_downsample[i, columns] == "faulty_rott1") || (torque_downsample[i, columns] == "faulty_piega2") ||
     + (torque_downsample[i, columns] == "faulty_rott2"))
  {
    faulty_torque <- rbind(faulty_torque, torque_downsample[i, 1:columns-1])
  }
}

# downscaled number of obs in working_curr manually as they are more than faults, 
# and in my optinion here mean-pads can't be used as for variables - not sure 
working_torque <- working_torque[5:nrow(working_torque), 2:length(working_torque)]  
faulty_torque <- faulty_torque[2:length(faulty_torque)]

# scatterplotting working vs faulty



#____________________________________________________________________
# R3 spacing
#____________________________________________________________________

# features for R3: mean, median, var
mean_working_torque <- as.numeric(apply(working_torque,1,mean))
mean_faulty_torque <- as.numeric(apply(faulty_torque,1,mean))

var_working_torque <- as.numeric(apply(working_torque,1,var)) 
var_faulty_torque <- as.numeric(apply(faulty_torque,1,var)) 

median_working_torque <- as.numeric(apply(working_torque,1,median)) 
median_faulty_torque <- as.numeric(apply(faulty_torque,1,median))

# scatter-plotting R3 features



#____________________________________________________________________
# PCA
#____________________________________________________________________

# by cov and corr matrices we got complex eigenvalues, 
# suppose here was problem that it doesn't use  Chol.decomp also princomp doesn't work 
# as number of vars>>obs
cov_working_faulty_torque <- cov(working_torque, faulty_torque, "everything")
cor_working_faulty_torque <- cor(working_torque, faulty_torque, "everything")

#PCA by prcomp and standartized data as vars>>obs
torque_stand <- scale(torque_downsample[1:rows, 1:columns-1])
pca_torque <- prcomp(torque_stand,scale=T)
summary(pca_torque)
screeplot(pca_torque, type="lines",col=2)

# scatter-plotting PCA

