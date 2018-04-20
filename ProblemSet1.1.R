library(ggplot2)
summary(diamonds)
nrow(diamonds)
ncol(diamonds)
str(diamonds)

ggplot(aes(x = price), data = diamonds) +
  geom_histogram(color = "black", fill = "yellow")

summary(diamonds$price)
nrow(subset(diamonds, diamonds$price >= 15000))

ggplot(aes(x = price), data = diamonds) +
  geom_histogram(color = "black", fill = "yellow", binwidth = 1000) +
  scale_x_continuous(breaks = seq(0, 10000, 200)) +
  xlim(c(0, 10000))

table(diamonds$price) == max(table(diamonds$price))
which(table(diamonds$price) == max(table(diamonds$price)))
names(which(table(diamonds$price) == max(table(diamonds$price))))
which.max(table(diamonds$price))

max(diamonds$price)
min(diamonds$price)

ggplot(aes(x = price), data = diamonds) +
  geom_histogram(color = "black", fill = "green") +
  facet_wrap(~cut, ncol = 2) + 
  scale_x_continuous(limits  = c(300,400) ,breaks = seq(300, 400, 20))

by(diamonds$price, diamonds$cut, summary)

ggplot(aes(x = price), data = diamonds) +
  geom_histogram(color = "black", fill = "green") +
  facet_wrap(~cut, ncol = 2)


ggplot(aes(x = price), data = diamonds) +
  geom_histogram(color = "black", fill = "green") +
  facet_wrap(~cut, ncol = 2, scales = "free_y" ) 

names(diamonds)

bin = 2 * IQR(diamonds$price) * nrow(subset(diamonds, !is.na(price))) ^ (-1/3)

ggplot(aes(x = price/carat), data = diamonds) +
  geom_histogram(color = "black", fill = "yellow", binwidth = floor(bin))


ggplot(aes(x = price/carat), data = diamonds) +
  geom_histogram(color = "black", fill = "yellow") +
  scale_x_log10()


ggplot(aes(y = price, x = cut) , data = diamonds) + 
  geom_boxplot() +
  coord_cartesian(ylim = c(0, 9000))
by(diamonds$price, diamonds$cut, summary)

x <- subset(diamonds$price, diamonds$color == "D")
IQR(subset(diamonds$price, diamonds$color == "D"))
quantile(x, 1/4)
quantile(x, 3/4)

x <- subset(diamonds$price, diamonds$color == "J")
IQR(x)
quantile(x, 1/4)
quantile(x, 3/4)


ggplot(aes(x = color, y = price/carat), data = diamonds) +
  geom_boxplot() +
  coord_cartesian(ylim = c(0, 6000))

ggplot(aes(x = carat), data = diamonds) +
  geom_freqpoly(bins = 1000)

names(diamonds)
head(diamonds)

which(table(diamonds$carat) > 2000)
