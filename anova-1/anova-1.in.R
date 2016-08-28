# load necessary sqlite driver
library("RSQLite")

# get db connection
con = dbConnect(SQLite(), "anova-1.sqlite")

# get data as a 1d vector
r = c(t(as.matrix(dbGetQuery(con, 'select item1, item2, item3 from SALES'))))

# create factor vectors
f1 = c("Item1", "Item2", "Item3")
f2 = c("East", "West")
k1 = length(f1)
k2 = length(f2)
n = 4

# create treatments
tm1 = gl(k1, 1, n*k1*k2, factor(f1))
tm2 = gl(k2, n*k1, n*k1*k2, factor(f2))

# get ANOVA of each treatment and interaction between treatments
av = aov(r ~ tm1 * tm2)

# write output to anova-1.out.txt
sink("anova-1.out.txt", append=FALSE, split=TRUE)
summary(av)
