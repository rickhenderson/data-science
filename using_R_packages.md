##Installing R Packages
You can get a list of the available packages by using:
'a = available.packages()'
'head(rownames(a), 20)'

* Install a package from CRAN
  install.packages("slidify")'

* Or multiple packages using a Character vector
  install.packages(c("slidify", "ggplot2", "devtools"))'

* Or from R Studio
* Tools > Install Packages

###Installing an R Package from Bioconductor
  Source("http://bioconductor.org/biocLite.R")'
  biocLite()'
  biocLite(c("GenomicFeatures", "AnnotationDbi"))'

Link: [http://www.bioconductor.org/install]

After you install all the packages you need, they are not immediately available. You need to load them.

'library(ggplot2)'

After loading a library, use 'search()' to show the list of functions it has available.

If completing other courses or building data applications, you'll need to install Rtools in Windows.
