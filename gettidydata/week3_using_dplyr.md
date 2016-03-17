# Using dplyr
Use `dplyr` to simplify working with data frames.

Supports the use of the verbs `select`, `filter`, `arrange`, `rename`, `mutate`, `summarize`.

## Select
`select` allows you to select a subset of the columns you need from the data frame. It returns a data frame.

```R
df <- read.csv("data/data.csv")

ofInterest <- select(df, var1, var2)
```
