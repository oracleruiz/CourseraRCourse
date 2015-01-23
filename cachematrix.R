## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  matrixCached <- NULL
  matrixInvertCached <- NULL
  set <- function(y) {    
     if(is.null(matrixCached) || !identical(matrixCached,y)){
       message("New Matrix value set")
       x <<- y
       matrixCached <<- y
       matrixInvertCache <<- NULL      
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


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
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

