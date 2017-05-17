## Simple linear spatial regression
## Grid creation
x.co <- rep(seq(0,1,0.1),11)
y.co <- rep(seq(0,1,0.1),length = 121, each=11)
plot(x.co,y.co, asp=T)

surf.df <- data.frame(x=x.co, y=y.co)
plot(surf.df, asp=TRUE)

surf.df$z <- 5*surf.df$x - surf.df$y + rnorm(121,sd=0.05)
plot(surf.df) # scatter plot matrix

## Contour plot
surf.mat <- matrix(surf.df$z, nrow=11)
contour(seq(0,1,0.1), seq(0,1,0.1), surf.mat)

surf.lm <- lm(z ~ x + y - 1, data = surf.df)
summary(surf.lm)
plot(surf.lm)

surf.lm <- lm(z ~ x + y +I(x^2) + I(y^2) - 1, data = surf.df)

library(MASS)
data(topo)
## overview of dataset
head(topo)
plot(topo$x, topo$y, asp=T)
library(spatial)

topo.ls <- surf.ls(2, topo)
trsurf <- trmat(topo.ls,0,6.5,0,6.5,50)
# Plot result
eqscplot(trsurf, typ="n")
contour(trsurf, add=T)
points(topo)
text(topo, lab=topo$z,adj=c(0,1))

topo.loess <- loess(z ~ x * y, topo,span=0.25, normalize=F)
topo.ma <- list(x=seq(0,6.5,0.1),y=seq(0,6.5,0.1))
topo.lo <- predict(topo.loess, expand.grid(topo.ma), se=T)
eqscplot(topo.ma, typ="n")
contour(topo.ma$x, topo.ma$y, topo.lo$fit, add=T)
