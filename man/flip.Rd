\name{flip}
\alias{flip}
\title{flip}

\description{
This function flips the image either horizontally or vertically.
}

\usage{flip(x,direction)}

\arguments{
  \item{x}{An image file in .jpg,.jpeg,.png,.tiff format}
  \item{y}{Direction of flip}
}

\details{
The direction of flip can only be 'h'(horizontal) or 'v'(vertical)
}

\value{
A horizontally or vertically flipped image.
}

\author{Tarini Bhatnagar}
\seealso{InstaPy::flip}

\examples{
library(InstaR)
flip("test.jpg", direction='h')
}

\keyword{ flip }
\keyword{ rotate }
