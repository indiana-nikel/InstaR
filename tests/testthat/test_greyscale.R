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


# This script tests the greyscale() function

# greyscale(input_path, output_path) converts a color image into greyscale
# Input: input_path: string, path for the input image file
#        output_path: string, path for the output image file
# Output: an image file at the specified output path


library(png)
library(InstaR)
context("Greyscale image")

# input color: image 1
input1 <- array(c(c(10,20,40,
                    20,40,10,
                    40,10,20),   #R values
                  c(20,40,80,
                    40,80,20,
                    80,20,40),   #G values
                  c(30,60,120,
                    60,120,30,
                    120,30,60)),  #B values
                dim = c(3,3,3))

# expected output: greyscale image 1
exp_output1 <- array(c(c(0.9329412, 0.8619608, 0.7200000,
                         0.8619608, 0.7200000, 0.9329412,
                         0.7200000, 0.9329412, 0.8619608),   #R values
                       c(0.9329412, 0.8619608, 0.7200000,
                         0.8619608, 0.7200000, 0.9329412,
                         0.7200000, 0.9329412, 0.8619608),   #G values
                       c(0.9329412, 0.8619608, 0.7200000,
                         0.8619608, 0.7200000, 0.9329412,
                         0.7200000, 0.9329412, 0.8619608)),  #B values
                      dim = c(3,3,3))

writePNG(input1, "input1.png")

test_that("color image converted to greyscale", {
  greyscale("input1.png",
            "input1_gs.png")
  output = readPNG("input1_gs.png")
  expect_equal(output, exp_output1, tolerance=1e-2)
})

# input: greyscale image 2
input2 <- array(c(c(0.9329412, 0.8619608, 0.7200000,
                    0.8619608, 0.7200000, 0.9329412,
                    0.7200000, 0.9329412, 0.8619608),   #R values
                  c(0.9329412, 0.8619608, 0.7200000,
                    0.8619608, 0.7200000, 0.9329412,
                    0.7200000, 0.9329412, 0.8619608),   #G values
                  c(0.9329412, 0.8619608, 0.7200000,
                    0.8619608, 0.7200000, 0.9329412,
                    0.7200000, 0.9329412, 0.8619608)),  #B values
                dim = c(3,3,3))

# expected output: identical greyscale image 2
exp_output2 <- array(c(c(0.9329412, 0.8619608, 0.7200000,
                         0.8619608, 0.7200000, 0.9329412,
                         0.7200000, 0.9329412, 0.8619608),   #R values
                       c(0.9329412, 0.8619608, 0.7200000,
                         0.8619608, 0.7200000, 0.9329412,
                         0.7200000, 0.9329412, 0.8619608),   #G values
                       c(0.9329412, 0.8619608, 0.7200000,
                         0.8619608, 0.7200000, 0.9329412,
                         0.7200000, 0.9329412, 0.8619608)),  #B values
                     dim = c(3,3,3))

writePNG(input2, "input2.png")

test_that("greyscale image remains greyscale", {
  greyscale("input2.png",
            "input2_gs.png")
  output = readImage("input2_gs.png")
  expect_equal(output, exp_output2, tolerance=1e-2)
})

test_that("In case the input is not an image", {
  expect_error(greyscale(c(1,2,3), 456))
  expect_error(greyscale("/tests/testthat/test_img/greyscale/test.pdf",
                         "/tests/testthat/test_img/greyscale/input1_gs.jpg"))
})

test_that("If user specifies additional arguments, it throws an error", {
  expect_error(greyscale("/tests/testthat/test_img/greyscale/input1.jpg",
                         "/tests/testthat/test_img/greyscale/input1_gs.jpg",
                         "abc"))
})


