#means of curr
Faults <- c("total", "grasso", "piega1", "piega2", "rott1", "rott2")
working <- c(mean_working_curr, mean_working_grasso_curr, mean_working_piega1_curr, mean_working_piega2_curr, mean_working_rott1_curr, mean_working_rott2_curr)
faulty <- c(mean_faulty_curr, mean_faulty_grasso_curr, mean_faulty_piega1_curr, mean_faulty_piega2_curr, mean_faulty_rott1_curr, mean_faulty_rott2_curr)
data <- data.frame(Faults, working, faulty)

plot_ly(data, x = ~Faults, y = ~working, type = 'bar', name = 'working', marker = list(color = 'red')) %>%
  add_trace(y = ~faulty, name = 'faulty',marker = list(color = 'grey')) %>%
  layout(yaxis = list(title = 'Mean of Current', autorange = "reversed"),  barmode = 'group')
