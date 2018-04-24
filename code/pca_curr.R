# set&load dataset
# used downsampled data as computations for the whole dataset wasn't successfull due to pc memory
setwd("~/Documents/code")
options(max.print = 999999)
load("curr_downsample.RData")


# dividing into working and faulty curr
working_curr <- 0
faulty_curr <- 0
columns <- ncol(curr_downsample)
rows <- nrow(curr_downsample)

for (i in 1:nrow(curr_downsample)){
  if ((curr_downsample[i, columns] == "working_grasso") || (curr_downsample[i, columns] == "working_piega1") || 
      + (curr_downsample[i, columns] == "working_rott1") || (curr_downsample[i, columns] == "working_piega2") ||
      + (curr_downsample[i, columns] == "working_rott2"))
    {
    working_curr <- rbind(working_curr, curr_downsample[i, 1:columns-1])
    }
  
  if((curr_downsample[i, columns] == "faulty_grasso") || (curr_downsample[i, columns] == "faulty_piega1") || 
  + (curr_downsample[i, columns] == "faulty_rott1") || (curr_downsample[i, columns] == "faulty_piega2") ||
  + (curr_downsample[i, columns] == "faulty_rott2"))
{
  faulty_curr <- rbind(faulty_curr, curr_downsample[i, 1:columns-1])
  }
}

# downscaled number of obs in working_curr manually as they are more than faults, 
# and in my optinion here mean-pads can't be used as for variables - not sure 
working_curr <- working_curr[5:nrow(working_curr), 2:length(working_curr)]  
faulty_curr <- faulty_curr[2:length(faulty_curr)]

# scatterplotting working vs faulty



#____________________________________________________________________
# R3 spacing
#____________________________________________________________________

# features for R3: mean, median, var
mean_working_curr <- as.numeric(apply(working_curr,1,mean))
mean_faulty_curr <- as.numeric(apply(faulty_curr,1,mean))

var_working_curr <- as.numeric(apply(working_curr,1,var)) 
var_faulty_curr <- as.numeric(apply(faulty_curr,1,var)) 

median_working_curr <- as.numeric(apply(working_curr,1,median)) 
median_faulty_curr <- as.numeric(apply(faulty_curr,1,median))

# scatter-plotting R3 features



#____________________________________________________________________
# PCA
#____________________________________________________________________

# by cov and corr matrices we got complex eigenvalues, 
# suppose here was problem that it doesn't use  Chol.decomp also princomp doesn't work 
# as number of vars>>obs
cov_working_faulty_curr <- cov(working_curr, faulty_curr, "everything")
cor_working_faulty_curr <- cor(working_curr, faulty_curr, "everything")

#PCA by prcomp and standartized data as vars>>obs
curr_stand <- scale(curr_downsample[1:rows, 1:columns-1])
pca_curr <- prcomp(curr_stand,scale=T)
summary(pca_curr)
screeplot(pca_curr, type="lines",col=2)

# scatter-plotting PCA

