data(ToothGrowth)
withOJ<-subset(ToothGrowth,ToothGrowth$supp="OJ")
withVC<-subset(ToothGrowth,ToothGrowth$supp="VC")

## Is there a difference in tooth growth with the two supplements?

## null hypothesis is difference in means is zero, alternative is that difference in means
## is not zero.  With a 95% confidence limit, the null hypothesis cannot be rejected.
## With a 90% confidence limit the null hypothesis can be rejected.
t.test(withOJ$len,withVC$len)