% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/html_dependency.R
\name{htmlDependency}
\alias{htmlDependency}
\title{Define an HTML dependency}
\usage{
htmlDependency(
  name,
  version,
  src,
  meta = NULL,
  script = NULL,
  stylesheet = NULL,
  head = NULL,
  attachment = NULL,
  package = NULL,
  all_files = TRUE
)
}
\arguments{
\item{name}{Library name}

\item{version}{Library version}

\item{src}{Unnamed single-element character vector indicating the full path
of the library directory. Alternatively, a named character string with one
or more elements, indicating different places to find the library; see
Details.}

\item{meta}{Named list of meta tags to insert into document head}

\item{script}{Script(s) to include within the document head (should be
specified relative to the `src` parameter).}

\item{stylesheet}{Stylesheet(s) to include within the document (should be
specified relative to the `src` parameter).}

\item{head}{Arbitrary lines of HTML to insert into the document head}

\item{attachment}{Attachment(s) to include within the document head. See
Details.}

\item{package}{An R package name to indicate where to find the `src`
directory when `src` is a relative path (see
[resolveDependencies()]).}

\item{all_files}{Whether all files under the `src` directory are
dependency files. If `FALSE`, only the files specified in
`script`, `stylesheet`, and `attachment` are treated as
dependency files.}
}
\value{
An object that can be included in a list of dependencies passed to
  [attachDependencies()].
}
\description{
Define an HTML dependency (i.e. CSS and/or JavaScript bundled in a
directory). HTML dependencies make it possible to use libraries like jQuery,
Bootstrap, and d3 in a more composable and portable way than simply using
script, link, and style tags.
}
\details{
Each dependency can be located on the filesystem, at a relative or
  absolute URL, or both. The location types are indicated using the names of
  the `src` character vector: `file` for filesystem directory,
  `href` for URL. For example, a dependency that was both on disk and at
  a URL might use `src = c(file=filepath, href=url)`.

  `script` can be given as one of the following:
  \itemize{
  \item a character vector specifying various scripts to include relative to the
    value of `src`.
    Each is expanded into its own `<script>` tag
  \item A named list with any of the following fields:
  \itemize{
    \item `src`,
    \item `integrity`, &
    \item `crossorigin`,
    \item any other valid `<script>` attributes.
    }
    allowing the use of SRI to ensure the integrity of packages downloaded from
    remote servers.
    Eg: `script = list(src = "min.js", integrity = "hash")`
  \item An unnamed list, containing a combination of named list with the fields
    mentioned previously, and strings.
    Eg:
    \itemize{
    \item `script = list(list(src = "min.js"), "util.js", list(src = "log.js"))`
    \item `script = "pkg.js"` is equivalent to
    \item `script = list(src = "pkg.js")`.
    }
  }

  `attachment` can be used to make the indicated files available to the
  JavaScript on the page via URL. For each element of `attachment`, an
  element `<link id="DEPNAME-ATTACHINDEX-attachment" rel="attachment"
  href="...">` is inserted, where `DEPNAME` is `name`. The value of
  `ATTACHINDEX` depends on whether `attachment` is named or not; if
  so, then it's the name of the element, and if not, it's the 1-based index
  of the element. JavaScript can retrieve the URL using something like
  `document.getElementById(depname + "-" + index + "-attachment").href`.
  Note that depending on the rendering context, the runtime value of the href
  may be an absolute, relative, or data URI.

  `htmlDependency` should not be called from the top-level of a package
  namespace with absolute paths (or with paths generated by
  `system.file()`) and have the result stored in a variable. This is
  because, when a binary package is built, R will run `htmlDependency`
  and store the path from the building machine's in the package. This path is
  likely to differ from the correct path on a machine that downloads and
  installs the binary package. If there are any absolute paths, instead of
  calling `htmlDependency` at build-time, it should be called at
  run-time. This can be done by wrapping the `htmlDependency` call in a
  function.
}
\seealso{
Use [attachDependencies()] to associate a list of
  dependencies with the HTML it belongs with.
  The shape of the `htmlDependency` object is described (in TypeScript code)
  [here](https://github.com/rstudio/shiny/blob/474f1400/srcts/src/shiny/render.ts#L79-L115).
}
