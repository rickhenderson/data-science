# Using dplyr
Use `dplyr` to simplify working with data frames.

Supports the use of the verbs `select`, `filter`, `arrange`, `rename`, `mutate`, `summarize`.

## Select
`select` allows you to select a subset of the columns you need from the data frame. It returns a data frame. You don't need to use $ or quotation marks for the column names, just their names.

```R
df <- read.csv("data/data.csv")

# Create a new data.frame containing only two columns of interest.
ofInterest <- select(df, var1, var2)

```
