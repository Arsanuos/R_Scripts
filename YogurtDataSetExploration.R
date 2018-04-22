yo = read.csv("/media/arsanuos/42096389-e9a4-4305-beb5-98c32730190b/R programming/matrials/eda-course-materials/lesson5/yogurt.csv")
str(yo)
yo$id = factor(yo$id)
str(yo)
library(ggplot2)
ggplot(aes(x = price), data = yo) +
  geom_histogram(binwidth = 10)

summary(yo)

length(unique(yo$price))

library(dplyr)
