# NAME <- function(ARGUMENT1, ARGUMENT2=DEFAULT){
#   BODY
#   return(OUTPUT)
# }


double_x <- function(x){
  double_x <- x * 2
  return(double_x)
}

double_x(5)
double_x(NA)
double_x(1:2)

first_and_last <- function(x) {
    first <- x[1]
    last  <- x[length(x)]
    return(c("first" = first, "last" = last))
}

first_and_last(c(4, 3, 1, 8))
first_and_last(7)
first_and_last(numeric(0))

smarter_first_and_last <- function(x) {
  if(length(x) < 2){
    stop("Input is not long enough!")
  } else{
    first <- x[1]
    last  <- x[length(x)]
    return(c("first" = first, "last" = last))    
  }
}

smarter_first_and_last(NA)
smarter_first_and_last(c(4, 3, 1, 8))

smarter_first_and_last


for(col_index in seq_along(swiss)){
  mean_swiss_col <- mean(swiss[,col_index])
  names_swiss_col <- names(swiss)[col_index]
  print(c(names_swiss_col,round(mean_swiss_col,3)))
}


# apply(DATA, MARGIN, FUNCTION)

apply(swiss, 2, mean)

row_max <- apply(swiss,1,max) #maximum in each row
head(row_max,20)

apply(swiss,2,summary) # summary of each column

divers_score <- function(x){
  if(length(x) != 7){
    stop("x is not of length 7!")
  } else{
    x_nofirst_nolast <- x[2:6]
    return(mean(x_nofirst_nolast))
  }
}
scores <- matrix(1:21,nrow=3)
print(scores)
apply(scores,1,divers_score)
