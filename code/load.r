torque <- c()
curr <- c()
lin <- scan('prova_1.txt')
lin[1:10]
length(lin)
torque <- lin[seq(1,length(lin),by=2)]
curr <- lin[seq(2,length(lin),by=2)]
data <- data.frame(
  torque = torque,
  curr = curr
)
data
