add2 <- function(x,t){
  x + t + 6
}

above <- function(x,n=10) {
  x[x>n]
}

y<- 10

f <- function(x) {
  y <- 2
  y^2 + g(x)
}

g <- function(x) {
  x+y
}

cube <- function(x,n) {
  x^3
}

tester <- function() {
  x <- 1:10
  if (x > 5) {
    x <- 0
  }
}


f <- function(x) {
  g <- function(y) {
    y + z
  }
  z <- 4
  x + g(x)
}

f1 <- function() {
  x <- 5
  y <- if(x < 3) {
    NA
  } else {
    10
  }
  y
  
}