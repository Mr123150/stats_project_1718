torque <- matrix()
curr <- matrix()
size <- c()
dir <- "data/working_grasso"
files <- list.files(path=dir)
for(file in files){
  lin <- scan(paste(dir,file,sep="/"))
  t_torque <- lin[seq(1,length(lin),by=2)]
  t_curr <- lin[seq(2,length(lin),by=2)]
  #torque[[file]] <- t_torque
  #curr[[file]] <- t_curr
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
trim <- min(size)
col_names <- vector(mode="character", length=dim(torque)[2])
for(i in 1:length(col_names)){
  col_names[i] <- paste("t",i,sep="")
}
data_torque <- as.data.frame(torque, row.names=files, col.names = col_names)
data_curr <- as.data.frame(curr, row.names=files, col.names = col_names)