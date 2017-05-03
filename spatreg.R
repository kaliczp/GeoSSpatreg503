## Simple linear spatial regression
## Grid creation
x.co <- rep(seq(0,1,0.1),11)
y.co <- rep(seq(0,1,0.1),length = 121, each=11)
plot(x.co,y.co, asp=T)

surf.df <- data.frame(x=x.co, y=y.co)
plot(surf.df, asp=TRUE)

surf.df$z <- surf.df$x + surf.df$y + rnorm(121,sd=0.05)
plot(surf.df) # scatter plot matrix

## Contour plot
surf.mat <- matrix(surf.df$z, nrow=11)
contour(seq(0,1,0.1), seq(0,1,0.1), surf.mat)

surf.lm <- lm(z ~ x + y, data = surf.df)
summary(surf.lm)
