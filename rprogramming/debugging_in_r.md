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

Traceback is often used when trying to get help from someone else. Send them the results of your traceback and they should be able to help you pinpoint the problem.

## debug()
`debug()` can be used on any function, even the ones built into R. When the code fails, it will bring you to the __Browser__ prompt, which acts the same as the R console.

```R
> debug(lm)
> lm(x ~ y)
...results of above line being debugged...
Browser[2]>
```
* Press n and then Enter to execute each line one by one.

## recover()
`recover()` allows you to view the environment where/when the function crashed. Like an error handler.
```R
  > options(error = recover)
  > read.csv("nosuchfile")
  ...
```

