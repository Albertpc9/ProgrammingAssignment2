## Put comments here that give an overall description of what your
## functions do


#the structure of the functions are similar to the ones for the vectors in the example
#but instead of computing the mean, in this case the inverse of the matrix is obtained 
#with the function SOLVE

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  get <- function() x
  
  setinv <- function(solve) inv <<- solve
  
  getinv <- function() inv
  
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## Write a short comment describing this function


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
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


mat<-matrix(rnorm(9), nrow = 3, ncol = 3)
matrice<-makeCacheMatrix(mat)
cacheSolve(matrice)
