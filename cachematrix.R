## Put comments here that give an overall description of what your
## functions do

## This function creates a matrix which can be cached

makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
	set <- function(y) {
		x <<- y
		m <<- NULL
	}
	get <- function() x
	setinverse <- function(solve) m <<- solve
	getinverse <- function() m
	list(set = set, get = get, 
		setinverse = setinverse, 
		getinverse = getinverse)
}


## This functed solves for the matrix which was cached
## in the function above and returns its inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        if(!is.null(m)) {
        	message("getting cached data")
        	return(m)
        }
	data <- x$get()
	m <- solve(data, ...)
	x$setinverse(m)
	m
}
