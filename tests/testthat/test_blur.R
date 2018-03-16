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

library(png)
library(InstaR)
context("Blur image")

# input: color image
input <- array(c(c(10, 20, 30, 40, 50,
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

writePNG(input, target="test_img/blur/input.png")

# expected output: blur image
exp_output <- array(c(c(0.8862745, 0.8705882, 0.8745098,
                        0.8705882, 0.8745098, 0.8980392,
                        0.8745098, 0.8980392, 0.9019608),   #R values
                      c(0.4941176, 0.4784314, 0.4823529,
                        0.4784314, 0.4823529, 0.5058824,
                        0.4823529, 0.5058824, 0.5098039),   #G values
                      c(0.10196078, 0.08627451, 0.09019608,
                        0.08627451, 0.09019608, 0.11372549,
                        0.09019608, 0.11372549, 0.11764706)),  #B values
                     dim = c(3,3,3))

test_that("In case the input is not a .png image", {

    expect_error(blur(list(input1)))
    expect_error(blur("test_img/blur/input.pdf", "test_img/blur/blur.png"))

})

test_that("If user specifies an additional argument, it throws an error", {

    expect_error(blur("test_img/blur/input.png", "test_img/blur/blur.png", "box"))

})

test_that("Color image is blurred", {
    
  blur("test_img/blur/input.png", "test_img/blur/blur.png")
  output <- readPNG("test_img/blur/blur.png")
  expect_equal(output, exp_output, tolerance=1e-5)

})
