#!/usr/bin/env Rscript
# This is a wrapper for doing the less pleasant parts of calling the converter
# from R.
# To use it, source this script and then:
# eval(parse(text=pyconfconverts(filename, section)))
# or eval(parse(text=pyconfconvert(filename)))

# Owain Kenway
# Where this is distributed it is done so under the MIT license.

# This version pulls a section.
pyconfconverts <- function(filename, section) {
  pyconfconvcomm <- paste0("pyconfconv.py -l r -i ", filename, " -s ", section)
  pyconfconvresult <- system(pyconfconvcomm, intern = TRUE)
  return(pyconfconvresult)
}

# This version pulls the whole file.
pyconfconvert <- function(filename) {
  pyconfconvcomm <- paste0("pyconfconv.py -l r -i ", filename)
  pyconfconvresult <- system(pyconfconvcomm, intern = TRUE)
  return(pyconfconvresult)
}

