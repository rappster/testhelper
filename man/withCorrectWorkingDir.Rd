% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/code.R
\name{withCorrectWorkingDir}
\alias{withCorrectWorkingDir}
\title{Evaluate test code in appropriate working directory.}
\usage{
withCorrectWorkingDir(code, pattern = "/tests/testthat$",
  target_wd = "tests/testthat")
}
\arguments{
\item{code}{Test code containing expectations}

\item{pattern}{\code{\link[base]{character}}.
Pattern to determine the working directory scenario.}

\item{target_wd}{\code{\link[base]{character}}.
Working directory for tests.}
}
\value{
Whatever the \code{code} returns.
}
\description{
Wrapping test code with this function ensures that the appropriate working
directory is chosen regardless of how test code is executed (see details).
This is especially useful when test code itself is still at a development stage,
i.e. not completely fit for execution via \code{\link[testthat]{test_dir}} or
similar testing routines yet.
}
\details{
In case test code is executed via "stand-alone" calls to either
\code{\link[testthat]{expect_that}} (or functions calling that function) or
\code{\link[testthat]{test_that}} instead of a "global" call to
\code{\link[testthat]{test_dir}}, the working directory is \emph{temporarily}
set to \code{"~/tests/testthat"}.
}
\section{Assumptions}{

The function assumes that your initial working directory points to a
directory containing a valid R package (project) as created via
functions like \code{\link[utils]{package.skeleton}},
\code{\link[devtools]{create}} or the like.
}
\examples{
\dontrun{
# Prepare:
old <- setwd(tempdir())
dir.create("tests/testthat/test_dir", recursive = TRUE)

# Assumes that the following file exists: ~/tests/testthat/test_dir
# Failing test when executed in a "stand-alone" manner:
try(expect_true(file.exists("test_dir")))

# Ensuring the appropriate working directory:
withCorrectWorkingDir(
  expect_true(file.exists("test_dir"))
)

# Clean up:
if (grepl(basename(getwd()), old)) {
  unlink("tests", recursive = TRUE)
}
setwd(old)
}
}

