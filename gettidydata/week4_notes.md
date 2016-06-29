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
# Great example: remove commas from currency values
noCommas <- as.numeric(gsub(",", "", gdp$gross))  
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

```R
^i think      # matches the beginning of a line
```
Matches all the examples where the words "i think" starts the line of the file.

```R
morning$     # matches text at end of a line
```
```R
[Bb][Uu][Ss][Hh] # Matches a set of characters in the list
```
```R
^[Ii] am     # matches I am or i am at the beginning of a line
```
```R
^[0-9][a-zA-Z]     # matches any line that starts with a number followed by a letter
```
When used inside a character list, the **^** symbol means **NOT**.
```R
[^?.]$            # matches lines that don't end in ? or .
```

### More about Regular Expressions
```R
9.11              # matches 9, any character, then 11. Use \. to match periods.
```
```R
right|wrong       # | acts as an OR operator
```
```R
# Can also use expressions in the OR operator
^[Gg]ood|[Bb]ad   # Matches Good at the beginning or Bad anywhere in the line

# To Match Good or Bad at the beginning, regardless of case:
^([Gg]ood|[Bb]ad)
```

```R
# Use ? for optional matches
[Mm]ichael( [Jj]\.)? [Ff]ox
# will match lines containing Michael J. Fox or michael fox
```

Use \* and + for repetition. __*__ means any number including 0.
__+__ means at least one of them (characters).

```R
(.*)           # Matches any line containing 0 or more characters between parenthese like (how's this) or ()
```

Use {} to indicate the min and max number of occurences.
```R
[Tt]rudeau( +[^ ]+ +){1,5} debate
# Looks for any pattern of Trudeau followed by spaces and 1 - 5 words then the word debate.

{m,n} - at least m but not more than n matches
{m} - exactly m matches
{m,} - at least m matches
```
Find matches of a word repeated twice, using \1 and \2 etc to *remember* a pattern.
```R
 +([a-zA-Z]+) +\1 +
```
The \* is greedy.
```R
# Match strings that start and end with s. Find longest.
^s(.*)s$

# Find a shorter substring
^s(.*?)s$
```
## Working With Dates

```R
d1 <- date() # Returns date and time, returns a character object.
d2 <- Sys.date() # Not include time, returns a date object

format(d2, "%a %b %d")  # See other notes for use of date formatting characters
x <- c("1jan1960", "2jan1960", "31mar1960")
z <- as.Date(x, "%d%b%Y")
z
z[1] - z[2]
as.numeric(z[1] - z[2])

weekdays(d2)
months(d2)
julian(d2)
```
Use the `lubridate` library to help make things easier.

```R
library(lubridate)
# These functions will output a UTC date format.
ymd("20140108")
mdy("08/04/2013")
dmy("03-04-2014")

ymd_hms("2012-08-03 10:30:32")
ymd_hms("2012-08-03 10:30:32", tz="Pacific/Auckland")
?Sys.timezone
# See the r-statistics.com tutorial on lubridate.

# Get the weekday using lubridate.
wday(d1, label=TRUE) # To get the weekday abbreviation. Otherwise it returns an integer.

```
For good, clean, tidy, data you want your dates to be of the `Date` class or `POSIXct` or `POSIXlt`.
