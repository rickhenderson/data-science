# Notes from Week 4
# Manipulating Text

Functions covered include:
```R
tolower()
toupper()
strsplit()
# Remember the list() function and object!
sapply()
sub()    # Only applies one replacement.
gsub()   # Apply character replacement to all occurrences.
grep()
grepl()  # Use with table(grepl(...)) for displaying vector
# Search for a value in a variable:
length(grep("RickStreet", mapdata$intersection))

library(stringr)
nchar("RickHenderson")
substr("Rick Henderson", 1, 4)
paste()
paste0()
str_trim()

```
## Variable names and text data in datasets
Variables names should be:
  * in lowercase
  * descriptive (diagnosis instead of dx)
  * not duplicated
  * not contain dots, underscores, or spaces
  
Values with characters:
  * should usually be made into factor variables (depending on application)
  * should be descriptive: TRUE/FALSE, MALE/FEMALE, not 0/1, or M/F
  
# Regular Expressions
## Literals
Literals are the simplest pattern to match. Like the word 'kungfu'.

## Metacharacters
Metacharacters are used as grammar, or modifiers for simple literals in a pattern.

```
^i think      # matches the beginning of a line
```
Matches all the examples where the words "i think" starts the line of the file.

```
morning$     # matches text at end of a line
```

```
[Bb][Uu][Ss][Hh] # Matches a set of characters in the list
```

