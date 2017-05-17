## kriging with spatial package
library(spatial)
library(MASS)
data(topo)
topo.ls <- surf.ls(2, topo)
correlogram(topo.ls, 25) #let's change "nint" arg.

d <- seq(0, 7, 0.3)
lines(d, expcov(d, 0.7))
lines(d, gaucov(d, 1.0, 0.3), lty = 3)

variogram(topo.ls, 25)

### Kriging
## generalised least squares with covariance model
topo.kr <- surf.gls(2, expcov, topo, d=0.7)
correlogram(topo.kr,25)
variogram(topo.kr,25)

