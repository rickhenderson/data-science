# Using httr
# Makes working with HTTP and headers easier, allows
# automating of the browsing process and include
# user authentication.

# Lecture examples of Web scraping
# Coursera Getting and Cleaning Data
# Week 2

# Code entered and modified by Rick Henderson.
# Created: March 8, 2016

# Load the HTTR library
# Title: Tools for Working with URLs and HTTP
# Description: Useful tools for working with HTTP organised by HTTP verbs
#(GET(), POST(), etc). Configuration functions make it easy to control
# additional request components (authenticate(), add_headers() and so on).

library(httr)

url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"

# Use the HTTP GET request to retrieve more than just the HTML code
html2 = GET(url)

# Extract the web page content out of the GET request
content2 = content(html2, as="text")

# Parse the HTML content
parsedHtml = htmlParse(content2, asText=TRUE)

# Extract the title
pageTitle <- xpathSApply(parsedHtml, "//title", xmlValue)
