# Reading From APIs
# From Getting And Cleaning Data
# Week 2 - Coursera

# Protect these keys from becoming public.
myapp = oauth_app("twitter", key="efYMRwir780488TltaIuov5h4", secret=" iwJpCbi6UruNDJyJ7SwoWABNCEmTjeKyjhhwahpTbzRQtU3n0S")

sig = sign_oauth1.0(myapp,
                    token = "yourTokenHere",
                    token_secret = "yourtokenSecrethere")
homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)
