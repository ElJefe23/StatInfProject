longdata=numeric(length=1500)
for (i in 1:1500) { longdata[i]=mean(rexp(40,0.2))}
mld<-mean(longdata)
## Compare to 5.00

sdld<-sd(longdata)
## compare to 5/sqrt(40)

hist(longdata)
abline(v=mean(longdata),col="red",lwd=3)
abline(v=5.0,col="blue",lwd=3)
## have to jazz it up a bit, with a line indicating the calculated mean

## Proof of normality will be to take SD slices and compare symmetry
norm_comp=matrix(nrow=5,ncol=2)
for (j in 1:5) { 
  norm_comp[j,1]<- mean(longdata < (mld - (j*0.5)*sdld))
  norm_comp[j,2]<- mean((mld + (j*0.5)*sdld) < longdata)
}

## This code is to calculate the "coverage" of the assumed CLT 95% CI.
## For the first iteration of the program it evaluated to 94.7%
ul<-mean(longdata)+1.96*sd(longdata)
ll<-mean(longdata)-1.96*sd(longdata)
cover<-mean(ll<longdata & ul>longdata)