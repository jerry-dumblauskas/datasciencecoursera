# Test your code
# let's just run off stuff in memory!
#
# generate matrix, and the inverse of the matrix.
size <- 1000 # size of the matrix edge, don't make this too big
mymatrix <- matrix(rnorm(size^2), nrow=size, ncol=size)
mymatrix.inverse <- solve(mymatrix)
#
# now solve the matrix via the cache-method
#
special.matrix   <- makeCacheMatrix(mymatrix)
#
# this should take long, since it's the first go
special.solved.1 <- cacheSolve(special.matrix)
#
# this should be lightning fast
special.solved.2 <- cacheSolve(special.matrix)
#
# check if all solved matrices are identical
identical(mymatrix.inverse, special.solved.1) & identical(mymatrix.inverse, special.solved.2)
#
# should return TRUE
