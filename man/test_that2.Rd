% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/code.R
\name{test_that2}
\alias{test_that2}
\title{Unit testing with appropriate working directory.}
\usage{
test_that2(desc, code)
}
\arguments{
\item{desc}{See \code{\link[testthat]{test_that}}}

\item{code}{See \code{\link[testthat]{test_that}}}
}
\description{
Wraps call to \code{\link[testthat]{test_that}} by
\code{\link[testhelper]{withCorrectWorkingDir}}.
}

