data(diamonds)
summary(diamonds)
names(diamonds)


library(ggplot2)

ggplot(aes(x = price, y = x), data = subset(diamonds, diamonds$x != 0) ) +
  geom_point() +
  geom_smooth() +
  scale_x_log10() +
  scale_y_log10() +
  geom_smooth()


ggplot(aes(x = price, y = x), data = subset(diamonds, diamonds$x != 0) ) +
  geom_point() +
  geom_smooth()

cor(diamonds$price, diamonds$x)
cor(diamonds$price, diamonds$y)
cor(diamonds$price, diamonds$z)

ggplot(aes(x = price, y = depth), data = diamonds) +
  geom_point() +
  geom_smooth(method = "lm", color = "red")

ggplot(data = diamonds, aes(x = depth, y = price)) + 
  geom_point(alpha = 1/100) +
  scale_x_continuous(breaks = seq(min(diamonds$depth), max(diamonds$depth), 2) )
  
IQR(diamonds$depth)
  
round(cor(diamonds$price, diamonds$depth), digits = 2)  
round(cor(diamonds$depth, diamonds$price), digits = 2)  


ggplot(aes(x = carat, y = price), data = subset(diamonds, diamonds$price < quantile(diamonds$price, .9) & diamonds$carat < quantile(diamonds$carat, .9) ) ) +
  geom_point()+
  geom_smooth()


diamonds$volume = diamonds$x * diamonds$y * diamonds$z
ggplot(aes(x = volume, y = price), data = diamonds) +
  geom_point()

library(dplyr)
count(diamonds$volume == 0)
tmp = subset(diamonds, diamonds$volume > 0 & diamonds$volume < 800) 
round(cor(tmp$price, tmp$volume), digits = 2)

ggplot(aes(x = volume, y = price), data = tmp) + 
  geom_point() +
  geom_smooth()

#       (1) mean_price
#       (2) median_price
#       (3) min_price
#       (4) max_price
#       (5) n

library(dplyr)

groups = group_by(diamonds, clarity)
diamonds.diamondsByClarity = dplyr::summarise(groups,
                                       mean_price = mean(price),
                                       median_price = median(price),
                                       min_price = min(price),
                                       max_price = max(price),
                                       n = n())

diamonds_by_clarity <- group_by(diamonds, clarity)
diamonds_mp_by_clarity <- dplyr::summarise(diamonds_by_clarity, mean_price = mean(price))



diamonds_by_color <- group_by(diamonds, color)
diamonds_mp_by_color <- dplyr::summarise(diamonds_by_color, mean_price = mean(price))


p1 = ggplot(aes(x = clarity, y = mean_price), data = diamonds_mp_by_clarity) +
  geom_bar(stat = "identity")

p2 = ggplot(aes(x = color, y = mean_price), data = diamonds_mp_by_color) +
  geom_bar(stat = "identity")

library(gridExtra)
grid.arrange(p1, p2)



groups = group_by(diamonds, cut)
by_cut = dplyr::summarise(groups, mean_price = mean(price))

ggplot(aes(x = cut, y = mean_price), data = by_cut) +
  geom_bar(stat = "identity")

