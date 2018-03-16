\name{blur}
\alias{blur}
\title{blur}

\description{
This function blurs an image, making a fuzzy variant with the details obscured.
}

\usage{blur(x)}

\arguments{
  \item{x}{An image file in .png format}
}

\details{
The blur is utilizing the "box blur" methodology.
}

\value{
A blurred image.
}

\author{Indiana Nikel}
\seealso{InstaPy::blur}

\examples{
library(InstaR)
blur("img.png")
}

\keyword{ blur }
\keyword{ fuzzy }
