# Creating an Artificial Neural Network (ANN)
# In R.
# Author: Rick Henderson
# Date: January 21, 2016
# Based on: http://www.cyclismo.org/tutorial/R/s4Classes.html
# This is used to represent a perceptron as an S4 class.
# This works!

Perceptron <- setClass(
  # Set the name for the class.
  "Perceptron",
  
  # Define the slots.
  slots <- list(
    input1 = "numeric",
    input2 = "numeric",
    input3 = "numeric"
  ),
  
  # Set the default values (optional)
  prototype = list(
    input1 = 0.3,
    input2 = 0.3,
    input3 = 0.3
  ),
  
  # Make a function that can test to see if the data is consistent.
  # This is not called if you have an initialize function defined!
  validity=function(object)
  {
    if( is.na(object@input1) ) {
      return("The first input was not a number.")
    }
    return(TRUE)
  }
  
)
  
