# Reading From APIs
# From Getting And Cleaning Data
# Week 2 - Coursera

# Use httr & jsonLite
library(httr)
library(jsonlite)

# Protect these keys from becoming public.
myapp = oauth_app("twitter", 
                  key="efYMRwir780488TltaIuov5h4", 
                  secret="iwJpCbi6UruNDJyJ7SwoWABNCEmTjeKyjhhwahpTbzRQtU3n0S")

sig = sign_oauth1.0(myapp,
                    token = "14335985-pnjQ23OjTrXhexyIvtUKMzzszWM3v5b9qHC83hl18",
                    token_secret = "gpAlUEhoRBLe36DlNUACQMgSzh3ZBmyjoNEAGN5eakKvp")
homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)

# Use content() to extract the requested data
json1 = content(homeTL)

# Use toJSON to convert the R data back into JSON,
# then use fromJSON to turn it into a dataframe.
json2 = fromJSON(toJSON(json1))
# The above line may be quite delayed.

message("The most recent tweet is: ", json2[1,4])
# Note: Visit the Twitter API to see which website to request for other info
# https://dev.twitter.com/docs/api/1.1/overview


