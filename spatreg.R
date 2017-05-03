## Simple linear spatial regression
## Grid creation
x.co <- rep(seq(0,1,0.1),11)
y.co <- rep(seq(0,1,0.1),length = 121, each=11)
plot(x.co,y.co, asp=T)

surf.df <- data.frame(x.co,y.co)
plot(surf.df, asp=TRUE)
