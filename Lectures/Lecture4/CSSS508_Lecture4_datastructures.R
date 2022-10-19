library(dplyr)


c(1, 10*3, 4, -3.14)
c("red", "blue", "blue")
factor(c("red", "blue", "blue"))
c(FALSE, TRUE, TRUE)

test_group <- factor(c("Treatment", "Placebo", 
                       "Placebo", "Treatment"))
test_group

my_booleans <- c(TRUE, TRUE, FALSE, FALSE, FALSE)
sum(my_booleans)
mean(my_booleans)

class4    <- class(4)
classAB   <- class(c("A","B"))
classABFac<- class(factor("A","B"))
classTRUE <- class(TRUE)

c(class4,classAB,classABFac,classTRUE)

c(is.numeric(5),  is.character("A"))

is.logical(TRUE)

c(is.infinite(-Inf),  is.na(NA),  is.nan(NaN))

## Mini-Check
is.numeric(3.14)
is.numeric(pi)
is.logical(FALSE)
is.nan(NA)

c(1, 3, 7, -0.5)
length(c(1, 3, 7, -0.5))

1:10
seq(-3, 6, by = 1.75) # Sequence from -3 to 6, increments of 1.75
rep(c(-1, 0, 1), times = 3) # Repeat c(-1,0,1) 3 times
rep(c(-1, 0, 1), each = 3) # Repeat each element 3 times

c(1, 2, 3) + c(4, 5, 6)
c(1, 2, 3, 4)^3 # exponentiation with ^

c(0.5, 3) * c(1, 2, 3, 4)
c(0.5, 3, 0.5, 3) * c(1, 2, 3, 4) # same thing

3 * c(-1, 0, 1, 2) + 1

c(1, 2, 3, 4) + c(0.5, 1.5, 2.5)

x <- c(97, 68, 75, 77, 69, 81, 80, 92, 50, 34, 66, 83, 62)
z <- (x - mean(x)) / sd(x)
round(z, 2)

vector_w_missing <- c(1, 2, NA, 4, 5, 6, NA)
mean(vector_w_missing)
mean(vector_w_missing, na.rm=TRUE)

first_names <- c("Andre","Brady","Cecilia",
                 "Danni","Edgar","Francie")
first_names[1]
first_names[c(1,2)]
first_names[-3]

## Mini-Check
sum(c(1,2,NA))
rep(c(0,1),times=2)


(a_matrix <- matrix(first_names, nrow=2, ncol=3))
(b_matrix <- cbind(c(1, 2), c(3, 4), c(5, 6)))
(c_matrix <- rbind(c(1, 2, 3), c(4, 5, 6)))

a_matrix[1, 2] # row 1, column 2
a_matrix[1, c(2,3)] # row 1, columns 2 and 3

dim(a_matrix)

a_matrix[, 1] 

a_matrix[, 1, drop=FALSE] 

(bad_matrix <- cbind(1:2, c("Michael","Pearce")))

rownames(bad_matrix) <- c("First", "Last")
colnames(bad_matrix) <- c("Number", "Name")
bad_matrix
bad_matrix[ ,"Name", drop=FALSE]

matrix(c(2,4,6,8),nrow=2,ncol=2) / matrix(c(2,1,3,1),nrow=2,ncol=2)

(e_matrix <- t(c_matrix))

(f_matrix <- c_matrix %*% e_matrix)

(g_matrix <- solve(f_matrix))


my_list <- list("first_thing"  = 1:5,
                "second_thing" = matrix(8:11, nrow = 2))
my_list

my_list[["first_thing"]]
my_list[[1]]
my_list$first_thing

str(my_list[[1]])
str(my_list[1])

names(my_list)

lm_output <- lm(speed~dist,data=cars)
is.list(lm_output)
names(lm_output)
lm_output$coefficients
