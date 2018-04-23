yo = read.csv("yogurt.csv")
str(yo)
yo$id = factor(yo$id)
str(yo)
library(ggplot2)
ggplot(aes(x = price), data = yo) +
  geom_histogram(binwidth = 10)

summary(yo)

length(unique(yo$price))

library(dplyr)

yo = transform(yo, all.purchases = strawberry + blueberry + pina.colada + plain + mixed.berry)


ggplot(aes(x = time, y = price), data = yo) + 
  geom_point() +
  scale_y_continuous(breaks = seq(0, max(yo$price) + 10, 1))

#Sampling and good plotting

set.seed(4000)
sample.ids = sample(levels(yo$id), 16)

ggplot(aes(x = time, y = price), data = subset(yo, yo$id %in% sample.ids) )  +
  geom_line() +
  geom_point(aes(size = all.purchases), pch = 1) +
  facet_wrap(~ id)
#the answer to why circles from 1 to 6.
with(subset(yo, yo$id %in% sample.ids), unique(all.purchases))


#many scatterplot
library(GGally)

pf = read.csv("pseudo_facebook.tsv", sep="\t")
theme_set(theme_minimal(20))
set.seed(1836)
pf_subset =  pf[, c(2:15)]
names(pf_subset)
ggpairs(pf_subset[sample.int(nrow(pf_subset), 1000), ], showStrips = FALSE)
ggsave('test.png', width = 40, height = 20, limitsize = FALSE)

#this may take a while.
nci = read.table('nci.tsv')
colnames(nci) = c(1:ncol(nci))
set.seed(1836)
ggpairs(nci[sample.int(nrow(nci) ,1000), ])
