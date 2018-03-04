#Copyright 2018 Tarini Bhatnagar
#Licensed under the Apache License, Version 2.0 (the "License")
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0

# March 2018
# This script tests the function from flip.R.

library(InstaR)
context('Flip image')

#Define test image for horizontal flip
c1_h <- c(255,255,255)
c2_h <- c(0,255,0)
c3_h <- c(0,255,0)
img_h <- array(c(c1_h,c2_h,c3_h),dim = c(3,3,1))

#Define test image for vertical flip
c1_v <- c(255,0,0)
c2_v <- c(255,255,255)
c3_v <- c(255,0,0)
img_v <- array(c(c1_v,c2_v,c3_v),dim = c(3,3,1))

#Expected image matrix for horizontal flip
c1_h_e <- c(0,255,0)
c2_h_e <- c(0,255,0)
c3_h_e <- c(255,255,255)
img_h_e <- array(c(c1_h_e,c2_h_e,c3_h_e),dim = c(3,3,1))

#Expected image matrix for vertical flip
c1_v_e <- c(0,0,255)
c2_v_e <- c(255,255,255)
c3_v_e <- c(0,0,255)
img_v_e <- array(c(c1_v_e,c2_v_e,c3_v_e),dim = c(3,3,1))

#Define test image with incorrect RGB values
c1_inc <- c(0,0,301)
c2_inc <- c(255,255,255)
c3_inc <- c(0,0,-9)
img_inc <- array(c(c1_inc,c2_inc,c3_inc),dim = c(3,3,1))

#Flip image horizontally using function
flip_h <- flip(img, direction='h')

#Flip image vertically using function
flip_v <- flip(img, direction='v')

test_that("In case the input is not an image", {

  expect_error(flip(list(img_h), direction='h'))
  expect_error(flip("img_h.pdf", direction='h'))

})


test_that("In case the intensity values are not in range of 0-255", {

  expect_error(flip(img_intensity,direction='h'))

})


test_that("If user specifies something other than 'h' or 'v', it throws an error", {

  expect_error(flip(img_h,direction='s'))

})


test_that("Image is flipped correctly", {

  expect_equal(flip(img_h, direction='h'),img_h_e)
  expect_equal(flip(img_v, direction='v'),img_v_e)

})
