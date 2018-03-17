#Copyright 2018 Tarini Bhatnagar
#Licensed under the Apache License, Version 2.0 (the "License")
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0

# March 2018
# This script tests the function from flip.R.

library("InstaR")
library("png")
library("testit")
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
writePNG(img_h_mat,target="test_img/flip/img_horiz_input.png")

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
writePNG(img_v_mat,target="test_img/flip/img_vert_input.png")

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


#Test function

#Flip image horizontally using function
flip_horiz <- flip("test_img/flip/img_horiz_input.png", "h","test_img/flip/flipped_horiz.png")

#Flip image vertically using function
flip_vert <- flip("test_img/flip/img_vert_input.png", "v","test_img/flip/flipped_vert.png")


test_that("Image is flipped correctly", {

  output = readPNG("test_img/flip/flipped_horiz.png")
  expect_equal(output,img_h_mat_exp)

  output = readPNG("test_img/flip/flipped_vert.png")
  expect_equal(output,img_v_mat_exp)

})


test_that("In case the input is not a PNG image",{

  expect_error(flip("test_img/flip/img_horiz_input.pdf", "h","test_img/flip/flipped_horiz.png"))
})

test_that("If user specifies an additional argument, it throws an error", {

  expect_error(flip("test_img/flip/img_horiz_input.png","h", "test_img/flip/flipped_horiz.png", "extra"))
})

test_that("If user gives an invalid flip direction, it throws an error", {

  expect_error(flip("test_img/flip/img_horiz_input.png","s", "test_img/flip/flipped_horiz.png"))
})

test_that("In case the input/output is not a string", {

  expect_error(flip(123,"h","test_img/flip/flipped_horiz.png"))
  expect_error(flip("test_img/flip/img_horiz_input.png","h", c(1,2,3)))
})

test_that("In case the input/output path does not exist", {

  expect_error(blur("123/flip/input.png","h", "test_img/flip/flipped_horiz.png"))
  expect_error(blur("test_img/flip/img_horiz_input.png","h", "123/flip/flip.png"))
})

test_that("In case the input is not an image", {

  expect_error(blur("test_img/flip/img_horiz_input.pdf","h","test_img/flip/flipped_horiz.png"))
})



