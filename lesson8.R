summary(diamonds)

library(ggplot2)

ggplot(aes(x = price), data = diamonds) +
  geom_histogram(aes(fill = cut)) +
  scale_fill_brewer(type = 'qual') +
  scale_x_log10() +
  facet_wrap(~color)

ggplot(aes(x = table, y = price), data = diamonds) + 
  geom_point(aes(color = cut)) + 
  scale_color_brewer(type = 'qual') + 
  scale_x_continuous(breaks = seq(50, 90, 2), limits = c(50, 90))


ggplot(aes(x = table, y = price), data = subset(diamonds, cut == 'Ideal') ) + 
  geom_point(aes(color = cut)) + 
  scale_color_brewer(type = 'qual') + 
  scale_x_continuous(breaks = seq(50, 90, 2), limits = c(50, 90))

ggplot(aes(x = table, y = price), data = subset(diamonds, cut == 'Premium') ) + 
  geom_point(aes(color = cut)) + 
  scale_color_brewer(type = 'qual') + 
  scale_x_continuous(breaks = seq(50, 90, 2), limits = c(50, 90))

by(diamonds$table, diamonds$cut, summary)

diamonds$volume = diamonds$x * diamonds$y * diamonds$z

diamonds$clarity = factor(diamonds$clarity, c("IF", "VVS1", "VVS2", "VS1", "VS2", "SI1", "SI2", "I1"))

ggplot(aes(x = volume, y = price), data = subset(diamonds, volume < quantile(diamonds$volume, .9))) + 
  geom_point(aes(color = clarity)) +
  scale_color_brewer(type = 'div', direction = -1) +
  scale_y_log10() +
  scale_x_continuous(limits = c(1, quantile(diamonds$volume, .9)))

library(dplyr)
pf$prop_initiated = ifelse(pf$friend_count != 0, (pf$friendships_initiated / pf$friend_count) , 0)

ggplot(aes(x = tenure, y = prop_initiated), data = subset(pf, pf$prop_initiated != 0) ) +
  geom_line(aes(color = year_joined.bucket), stat = 'summary', fun.y = median)

#why 2012-2014 is the highest group.
ggplot(aes(x = tenure, y = prop_initiated), data = subset(pf, pf$prop_initiated != 0) ) +
  geom_line(aes(color = year_joined.bucket), stat = 'summary', fun.y = median) +
  geom_smooth()

by(pf$friendships_initiated, pf$year_joined.bucket, summary)
by(pf$friend_count, pf$year_joined.bucket, summary)


ggplot(aes(x = cut, y = price / carat), data = diamonds) + 
  geom_point(aes(color = color), position = position_jitter()) + 
  scale_color_brewer(type = 'div') +
  facet_wrap(~clarity)
