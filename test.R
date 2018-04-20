reddit <- read.csv("/media/arsanuos/42096389-e9a4-4305-beb5-98c32730190b/R programming/matrials/eda-course-materials/lesson2/reddit.csv")
head(reddit)
str(reddit)
levels(reddit$age.range)
library(ggplot2)
t <- factor(reddit$age.range, levels(reddit$age.range))
t
qplot(data = reddit, x = t)
