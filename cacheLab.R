cache = read.csv("readings.csv")
names(cache)

library(ggplot2)

ggplot(aes(x = set), data = cache) +
  geom_line(aes(y = hit), color = 'green') +
  geom_point(aes(y = hit)) +
  xlim( c(min(cache$set), max(cache$set)) ) +
  scale_y_continuous(breaks = seq(0, 100, 5)) +
  scale_x_continuous(breaks = seq(0, 256, 25)) +
  facet_wrap(~size)

ggsave("hit_rate.png")

ggplot(aes(x = set), data = cache) +
  geom_line(aes(y = miss), color = 'red') +
  geom_point(aes(y = miss)) +
  xlim( c(min(cache$set), max(cache$set)) ) +
  scale_y_continuous(breaks = seq(0, 100, 5)) +
  scale_x_continuous(breaks = seq(0, 256, 25)) +
  facet_wrap(~size)
ggsave("miss_rate.png")
