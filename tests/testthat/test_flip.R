#Copyright 2018 Tarini Bhatnagar
#Licensed under the Apache License, Version 2.0 (the "License")
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0

# March 2018
# This script tests the function from flip.R.

library("InstaR")
library("png")
context('Flip image')

#Define 3D (RGB channel)test image for horizontal flip

c1_h <- c(1,1,1)
c2_h <- c(0,1,0)
c3_h <- c(0,1,0)
c4_h <- c(1,1,1)
c5_h <- c(0,1,0)
c6_h <- c(0,1,0)
c7_h <- c(1,1,1)
c8_h <- c(0,1,0)
c9_h <- c(0,1,0)
img_h_mat <- array(c(c1_h,c2_h,c3_h,c4_h,c5_h,c6_h,c7_h,c8_h,c9_h),dim = c(3,3,3))
writePNG(img_h_mat,"img_horiz.png")

#Define 3D (RGB channel)test image for vertical flip

c1_v <- c(1,0,0)
c2_v <- c(1,1,1)
c3_v <- c(1,0,0)
c4_v <- c(1,0,0)
c5_v <- c(1,1,1)
c6_v <- c(1,0,0)
c7_v <- c(1,0,0)
c8_v <- c(1,1,1)
c9_v <- c(1,0,0)
img_v_mat <- array(c(c1_v,c2_v,c3_v,c4_v,c5_v,c6_v,c7_v,c8_v,c9_v),dim = c(3,3,3))
writePNG(img_v_mat,"img_vert.png")

#Expected 3D (RGB channel)test image for horizontal flip

c1_h_exp <- c(0,1,0)
c2_h_exp <- c(0,1,0)
c3_h_exp <- c(1,1,1)
c4_h_exp <- c(0,1,0)
c5_h_exp <- c(0,1,0)
c6_h_exp <- c(1,1,1)
c7_h_exp <- c(0,1,0)
c8_h_exp <- c(0,1,0)
c9_h_exp <- c(1,1,1)
img_h_mat_exp <- array(c(c1_h_exp,c2_h_exp,c3_h_exp,c4_h_exp,c5_h_exp,c6_h_exp,c7_h_exp,c8_h_exp,c9_h_exp),dim = c(3,3,3))
#writePNG(img_h_mat_exp,"img_horiz_exp.png")

#Expected 3D (RGB channel)test image for vertical flip

c1_v_exp  <- c(0,0,1)
c2_v_exp  <- c(1,1,1)
c3_v_exp  <- c(0,0,1)
c4_v_exp  <- c(0,0,1)
c5_v_exp  <- c(1,1,1)
c6_v_exp  <- c(0,0,1)
c7_v_exp  <- c(0,0,1)
c8_v_exp  <- c(1,1,1)
c9_v_exp  <- c(0,0,1)
img_v_mat_exp  <- array(c(c1_v_exp ,c2_v_exp ,c3_v_exp ,c4_v_exp ,c5_v_exp ,c6_v_exp ,c7_v_exp ,c8_v_exp ,c9_v_exp),dim = c(3,3,3))
#writePNG(img_v_mat_exp ,"img_vert_exp.png")

#Test function

#Flip image horizontally using function
flip_horiz <- flip("img_horiz.png", "h")

#Flip image vertically using function
flip_vert <- flip("img_vert.png", "v")

test_that("In case the input is not an image", {

  expect_error(flip(list(img_h), "h"))
  expect_error(flip("img_h.pdf", "h"))

})


test_that("If user specifies something other than 'h' or 'v', it throws an error", {

  expect_error(flip("img_horiz.png","s"))

})


test_that("Image is flipped correctly", {

  expect_equal(flip("img_horiz.png", "h"),img_h_mat_exp)
  expect_equal(flip("img_vert.png", "v"),img_v_mat_exp)

})

##Please note: We have not been able to pass our tests of functions successfully due to some
##issue with readJPEG and writeJPEG. The code workd perfectly fine manually. We hope to fix it soon.
