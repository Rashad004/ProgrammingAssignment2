### Programming R Assignment 2; completed by Rashad Mahbub

## makeCacheMatrix: This function creates a special "matrix" object that can 
# cache its inverse. The matrix is inversed by using the solve function and 
# the resulted cached file is cached using '<<-' operator. 
# The first function, makeCacheMatrix creates a special "matrix", 
# which is really a list containing a function to:

# set the value of the matrix
# get the value of the matrix
# set the inverse of the matrix
# get the inverse of the matrix


makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinv <- function(inverse) inv <<- inverse
    getinv <- function() inv
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}

### cacheSolve: This function computes the inverse of the special "matrix" 
# returned by makeCacheMatrix above. If the inverse has already been calculated 
# (and the matrix has not changed), then cacheSolve will retrieve the inverse 
# from the cache and skip computation. Otherwise, it will inverse the matrix 
# using solve function.

cacheSolve <- function(x, ...) {
    inv <- x$getinv()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinv(inv)
    inv
}

# Example
# m <- matrix(1:4,2,2)
# m2 <- makeCacheMatrix(m)
# cacheSolve(m2)
# cacheSolve(m2) # running the code again will give cached result with message
### Programming R Assignment 2 

## makeCacheMatrix: This function creates a special "matrix" object that can 
# cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinv <- function(inverse) inv <<- inverse
    getinv <- function() inv
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}

### cacheSolve: This function computes the inverse of the special "matrix" 
# returned by makeCacheMatrix above. If the inverse has already been calculated 
# (and the matrix has not changed), then cacheSolve should retrieve the inverse 
# from the cache.

cacheSolve <- function(x, ...) {
    inv <- x$getinv()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinv(inv)
    inv
}

# Example
# m <- matrix(1:4,2,2)
# m2 <- makeCacheMatrix(m)
# cacheSolve(m2)
# cacheSolve(m2) # running the code again will give cached result with message
