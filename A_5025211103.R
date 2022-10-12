#======Soal 1======
# Poin A
p = 0.2
x = 3
dgeom(3, 0.2)

# Poin B
mean(rgeom(n = 10000, prob = p) == 3)

#Poin C
hist(rgeom(n = 10000, prob = p), main ="Histogram Distribusi Geometrik")


n = 20
p = 0.2
n = 20
p = 0.2

# Poin A
x = 4

#======Soal 2====== 
# A
probability = dbinom(x, n, prob = p, log = FALSE)
probability

# B
hist(rbinom(x, n, prob = p), xlab = "sembuh", ylab = "frekuensi", main = "Histogram Distribusi Binomial")

# C
mean = n * (prob = p)
mean

variance = n * (prob = p) * (1 - (prob = p))
variance

#======Soal 3======
# A
x = 6
lambda = 4.5
prob = dpois(x, lambda)
prob

# B

# C
mean = variance = lambda
mean
variance

# 4
# A
x = 2
v = 10
dchisq(x,v)

# B
n = 100
hist(rchisq(n, v), xlab = "X", ylab = "V", main = "Grafik Histogram")

# C
mean = v
mean

variance = 2 * v
variance


#======Soal 5======
# A
set.seed(1)
lambda = 3
prob = dexp(1, lambda, log = FALSE)
prob

# B
set.seed(1)
hist(rexp(10), main = "Histogram Exponential 10 bilangan random")
hist(rexp(100), main = "Histogram Exponential 100 bilangan random")
hist(rexp(1000), main = "Histogram Exponential 1000 bilangan random")
hist(rexp(10000), main = "Histogram Exponential 10000 bilangan random")

# C
set.seed(1)
n = 100
mean = mean(rexp(n, rate = lambda))
mean

set.seed(1)
n = 100
variance = (sd(rexp(n, rate = lambda))) ^ 2
variance


#======Soal 6======
# A

set.seed(1)
n = 100
mean = 50
sd = 8

data <- rnorm(n, mean, sd)
data
summary(data)

x1 = runif(1, min = min(data), max = mean)
x2 = runif(1, min = mean, max = max(data))

prob1 <- pnorm(x1, mean, sd)
prob2 <- pnorm(x2, mean, sd)
prob1
prob2

plot(data)

prob = plot(prob2-prob1)



# B
breaks = 50
hist(data, breaks, main = "naufalqii")

# C
variance = (sd(data)) ^ 2
variance


