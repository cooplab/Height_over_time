#pdf(file="heights.pdf")
png(file="heights.png",  width = 600, height = 600)
heights<-read.csv("heights_from_Hatton_paper.csv")
heights<-heights[,colnames(heights)!="Period.1"]
heights<-heights[!apply(heights,1,function(x){all(is.na(x) | x=="")}),]
par(mar=c(4.5,3,0,0))
plot(c(1,28),range(heights[,-1],na.rm=TRUE),type="n",ylab="",xlab="",axes=FALSE)
text(x=10,y=180, "data from Hatton and Bray \n Long Run Trends in the Heights\n of European Men, 19th-20th Centuries")

mtext(side=2,line=2,"Height, cm")
axis(side=2)
axis(side=1,at=1:nrow(heights),labels=heights[,1],las=2,cex.axis=0.75,line=0)
box()
npop<-ncol(heights[,-1]);
my.cols<-sample(rainbow(npop))
sapply(1:npop,function(i){lines(heights[,-1][,i],col=my.cols[i],lwd=2)})
text(x=rep(27,npop),y=heights[nrow(heights),-1],colnames(heights[,-1]),col=my.cols)
dev.off()