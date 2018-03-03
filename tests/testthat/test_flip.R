#Copyright 2018 Tarini Bhatnagar
#Licensed under the Apache License, Version 2.0 (the "License")
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0

# March 2018
# This script tests the function from flip.R.

library(InstaR)
context('Flip image')

#Define test image for horizontal flip
red_h <- c(255,255,255)
green_h <- c(0,255,0)
blue_h <- c(0,255,0)
img_h <- array(c(red_h,green_h,blue_h),dim = c(3,3,3))

#Define test image for vertical flip
red_v <- c(255,0,0)
green_v <- c(255,255,255)
blue_v <- c(255,0,0)
img_v <- array(c(red_v,green_v,blue_v),dim = c(3,3,3))

#Expected image matrix for horizontal flip
red_h_e <- c(0,255,0)
green_h_e <- c(0,255,0)
blue_h_e <- c(255,255,255)
img_h_e <- array(c(red_h_e,green_h_e,blue_h_e),dim = c(3,3,3))

#Expected image matrix for vertical flip
red_v_e <- c(0,0,255)
green_v_e <- c(255,255,255)
blue_v_e <- c(0,0,255)
img_v_e <- array(c(red_v_e,green_v_e,blue_v_e),dim = c(3,3,3))

#Define test image with missing R/G/B channel
red_missing <- c(0,0,255)
green_missing <- c(255,255,255)
img_missing <- array(c(red_missing,green_missing),dim = c(3,3,2))

#Define test image with incorrect RGB values
red_inc <- c(0,0,301)
green_inc <- c(255,255,255)
blue_inc <- c(0,0,-9)
img_inc <- array(c(red_inc,green_inc,blue_inc),dim = c(3,3,3))

#Flip image horizontally using function
flip_h <- flip(img,'h')

#Flip image vertically using function
flip_v <- flip(img,'v')

test_that("In case the input is not an image", {

  expect_error(flip(list(img_h),'h'))
  expect_error(flip("img_h.pdf",'h'))

})


test_that("In case the image matrix is missing R/G/B channel", {

  expect_error(flip(img_missing,'h'))

})


test_that("In case the intensity values are nt in range of 0-255", {

  expect_error(flip(img_intensity,'h'))

})


test_that("If user specifies something other than 'h' or 'v', it throws an error", {

  expect_error(flip(img_h,'s'))

})


test_that("Image flips correctly", {

  expect_equal(flip(img_h,'h'),img_h_e)
  expect_equal(flip(img_v,'v'),img_v_e)

})
