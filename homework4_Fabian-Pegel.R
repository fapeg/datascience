makeCacheMatrix <- function(x = numeric()) {
  m  <-  NULL
  set  <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  
  setinverse <- function(solve) m <<-   solve
  getinverse <- function() m
  list(set=set, get=get,
    setinverse = setinverse,
    getinverse = getinverse)
}

cacheSolve <-  function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  
  m
}

# Test:
# > x <- matrix(1:4,2,2)
# > x
#     [,1] [,2]
# [1,]    1    3
# [2,]    2    4
# > x2 <- makeCacheMatrix(x)
# > x2
# $set
# function (y) 
# {
#    x <<- y
#    m <<- NULL
# }
# <environment: 0x105119990>
# 
# $get
# function () 
# x
# <environment: 0x105119990>
#
# $setinverse
# function (solve) 
# m <<- solve
# <environment: 0x105119990>
# 
# $getinverse
# function () 
# m
# <environment: 0x105119990>
# 
# > cacheSolve(x2)
#     [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5
# > cacheSolve(x2)
# getting cached data
#     [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5
