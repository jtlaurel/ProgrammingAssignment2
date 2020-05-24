## This is a function designed to cache the inverse of a
## matrix instead of calculating it each time.

## This is a function that creates a matrix that can 
## cache its inverse. 

makeCacheMatrix <- function(x = matrix()) {
  invMatrix <- NULL 
  set <- function(y) {
    x <<- y
    invMatrix <<- NULL
  } 
  ##define set function 
  get <- function() x    ##define get function
  setinverse <- function(inverse) invMatrix <<- inverse
  getinverse <- function() invMatrix
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  #return functions to parent environment 
}


## This function calculates the inverse of the matrix 
## returned by the function above. If the inverse has 
## been calculated, the inverse will be retrieved from 
## the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  invMatrix <- x$getinverse()
  if(!is.null(invMatrix)) {
    message("getting cached data")
    return(invMatrix)
  }  ##check if result of getinverse is NULL
  data <- x$get()
  invMatrix <- solve(data, ...)
  x$setinverse(invMatrix)
  invMatrix  ##set cached or calculated data to return
}

