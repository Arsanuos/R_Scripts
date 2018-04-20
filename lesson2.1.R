pf = read.csv("/media/arsanuos/42096389-e9a4-4305-beb5-98c32730190b/R programming/matrials/eda-course-materials/lesson3/pseudo_facebook.tsv", sep="\t")
library(dplyr)

groups <- group_by(pf, age)
pf.group_by_age <- summarise(groups,
                             friend_count_mean = mean(friend_count),
                             friend_count_median = median(friend_count),
                             n = n())
pf.groupb_by_age = arrange(pf.group_by_age, age)
head(pf.group_by_age)


library(ggplot2)

ggplot(aes(x = age, y = friend_count_mean), data = pf.group_by_age) +
  geom_line() +
  coord_trans()


ggplot(aes(x = age, y = friend_count), data = pf) +
  geom_point(color = "orange", alpha = .05, position =  position_jitter(h = 0)) +
  geom_line(stat = 'summary', fun.y = quantile, fun.args = list(probs = .1), color = "blue", linetype = 2) +
  geom_line(stat = 'summary', fun.y = mean) + 
  geom_line(stat = 'summary', fun.y = median, color = "blue") +
  geom_line(stat = 'summary', fun.y = quantile, fun.args = list(probs = .9), color = "blue", linetype = 2) +
  geom_smooth(method = 'lm', color = 'red') + 
  coord_cartesian(ylim = c(0, 1000), xlim = c(13, 90))


cor.test(pf$age, pf$friend_count)



ggplot(aes(x = log10(www_likes_received), y = log10(likes_received)), data = pf) +
  geom_point(position =  position_jitter(h = 0, w = 0), color = "orange", alpha= .02) +
  geom_line(stat = 'summary', fun.y = mean, color = 'blue') +
  geom_line(stat = 'summary', fun.y = median, color ='green') +
  geom_line(stat = 'summary', fun.y = quantile, fun.args = list(probs = .1) , color = 'green', linetype = 2)

ggplot(aes(x = (www_likes_received), y = (likes_received)), data = pf) +
  geom_line()

cor.test(pf$www_likes_received, pf$likes_received)

ggplot(aes(x = (www_likes_received), y = (likes_received)), data = pf) +
  geom_point(position =  position_jitter(h = 0, w = 0), color = "orange") +
  xlim(0, quantile(pf$www_likes_received, .95)) +
  ylim(0, quantile(pf$likes_received, .95)) +
  geom_line(stat = 'summary', fun.y = mean, color = 'blue') +
  geom_smooth(method = 'lm', color = 'red') +
  geom_smooth(method = 'gam', color = 'yellow')


library(alr3)
data(Mitchell)
summary(Mitchell)
ggplot(aes(y = Temp, x = Month %% 12), data = Mitchell) +
  geom_point() 

ggplot(aes(y = Temp, x = Month), data = Mitchell) +
  geom_line() +
  scale_x_continuous(breaks = seq(0, max(Mitchell$Month), 12))

ggplot(aes(y = Temp, x = Month), data = Mitchell) +
  geom_point()

cor.test(Mitchell$Temp, Mitchell$Month)

library(energy)
x <- seq(0, 4*pi, pi/20)
y <- cos(x)
qplot(x = x, y = y)
dcor.ttest(x, y)


pf$dob_all =  (Sys.Date() - as.Date(paste(pf$dob_year, pf$dob_month, pf$dob_day, sep = "-"))) / 30
sort(pf$dob_all)
ggplot(aes(x = dob_all, y = ))

                         