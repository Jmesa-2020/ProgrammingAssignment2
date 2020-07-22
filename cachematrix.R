##  Two functions that are used in order to create an appropriate object that 
## stores a matrix and caches its inverse.

## makeCacheMatrix creates a peculiar "matrix" object that can cache its inverse.


makeCacheMatrix <- function(x = matrix()) {
  inv_ini <- NULL
  set <- function(x_end) {
    x <<- x_end
    inv_ini <<- NULL
  }
  get <- function() x
  set_inverse <- function(inverse) inv_ini <<- inverse
  get_inverse <- function() inv_ini
  list(set = set, get = get,
       set_inverse = set_inverse,
       get_inverse = get_inverse)
}

## cacheSolve computes the inverse of the special "matrix" created by 
## makeCacheMatrix above. 

cacheSolve <- function(x, ...) {
  inverse <- x$get_inverse()
  if(!is.null(inverse)) {
    message("getting cached data")
    return(m)
  }
  matriz <- x$get()
  inverse <- solve(matriz, ...)
  x$set_inverse(inverse)
  inverse
}
