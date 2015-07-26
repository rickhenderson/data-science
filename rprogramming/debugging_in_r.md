#Debugging in R

## traceback()
`traceback()` displays the function where the error occured. Typically used on the command
line and called when your script ends in an error. After using `traceback()` you'll know where the error occurred.

```R
> simpleLoop()
Error in print(myVector[x]) : object 'x' not found
> traceback()
2: print(myVector[x]) at debugging.R#10
1: simpleLoop()
```
Note that in the above example, the #10 indicates the line number where the error occurred.
In this case, `x` was not defined as a variable in the script.

