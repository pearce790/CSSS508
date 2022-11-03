library(ggplot2)
library(dplyr)

#### Why Loops? ####
# mean1 <- mean(swiss$Fertility)
# mean2 <- mean(swiss$Agriculture)
# mean3 <- mean(swissExamination)
# mean4 <- mean(swiss$Fertility)
# mean5 <- mean(swiss$Catholic)
# mean5 <- mean(swiss$Infant.Mortality)
# c(mean1, mean2 mean3, mean4, mean5, man6)



means <- numeric(ncol(swiss))
for(i in 1:ncol(swiss)){
  means[i] <- mean(swiss[,i])
}
data.frame(Variable=names(swiss),Mean=means)

####  `for()` Loops ####


for(i in 1:5) {
  # inside for, output won't show up without print()
  print(i^2) 
}

for(i in 1:3) {
  print(i^2) 
}

i <- 1
print(i^2) 
i <- 2
print(i^2)
i <- 3
print(i^2)
  

some_letters <- letters[4:6] # Vector of letters d,e,f
for(i in some_letters) {
    print(i)
}
i # in R, this will exist outside of the loop!

some_letters <- letters[4:6]
for(a in seq_along(some_letters)) {
  print(paste0("Letter ", a, ": ", some_letters[a]))
}
a # The object `a` contains the number of the last iteration

iters <- 10 # Set number of interations
output <- numeric(iters) # Pre-allocate numeric vector 
output

for(i in 1:iters) { # Run code below iters times
    output[i] <- (i-1)^2 + (i-2)^2
}
output # Display output


rownums <- 3
colnums <- 6
output <- matrix(NA,nrow=rownums,ncol=colnums)

for(i in 1:rownums){
  for(j in 1:colnums){
    output[i,j] <- i + j
  }
}
output

if(8  < 10){
  print("Less than 10!")
}else{
  print("Not less than 10!")
}

i <- 13
if(i <= 10) { 
  print("i is less than or equal to 10!")
} else if(i <= 14) {
  print("i is greater than 10, less than or equal to 14")
} else {
  print("i is greater than or equal to 15")
}

for(i in 1:5){
  if(i %% 2 == 0){ #check for even numbers
    print(i / 2)
  }else{
    print(i * 2)
  }
}

#### `while()` Loops ####

x <- 0 
while(x < 3){
  x <- x + 1
  print(x)
}

x <- 0 
while(x < 3){
  x <- x + 1
  print(x)
}

x <- 0
x <- x+1
print(x)
x <- x+1
print(x)
x <- x+1
print(x)


num_heads <- 0
num_flips <- 0

while(num_heads < 4) {
  # simulating a coin flip
  coin_flip <- rbinom(n = 1, size = 1, prob = 0.5) 
  
  # keep track of heads
  if (coin_flip == 1) { 
    num_heads <- num_heads + 1 
  }
  
  # update number of coin flips
  num_flips <- num_flips + 1 
}

num_flips # follows negative binomial distribution
