% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tags.R
\name{withTags}
\alias{withTags}
\title{Evaluate an expression using `tags`}
\usage{
withTags(code, .noWS = NULL)
}
\arguments{
\item{code}{A set of tags.}

\item{.noWS}{Default whitespace behavior for all tags within this call to
`withTags()`. Setting `.noWS` on an individual tag fuction inside
`withTags()` will override the default. See [tag()] for complete options.}
}
\description{
This function makes it simpler to write HTML-generating code. Instead of
needing to specify `tags` each time a tag function is used, as in
`tags$div()` and `tags$p()`, code inside `withTags` is
evaluated with `tags` searched first, so you can simply use
`div()` and `p()`.
}
\details{
If your code uses an object which happens to have the same name as an
HTML tag function, such as `source()` or `summary()`, it will call
the tag function. To call the intended (non-tags function), specify the
namespace, as in `base::source()` or `base::summary()`.
}
\examples{
# Using tags$ each time
tags$div(class = "myclass",
  tags$h3("header"),
  tags$p("text")
)

# Equivalent to above, but using withTags
withTags(
  div(class = "myclass",
    h3("header"),
    p("text")
  )
)

# Setting .noWS for all tags in withTags()
withTags(
  div(
    class = "myclass",
    h3("header"),
    p("One", strong(span("two")), "three")
  ),
  .noWS = c("outside", "inside")
)


}
