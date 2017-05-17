## kriging with spatial package
library(spatial)
library(MASS)
data(topo)
topo.ls <- surf.ls(2, topo)
correlogram(topo.ls, 70) #let's change "nint" arg.
