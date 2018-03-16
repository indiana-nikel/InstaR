#Copyright 2018 Tarini Bhatnagar
#Licensed under the Apache License, Version 2.0 (the "License")
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0

# March 2018
# This script is for function flip.

#library("OpenImageR")
library("tableMatrix")
library("png")

flip <- function(img_path, direction) {

  #Reading image file as matrix
  input_mat <- readPNG(img_path)

  #Creating variables to facilitate division of image into 3 RGB channels
  div1 <- length(input_mat)/3
  div2 <- 2*div1
  div3 <- length(input_mat)/1
  start_1 <- 1
  start_2 <- div1+1
  start_3 <- div2+1
  output_dim_row <- nrow(input_mat)
  output_dim_col <- ncol(input_mat)

  #Dividing image pixels into 3 vectors corresponding to 3 different channels (RGB)
  input_r <- input_mat[start_1:div1]
  input_g <- input_mat[start_2:div2]
  input_b <- input_mat[start_3:div3]

  #Converting RGB channel vectors into separate matrices
  input_r_mat <- matrix(input_r,nrow=output_dim_row, ncol=output_dim_col)
  input_g_mat <- matrix(input_g,nrow=output_dim_row, ncol=output_dim_col)
  input_b_mat <- matrix(input_b,nrow=output_dim_row, ncol=output_dim_col)

  if (direction=='h') {
    #Reversing columns for a horizontal flip
    output_r_mat <- input_r_mat[, rev(seq_len(ncol(input_r_mat)))]
    output_g_mat <- input_g_mat[, rev(seq_len(ncol(input_g_mat)))]
    output_b_mat <- input_b_mat[, rev(seq_len(ncol(input_b_mat)))]
  } else if (direction=='v') {
    #Reversing rows for a vertical flip
    output_r_mat <- input_r_mat[dim(input_r_mat)[1L]:1,]
    output_g_mat <- input_g_mat[dim(input_g_mat)[1L]:1,]
    output_b_mat <- input_b_mat[dim(input_b_mat)[1L]:1,]
  } else {
    break
  }

  #Combining 3 RGB channel matrices into a single #D matrix
  output_mat <- array(c(output_r_mat,output_g_mat,output_b_mat),dim = c(output_dim_row,output_dim_col,3))

  #Save flipped image
  writePNG(output_mat,target="flipped.png")
  return(output_mat)
}
