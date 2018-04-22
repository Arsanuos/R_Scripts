pf = read.csv("/media/arsanuos/42096389-e9a4-4305-beb5-98c32730190b/R programming/matrials/eda-course-materials/lesson3/pseudo_facebook.tsv", sep="\t")
library(dplyr)

pf.fc_by_age_gender = pf %>%
                      filter(!is.na(gender) & !is.na(age)) %>%
                      group_by(age, gender) %>%
                      summarise(mean_friend_count = mean(friend_count),
                                median_friend_count = median(friend_count),
                                n = n())
ungroup(pf.fc_by_age_gender)


ggplot(aes(x = age, y = median_friend_count), data = pf.fc_by_age_gender) +
  geom_line(aes(color = gender))


library(tidyr)

pf.fc_by_age_gender_wide = pf.fc_by_age_gender %>%
                           select(age, gender, median_friend_count) %>%
                           spread(gender, median_friend_count)
head(pf.fc_by_age_gender_wide)


library(ggplot2)

ggplot(aes(x = age, y = female/male), data = pf.fc_by_age_gender_wide) +
  geom_line() +
  geom_hline(yintercept = 1, linetype = 2) +
  geom_smooth()

pf$year_joined = (2014 - ceiling(pf$tenure / 365))
head(pf$year_joined)


pf$year_joined.bucket = cut(pf$year_joined, c(2004, 2009, 2011,2012, 2014))


ggplot(aes(x = age, y = friend_count), data = subset(pf, !is.na(year_joined.bucket)) ) +
  geom_line(aes(color = year_joined.bucket), stat = 'summary', fun.y = median) +
  geom_smooth()



ggplot(aes(x = age, y = friend_count), data = subset(pf, !is.na(year_joined.bucket)) ) +
  geom_line(aes(color = year_joined.bucket), stat = 'summary', fun.y = mean) +
  geom_line(stat = 'summary', fun.y = mean, linetype = 2)

tmp = subset(pf, tenure != 0)

rate = tmp$friend_count / tmp$tenure
summary(rate)

summary(pf$friendships_initiated / pf$tenure)
table(pf$friendships_initiated / pf$tenure)

ggplot(aes(x = tenure, y = friendships_initiated / tenure), data = subset(pf, tenure > 0))  +
  geom_line(aes(color = year_joined.bucket), stat = 'summary', fun.y = mean) 


ggplot(aes(x = tenure, y = friendships_initiated / tenure), data = subset(pf, tenure > 0))  +
  geom_smooth(aes(color = year_joined.bucket))
