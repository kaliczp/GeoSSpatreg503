library(sp)

data(topo)
head(topo)
class(topo)

coordinates(topo) <- ~x+y
class(topo)
plot(topo)
axis(1)
axis(2)
box()

library(gstat)
hscat(z ~ 1, topo, 0:7)

var.z <- variogram(z ~ 1, topo)
plot(var.z)

var.zcloud <- variogram(z ~ 1, topo, cloud=T)
plot(var.zcloud)

var.res <- variogram(z ~ x + y , topo)
plot(var.res)

data(meuse)
hist(meuse$zinc)
hist(log(meuse$zinc))
boxplot(meuse$zinc)
boxplot(log(meuse$zinc))

coordinates(meuse) <- ~x+y
hscat(log(zinc)~1, meuse, c(0, 80, 120, 250, 500, 1000))

var.b=variogram(log(zinc)~1, meuse)
plot(var.b)

var.cloud=variogram(log(zinc)~1, meuse, cloud=T)
plot(var.cloud)

var.res= variogram(log(zinc)~x+y, meuse)
plot(var.res)