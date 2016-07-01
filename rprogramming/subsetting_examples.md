# Subsetting Examples in R

Other sections of the __data-science__ repository contain further examples of subsetting including basic R subsetting and using the `dplyr` package.

# Dates
In many situations, the date format in the source data may not be a valid date format. R frequently uses the POSIXct date format so it is recommended that dates be in the format "YYYY-MM-DD HH:MM:SS" as much as possible, or portions of the date and time in separate columns or variables.

Here is a typical situation where Date and Time of the sensor readings were recorded as separate variables but for proper analysis could be combined:

<pre>
    Date     Time Global_active_power Global_reactive_power Voltage
       <chr>    <chr>               <dbl>                 <dbl>   <dbl>
1 16/12/2006 17:24:00               4.216                 0.418  234.84
2 16/12/2006 17:25:00               5.360                 0.436  233.63
3 16/12/2006 17:26:00               5.374                 0.498  233.29
4 16/12/2006 17:27:00               5.388                 0.502  233.74
5 16/12/2006 17:28:00               3.666                 0.528  235.68
6 16/12/2006 17:29:00    
</pre>

Here is a brief description of how this can be handled:
```R
# Converting date / times
# 1. Paste the date/time together
# d1 = paste(df$Date[1], df$Time[1])
# 2. Convert it using strptime
# d1 = strptime(d1, "%d/%m/%Y %H:%M:%S")
```
