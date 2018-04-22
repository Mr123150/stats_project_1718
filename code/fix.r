names <- vector()
dirs <- c("working_grasso", "working_piega1", "working_piega2", "working_rott1", "working_rott2",
          "faulty_grasso", "faulty_piega1", "faulty_piega2", "faulty_rott1", "faulty_rott2")
for(dir in dirs){
  t_dir <- paste("data",dir,sep="/")
  files <- list.files(path=t_dir)
  names <- c(names,as.vector(matrix(dir,ncol=length(files))))
}
data_curr[["cat"]] <- names
