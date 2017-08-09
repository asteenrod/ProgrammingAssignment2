#HW Assignment 2: Lexical Scoping 
#Short comment on functions:
#The function is made of two parts: 

#The first part focuses on the getting and setting of the matrix values. This part of the matrix assigns the values
# and identifies the values within the environment that can be assigned. 
makeCacheMatrix <- function(x = matrix()) {
    m<-NULL
    set <-function(trix) {
      x<<- trix
      m<<-NULL
    }
    get <- function() x
    setsolve<-function(solve) m<<-solve
    getsolve <- function() m 
    list (set = set, get = get, 
        setsolve = setsolve, getsolve = getsolve)#this code sets the names so that they can be called using $$ later
  }


## Write a short comment describing this function:
#In this function, the inverse matrix is computed, either a new one is computed (since the matrix has changed) or an old cached 
#inverse of the matrix is available. The first line of code checks if m has a value - if is does from the previous code, then it
#just returns the inversed matrix assigned using the first function; if it doesn't (value is NULL) then it gets the matrixs and 
#runs the inverse and saves the value as m and returns the inverse matrix. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m<- x$getsolve()
    if(!is.null(m)){
        message("getting cached matrix")
        return(m)
    } 
      #this 'if' statement looks if m is NOT a null value - if not, then it prints the statement "getting cached matrix" 
     #and prints inverse matrix assigned to m
    hw2<- x$get()  #this gets the matrix associated with the value x from the parent environment and labels its '
    m<- solve(hw2, ...) #this computes the inverse of the matrix and assigns the value to m
    x$setsolve(m) #this sets the solved value of m to x 
    m #this will return the inverse matrix of x
  }

#testing the matrix 
tester <- matrix(rnorm(16),nrow=4,ncol=4)
tester
p2 <- makeCacheMatrix(tester)
p2$get()
p2$getsolve()
p3<- cacheSolve(p2)
p3<- cacheSolve(p2)
identical(p1, p3)

