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
bollocks1<-t.test(withVClarge$len,withVCmedium$len)$conf.int
bollocks2<-t.test(withVClarge$len,withVCsmall$len)$conf.int
bollocks3<-t.test(withVCmedium$len,withVCsmall$len)$conf.int
##and then bollocks[1], bollocks[2] for the win!
dose_comp=matrix(nrow=3,ncol=2)
## This is tedious, but ...
dose_comp[1,1]<-round(bollocks1[1],3)
dose_comp[1,2]<-round(bollocks1[2],3)
dose_comp[2,1]<-round(bollocks2[1],3)
dose_comp[2,2]<-round(bollocks2[2],3)
dose_comp[3,1]<-round(bollocks3[1],3)
dose_comp[3,2]<-round(bollocks3[2],3)
rownames(dose_comp)<-c("High - Medium","High - Low", "Medium - Low")
colnames(dose_comp)<-c("low range","high range")
## The big reveal
dose_comp
