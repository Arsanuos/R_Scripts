pf = read.csv("pseudo_facebook.tsv", sep="\t")
library(ggplot2)
library(gridExtra)

p4 = ggplot(aes(x = age, y = friend_count), data = pf) +
  geom_point(alpha = 1/20, position = position_jitter(0, 0)) +
  coord_trans(y = "sqrt") +
  xlim(c(min(pf$age), 90))

p5 = ggplot(aes(x = age, y = friend_count), data = pf) +
  geom_point(alpha = 1/20) +
  scale_y_sqrt() +
  xlim(c(min(pf$age), 90))

grid.arrange(p4, p5)

p1 = ggplot(diamonds, aes(log10(carat), log10(price))) +
  geom_point()
#  * by transforming the scales
p2 = ggplot(diamonds, aes(carat, price)) +
  geom_point() +
  scale_x_log10() +
  scale_y_log10()
#  * by transforming the coordinate system:
p3 = ggplot(diamonds, aes(carat, price)) +
  geom_point() +
  coord_trans(x = "log10", y = "log10")

grid.arrange(p1, p2, p3)


names(pf)


ggplot(aes(x = age, y = friendships_initiated), data = pf) +
  geom_point(alpha = 1/20, position = position_jitter(h = 0)) +
  coord_trans(y = "sqrt")



  
