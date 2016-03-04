# Read XML Data into R
# Example from Week 1 Slides on XML of the Data Science Course At John Hopkins
# Entered and modified by Rick Henderson
# Date Modified: 20160303

#library(XML)
#fileURL <- "http://www.w3schools.com/xml/simple.xml"
#doc <- xmlTreeParse(fileURL, useInternal = TRUE)
#htmldoc <- htmlTreeParse(fileURL, useInternal = TRUE) # Use for HTML documents!
#rootNode <- xmlRoot(doc)
xmlName(rootNode)

names(rootNode)

# First Element of the rootNode
rootNode[[1]]

# First subcomponent of the first subcomponent
rootNode[[1]][[1]]

# Programmatically extract parts of the file
xmlSApply(rootNode, xmlValue)   # Actually extracts all text in the XML file. Be more specific.

# Further work requires use of XPath. See suggested file link.
# /node - top level node
# //node - Node at any level
# node[@attr-name] - Node with an attribute name
# node[@attr-name = 'bob'] - Node with the attribute name attr-name='bob'

# Get items on the menu and prices
xpathSApply(rootNode, "//name", xmlValue)

# Get all the prices
xpathSApply(rootNode, "//price", xmlValue)

# Different EXample using Ravens HTML file
# Extract all the List Item elements with the class 'team-name'
# team <- xpathSApply(doc, "//li[@class='team-name']", xmlValue)
