library(sp)

data(topo)
head(topo)
class(topo)

coordinates(topo) <- ~x+y
class(topo)
plot(topo)
axis(1)
axis(2)
