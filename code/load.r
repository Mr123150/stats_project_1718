# # #
# MANUAL
# 1. place data into folder "data" (once per work). each subfolder should contain only data files
# 2. set folder "code" of project as working directory (setwd)
# 3. run code to fill dataframes
# 4. ???
# 5. PROFIT
# # #
torque <- matrix()
curr <- matrix()
name_col <- vector()
size <- c()
dirs <- c("working_grasso", "working_piega1", "working_piega2", "working_rott1", "working_rott2",
         "faulty_grasso", "faulty_piega1", "faulty_piega2", "faulty_rott1", "faulty_rott2")
#dirs <- c("working_grasso")
for(dir in dirs){
  t_dir <- paste("data",dir,sep="/")
  files <- list.files(path=t_dir)
  for(file in files){
    lin <- scan(paste(t_dir,file,sep="/"))
    t_torque <- lin[seq(1,length(lin),by=2)]
    t_curr <- lin[seq(2,length(lin),by=2)]
    if(is.na(torque[1,1])){
      torque <- matrix(t_torque,nrow=1)
      curr <- matrix(t_curr,nrow=1)
    }
    else{
      if(length(t_torque)>=dim(torque)[2]){
        torque <- rbind(torque,t_torque[1:dim(torque)[2]])
        curr <- rbind(curr,t_curr[1:dim(torque)[2]])
      }
      else{
        torque <- rbind(torque[,1:length(t_torque)],t_torque)
        curr <- rbind(curr[,1:length(t_torque)],t_curr)
      }
    }
    size <- c(size, length(t_torque))
  }
  if(is.na(name_col[1])){
    name_col <- as.vector(matrix(dir,ncol=length(size)))
  }
  else{
    name_col <- c(name_col, as.vector(matrix(dir,ncol=length(size))))
  }
}
col_names <- vector(mode="character", length=dim(torque)[2])
for(i in 1:length(col_names)){
  col_names[i] <- paste("t",i,sep="")
}
data_torque <- as.data.frame(torque, row.names=name_col, col.names = col_names)
data_curr <- as.data.frame(curr, row.names=name_col, col.names = col_names)