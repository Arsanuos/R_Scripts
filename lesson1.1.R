getwd()
pf = read.csv("pseudo_facebook.tsv", sep="\t")
library(ggplot2)
library(gridExtra)

names(pf)
ggplot(aes(x = friend_count), data = pf) +  geom_histogram() +
  scale_x_continuous(limits = c(0, 1000)) +
  facet_grid(~gender)

table(pf$gender)
by(pf$friend_count, pf$gender, summary)


ggplot(aes(x = tenure/365), data = pf) +
  geom_histogram(binwidth = 1, color = 'black', fill = '#F79420') +
  xlab("number of years") +
  ylab("count")

ggplot(aes(x = age), data = pf) +
  geom_histogram(binwidth = 1, color = "black", fill = "yellow")+
  scale_x_continuous(breaks = seq(0, 113, 1))

p1 <- ggplot(aes(x = friend_count), data = pf) +
      geom_histogram(color = "black", fill = "green") 

p2 <- ggplot(aes(x = friend_count), data = pf) +
      geom_histogram(color = "black", fill = "green") +
      scale_x_log10() + 
      xlab("log10")

p3 <- ggplot(aes(x = friend_count), data = pf) +
      geom_histogram(color = "black", fill = "green") +
      scale_x_sqrt() +
      xlab("Sqrt")
grid.arrange(p1, p2, p3)


p4 = ggplot(aes(x = www_likes) , data = subset(pf, !is.na(gender))) +
  geom_freqpoly(aes(color = gender)) +
  scale_x_continuous() +
  scale_x_log10()

  p5 = ggplot(aes(x = www_likes) , data = subset(pf, !is.na(gender))) +
  geom_freqpoly(aes(color = gender)) +
  scale_x_log10()
grid.arrange(p4, p5)

by(pf$www_likes, pf$gender, sum)

#worng don't do that.
ggplot(aes(y = friend_count, x = gender), data = subset(pf, !is.na(gender))) +
  geom_boxplot() +
  ylim(c(0, 200))


ggplot(aes(y = friend_count, x = gender), data = subset(pf, !is.na(gender))) +
  geom_boxplot() +
  scale_y_continuous(breaks = seq(0, 1000, 50)) +
  coord_cartesian(ylim = c(0, 1000))

by(pf$friend_count, pf$gender, summary)

summary(pf$mobile_likes > 0)
pf$check_in = ifelse(pf$mobile_likes > 0, 1, 0)
pf$check_in = factor(pf$check_in) 
summary(pf$check_in)
sum(pf$check_in == 0)/length(pf$check_in)
