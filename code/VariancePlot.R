#variance of curr
Faults <- c("total", "grasso", "piega1", "piega2", "rott1", "rott2")
working <- c(var_working_curr, var_working_grasso_curr, var_working_piega1_curr, var_working_piega2_curr, var_working_rott1_curr, var_working_rott2_curr)
faulty <- c(var_faulty_curr, var_faulty_grasso_curr, var_faulty_piega1_curr,var_faulty_piega2_curr, var_faulty_rott1_curr, var_faulty_rott2_curr)
data <- data.frame(Faults, working, faulty)

plot_ly(data, x = ~Faults, y = ~working, type = 'bar', name = 'working', marker = list(color = 'red')) %>%
  add_trace(y = ~faulty, name = 'faulty',marker = list(color = 'grey')) %>%
  layout(yaxis = list(title = 'Variance of Current'),  barmode = 'group')

#variance of torque
Faults <- c("total", "grasso", "piega1", "piega2", "rott1", "rott2")
working <- c(var_working_torque, var_working_grasso_torque, var_working_piega1_torque, var_working_piega2_torque, var_working_rott1_torque, var_working_rott2_torque)
faulty <- c(var_faulty_torque, var_faulty_grasso_torque, var_faulty_piega1_torque, var_faulty_piega2_torque, var_faulty_rott1_torque, var_faulty_rott2_torque)
data <- data.frame(Faults, working, faulty)


plot_ly(data, x = ~Faults, y = ~working, type = 'bar', name = 'working', marker = list(color = 'red')) %>%
  add_trace(y = ~faulty, name = 'faulty', marker = list(color = 'grey')) %>%
  layout(yaxis = list(title = 'Variance of Torque'), barmode = 'group')


