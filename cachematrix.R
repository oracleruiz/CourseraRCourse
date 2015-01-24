## R Programming
## Luis Diego Ruiz Vega 2015


## How to run the program:

## Load a matri in cache and solve its inverse matrix
## > m1 <- matrix(c(1,0,0,0,0,1,0,0,0), ncol = 3,nrow=3)
## > c <- makeCacheMatrix(m1)
## > cacheSolve(c)

## Set a new matrix
## > m2 <- matrix(c(1,0,0,1,0,1,0,1,1), ncol = 3,nrow=3)
## > c$set(m2)
## > cacheSolve(c)

## this method manage the cache. It stores a copy of the original matrix and
## the inverted matrix. Has set and get methods for setting and retriving the
## original matrix. Also set and get methods for the inverted matrix. 
## Set method check is the given matrix is already in cache (original)
## If it is not, set the new value otherwise alert the user with a message
## saying the new matrix not present any changes respect to the stored one. 

makeCacheMatrix <- function(x = matrix()) {
  matrixCached <- x
  matrixInvertCached <- NULL
  set <- function(y) {    
     if(is.null(matrixCached) || !identical(matrixCached,y)){
       message("New Matrix value set")
       matrixCached <<- y             
       matrixInvertCached <<- NULL
    }
    else
    {
      message("Matrix has not changed.")
    }
  }
  get <- function() matrixCached
  
  setInverseMatrix <- function(matrix) matrixInvertCached <<- matrix
  
  getInverseMatrix <- function() matrixInvertCached
  
  list(set = set, get = get,
       setInverseMatrix = setInverseMatrix,
       getInverseMatrix = getInverseMatrix)
}


## This method invert the matrix. First it checks if the Inverse matrix 
## is in cache otherwise it solve it and stores it in cache.

cacheSolve <- function(x) {
  matrixInvert <- x$getInverseMatrix()
  
  if(!is.null(matrixInvert)) {
    message("getting cached inverted matrix")
    return(matrixInvert)
  }  
  message("calculating inverted matrix")
  invert <- solve(x$get())
  x$setInverseMatrix(invert)
  invert  
}

