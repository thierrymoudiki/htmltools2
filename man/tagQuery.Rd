% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tag_query.R
\name{tagQuery}
\alias{tagQuery}
\title{Query and modify HTML tags}
\usage{
tagQuery(tags)
}
\arguments{
\item{tags}{A \code{\link[=tag]{tag()}}, \code{\link[=tagList]{tagList()}}, or \code{\link[=list]{list()}} of tags.}
}
\value{
A class with methods that are described below. This class can't be
used directly inside other \code{\link[=tag]{tag()}} or a \code{\link[=renderTags]{renderTags()}} context, but
underlying HTML tags may be extracted via \verb{$allTags()} or
\verb{$selectedTags()}.
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#experimental}{\figure{lifecycle-experimental.svg}{options: alt='[Experimental]'}}}{\strong{[Experimental]}}\cr\cr \code{tagQuery()} provides a
\href{https://jquery.com/}{\code{jQuery}} inspired interface for querying and modifying
\code{\link[=tag]{tag()}} (and \code{\link[=tagList]{tagList()}}) objects.
}
\section{Altered Tag structure}{


For performance reasons, the input tag structure to \code{tagQuery()} will be
altered into a consistently expected shape.

Some alterations include:
\itemize{
\item tags flattening their \verb{$children} fields into a single \code{list()}
\item tags relocating any attribute \verb{html_dependency() to be located in }$children`
\item \code{tagList()}-like structures relocating any attribute html dependency to
be a entry in its list structure.
}

While the resulting tag shape has possibly changed,
\code{tagQuery()}'s' resulting tags will still render
to the same HTML value (ex: \code{\link[=renderTags]{renderTags()}}) and
HTML dependencies (ex: \code{\link[=findDependencies]{findDependencies()}}).
}

\section{Vignette}{
To get started with using \code{tagQuery()}, visit
\url{https://rstudio.github.io/htmltools/articles/tagQuery.html}.
}

\section{Methods}{
Unless otherwise stated, \code{tagQuery()} methods accept a character
vector as input.
\subsection{Query methods}{

Query methods identify particular subsets of the root tag using CSS
selectors (or R functions).
\subsection{Children}{
\itemize{
\item \verb{$find(cssSelector)}: Get the descendants of
each selected tag, filtered by a \code{cssSelector}.
\item \verb{$children(cssSelector = NULL)}: Get the direct
children of each selected tag, optionally filtered by a
\code{cssSelector}.
}
}

\subsection{Siblings}{
\itemize{
\item \code{siblings(cssSelector = NULL)}: Get the
siblings of each selected tag, optionally filtered by a
\code{cssSelector}.
}
}

\subsection{Parents}{
\itemize{
\item \verb{$parent(cssSelector = NULL)}: Get the parent
of each selected tag, optionally filtered by a \code{cssSelector}.
\item \verb{$parents(cssSelector = NULL)}: Get the
ancestors of each selected tag, optionally filtered by a
\code{cssSelector}.
\item \verb{$closest(cssSelector = NULL)}: For each selected tag, get the closest
ancestor tag (including itself) satisfying a \code{cssSelector}. If
\code{cssSelector = NULL}, it is equivalent to calling \verb{$selectedTags()}.
}
}

\subsection{Custom filter}{
\itemize{
\item \verb{$filter(fn)}: Filter the selected tags to those for which \code{fn(x, i)} returns \code{TRUE}. In addition to an R function with two arguments
(the selected tag \code{x} and the index \code{i}), \code{fn} may also be a valid
CSS selector.
}
}

\subsection{Length}{
\itemize{
\item \verb{$length()}: Number of tags that have been selected.
}
}

\subsection{Reset}{
\itemize{
\item \verb{$resetSelected()}: Reset selected tags to the \verb{$root()} tag. Useful
in combination with \verb{$replaceWith()} since it empties the selection.
}
}

}

\subsection{Modify methods}{

Unlike query methods, modify methods modify the \code{tagQuery()} object.
\subsection{Attributes}{
\itemize{
\item \verb{$addClass(class)}: Adds class(es) to each selected tag.
\item \verb{$removeClass(class)}: Removes class(es) to each selected tag.
\item \verb{$toggleClass(class)}: Adds class(es) that don't already exist and
removes class(es) that do already exist (for each selected tag).
\item \verb{$hasClass(class)}: Does each selected tag have all the provided
class(es)?
\item \verb{$addAttrs(...)}: Add a set of attributes to each selected tag.
\item \verb{$removeAttrs(attrs)}: Remove a set of attributes from each
selected tag.
\item \verb{$hasAttrs(attr)}: Do each selected tags have all of the attributes?
}
}

\subsection{Children}{
\itemize{
\item \verb{$append(...)}: For each selected tag, insert \code{...} \strong{after} any
existing children.
\item \verb{$prepend(...)}: For each selected tag, insert \code{...} \strong{before} any
existing children.
}
}

\subsection{Siblings}{
\itemize{
\item \verb{$after(...)}: Add all \code{...} objects as siblings after each of the
selected tags.
\item \verb{$before(...)}: Add all \code{...} objects as siblings before each of
the selected tags.
}
}

\subsection{Custom}{
\itemize{
\item \verb{$each(fn)}: Modify each selected tag with a function \code{fn}. \code{fn}
should accept two arguments: the first is the selected tag and second
is the selected tags position index. Since the selected tag is a
reference, any modifications to it will also modify the \code{tagQuery()}
object.
}
}

}

\subsection{Replace methods}{
\itemize{
\item \verb{$replaceWith(...)}: Replace all selected tags with \code{...} in the
root tag and clear the selection.
\item \verb{$remove(...)}: Remove all selected tags from the root tag and
clear the current selection.
\item \verb{$empty()}: Remove any children of each selected tag. Use this
method before calling \verb{$append(...)} to replace the children of
each selected tag, with other content.
}
}

\subsection{Extract HTML tags}{
\itemize{
\item \verb{$allTags()}: Return the (possibly modified) root \code{tags}.
\item \verb{$selectedTags()}: Return a \code{\link[=tagList]{tagList()}} of the currently selected
tags.
}
}
}

\examples{
tagQ <- tagQuery(div(a()))
tagQ$find("a")$addClass("foo")
tagQ

# To learn more, visit https://rstudio.github.io/htmltools/articles/tagQuery.html
}