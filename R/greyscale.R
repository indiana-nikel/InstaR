# Copyright 2018 Xin (Alex) Guo
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.


library(png)
library(testit)

#' Greyscale
#'
#' Convert a color image into greyscale
#'
#' @param input_path string, path for the input png file
#' @param output_path string, path for the output png file
#'
#' @return a png file at the specified output path
#' @export
#'
#' @examples
#' #' greyscale("img.png", "img_gs.png")

greyscale <- function(input_path, output_path) {
  # exception handling
  assert("Please provide a string as the path for the input image file.", is.character(input_path))
  assert("Please provide a string as the path for the output image file.", is.character(output_path))

  img <- readPNG(input_path)

  height <- dim(img)[1]
  width <- dim(img)[2]

  img_gs <- array(dim = dim(img))

  for (i in 1:height) {
    for (j in 1:width) {
      R = img[i,j,1]
      G = img[i,j,2]
      B = img[i,j,3]

      grey = 0.3*R + 0.59*G + 0.11*B

      img_gs[i,j,1] = grey
      img_gs[i,j,2] = grey
      img_gs[i,j,3] = grey
    }
  }

  writePNG(img_gs, output_path)
}
