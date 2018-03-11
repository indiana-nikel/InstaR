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


library(OpenImageR)
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
exp_output1 <- array(c(c(18,36,72,
                         36,72,18,
                         72,18,36),   #R values
                       c(18,36,72,
                         36,72,18,
                         72,18,36),   #G values
                       c(18,36,72,
                         36,72,18,
                         72,18,36)),  #B values
                      dim = c(3,3,3))

writeImage(input1, "/tests/testthat/test_img/greyscale/input1.jpg")

test_that("color image converted to greyscale", {
  greyscale("/tests/testthat/test_img/greyscale/input1.jpg",
            "/tests/testthat/test_img/greyscale/input1_gs.jpg")
  output = readImage("/tests/testthat/test_img/greyscale/input1_gs.jpg")
  expect_equal(output, exp_output1)
})

# input: greyscale image 2
input2 <- array(c(c(10,20,30,
                    40,50,60,
                    70,80,90),   #R values
                  c(10,20,30,
                    40,50,60,
                    70,80,90),   #G values
                  c(10,20,30,
                    40,50,60,
                    70,80,90)),  #B values
                dim = c(3,3,3))

# expected output: identical greyscale image 2
exp_output2 <- array(c(c(10,20,30,
                         40,50,60,
                         70,80,90),   #R values
                       c(10,20,30,
                         40,50,60,
                         70,80,90),   #G values
                       c(10,20,30,
                         40,50,60,
                         70,80,90)),  #B values
                     dim = c(3,3,3))

writeImage(input2, "/tests/testthat/test_img/greyscale/input2.jpg")

test_that("greyscale image remains greyscale", {
  greyscale("/tests/testthat/test_img/greyscale/input2.jpg",
            "/tests/testthat/test_img/greyscale/input2_gs.jpg")
  output = readImage("/tests/testthat/test_img/greyscale/input2_gs.jpg")
  expect_equal(output, exp_output2)
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

# All test passed when running them manually, but failed when do auto testing. We will investigate it next week.
