# Copyright 2018 Indiana Nikel
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


# This script tests the blur() function

library(OpenImageR)
library(InstaR)
context("Blur image")

# input color: image 1
input1 <- array(c(c(10, 20, 30, 40, 50,
                    20, 30, 40, 50, 10,
                    30, 40, 50, 10, 20,
                    40, 50, 10, 20, 30,
                    50, 10, 20, 30, 40),   #R values
                  c(110, 120, 130, 140, 150,
                    120, 130, 140, 150, 110,
                    130, 140, 150, 110, 120,
                    140, 150, 110, 120, 130,
                    150, 110, 120, 130, 140),   #G values
                  c(210, 220, 230, 240, 250,
                    220, 230, 240, 250, 210,
                    230, 240, 250, 210, 220,
                    240, 250, 210, 220, 230,
                    250, 210, 220, 230, 240)),  #B values
                dim = c(5,5,3))

writeImage(input1, "input1.jpg")

# expected output: blur image 1
exp_output1 <- array(c(c(30, 34.4444, 33.3333,
                         34.4444, 33.3333, 26.6666,
                         33.3333, 26.6666, 25.5555),   #R values
                       c(130, 134.4444, 133.3333,
                         134.4444, 133.3333, 126.6666,
                         133.3333, 126.6666, 125.5555),   #G values
                       c(230, 234.4444, 233.3333,
                         234.4444, 233.3333, 226.6666,
                         233.3333, 226.6666, 225.5555)),  #B values
                     dim = c(3,3,3))

#Define test image with incorrect RGB values
img_inc <- array(c(c(0, 0, 301),    #R values
                   c(255, 255, 255),    #G values
                   c(0, 0, -9)),    #B values
                 dim = c(3,3,1))


test_that("In case the input is not an image", {

    expect_error(blur(list(input1)))
    expect_error(blur("input1.pdf"))

})


test_that("In case the intensity values are not in range of 0-255", {

    expect_error(blur(img_inc))

})


test_that("If user specifies an additional argument, it throws an error", {

    expect_error(blur(input1, type="box"))

})

test_that("color image blurred", {
    #blur(input1.jpg)
  output <- readImage("blur.jpg")
  expect_equal(output, exp_output1)

})
