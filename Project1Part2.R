data(ToothGrowth)
summary(ToothGrowth)
withOJ<-subset(ToothGrowth,ToothGrowth$supp=="OJ")
withVC<-subset(ToothGrowth,ToothGrowth$supp=="VC")

## Is there a difference in tooth growth with the two supplements?

## null hypothesis is difference in means is zero, alternative is that difference in means
## is not zero.  With a 95% confidence limit, the null hypothesis cannot be rejected.
## With a 90% confidence limit the null hypothesis can be rejected.
t.test(withOJ$len,withVC$len)

## Is there a real effect on tooth growth with increasing supplement dosage?
## I think this requires six separate subsets, but comparison only between same
## supplement and different dosages.

withOJsmall<-subset(ToothGrowth, ToothGrowth$supp=="OJ" & ToothGrowth$dose==0.5)
withOJmedium<-subset(ToothGrowth, ToothGrowth$supp=="OJ" & ToothGrowth$dose==1.0)
withOJlarge<-subset(ToothGrowth, ToothGrowth$supp=="OJ" & ToothGrowth$dose==2.0)

withVCsmall<-subset(ToothGrowth, ToothGrowth$supp=="VC" & ToothGrowth$dose==0.5)
withVCmedium<-subset(ToothGrowth, ToothGrowth$supp=="VC" & ToothGrowth$dose==1.0)
withVClarge<-subset(ToothGrowth, ToothGrowth$supp=="VC" & ToothGrowth$dose==2.0)

## And then a bunch of statements like
t.test(withVClarge$len,withVCmedium$len)
## All reject at a 95% CI the null hypothesis that the diffence in means is = 0.
## So larger dosages lead to longer teeth, in all cases for this data.
## I suppose this will be best displayed by a table, and I could try to extract
## the relevant information from the function call. $conf returns a 2-element vector,
## along with some text ... check the lecture notes.

## By the way, the knitr lecture is pure bollocks.  However, directed play is learning, so 
## Caffo pulled a Homer on this one.