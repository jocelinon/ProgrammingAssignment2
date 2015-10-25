#The following functions ultimately calculate & store inverted matrices to save time computationally

#This first function inverts a specific matrix and stores it for future reference
## Similar to the assignment example, this function:
### 1) sets the matrix 2) gets the matrix 3) sets the inverstion 4) gets the inversion

makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    set <- function(y){
        x <<- y
        inverse <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) inverse <<- solve
    getsolve <- function() inverse
    list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)

}

# This second function spits out the solution of the inverted matrix
## If the inverted matrix has already been computed, it will give out the cached results
### If the matrix has not been inverted, this function will invert the matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inverse <- x$getsolve()
    if(!is.null(inverse)){
        message("Cached Data")
        return(inverse)
    }
    mat <- x$get()
    inverse <- solve(mat,...)
    x$setsolve(inverse)
    inverse
}
