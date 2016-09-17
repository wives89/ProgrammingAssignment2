## These functions are to store the inverse of a matrix in the cache
## so when repetedly calling the inverse of a matrix we can refer to these 
## functions instead of re-calculating.

## this function creates the inverse matrix in the cache 

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
get <- function() x  
setinverse <- function(solve) m <<- solve
getinverse <- function() m 
list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

  
## To recall the stored inverse matrix from memory, or calculate it if it is 
## not already done
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
data <- x$get()
m <- solve(data,...)
x$setinverse(m)
m
}
