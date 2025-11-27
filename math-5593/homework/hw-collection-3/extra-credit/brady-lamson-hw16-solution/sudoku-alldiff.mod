param gridsize > 0;
param grid_data {1..gridsize, 1..gridsize} integer >= 0, <= 9, default 0;

# differentiates between given cells and cells we can modify
set FIXED := {i in 1..gridsize, j in 1..gridsize: grid_data[i,j] != 0};
set MODIFIABLE := {i in 1..gridsize, j in 1..gridsize: grid_data[i,j] = 0};

var X {i in 1..gridsize, j in 1..gridsize} integer >= 1, <= 9;

# Restrict the models ability to change any given values
subject to prefilled { (i,j) in FIXED }:
    X[i,j] = grid_data[i,j];

subject to row_unique {i in 1..gridsize}:
    alldiff {j in 1..gridsize} X[i,j];

subject to col_unique {j in 1..gridsize}:
    alldiff {i in 1..gridsize} X[i,j];

subject to block_unique {bi in 0..2, bj in 0..2}:
    alldiff {i in 3*bi+1..3*bi+3, j in 3*bj+1..3*bj+3} X[i,j];

# Totally arbitrary objective function, just sum up everything
maximize dummy: sum {i in 1..gridsize, j in 1..gridsize} X[i,j];
