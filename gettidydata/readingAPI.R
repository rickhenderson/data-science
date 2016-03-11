# Reading From APIs
# From Getting And Cleaning Data
# Week 2 - Coursera

myapp = oauth_app("twitter", key="yourConsumerKey", secret="yourConsumersecret")

sig = sign_oauth1.0(myapp,
                    token = "yourTokenHere",
                    token_secret = "yourtokenSecrethere")
homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)
