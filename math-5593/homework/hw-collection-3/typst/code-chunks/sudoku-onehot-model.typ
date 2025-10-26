#let hrule = line(length: 100%)


First we set up our grid in 2D. We want to read in the data and track everything that's been given. We want to make sure none of those can be modified later. 

#box(stroke: black, inset: 1em)[
```py
param gridsize > 0;
param grid_data {1..gridsize, 1..gridsize} integer >= 0, < 10, default 0;

# differentiates between given cells and cells we can modify
set FIXED := {i in 1..gridsize, j in 1..gridsize: grid_data[i,j] != 0};
set MODIFIABLE := {i in 1..gridsize, j in 1..gridsize: grid_data[i,j] = 0};
```
]

Now here is where we set up our cube. The cube itself is our variable for the linear program.

#box(stroke: black, inset: 1em)[
```py
# possible values
set VALS := 1..9;

# Like a binary RGB grid for images. Asks "Does this cell have red?"
var X {i in 1..gridsize, j in 1..gridsize, v in VALS} binary;
```
]

Next we get to the constraints. How do we want the cube to behave? 

#box(stroke: black, inset: 1em)[
```py
# Restrict the models ability to change any given values
subject to prefilled { (i,j) in FIXED }:
    X[i,j, grid_data[i,j]] = 1;

# forces every cell to HAVE a value
# One of those value windows has to have something
subject to one_value_per_cell { (i,j) in MODIFIABLE }:
    sum {v in VALS} X[i,j,v] = 1;
```
]

The above constraint is really important, without it we can satisfy the other conditions and end up with a bunch of $0$ cells. So every cell must have one and only one active layer. Next up, the classic constratints.

#box(stroke: black, inset: 1em)[
```py
subject to row_unique {i in 1..gridsize, v in VALS}:
    sum {j in 1..gridsize} X[i,j,v] = 1;

subject to col_unique {j in 1..gridsize, v in VALS}:
    sum {i in 1..gridsize} X[i,j,v] = 1;

subject to block_unique {bi in 0..2, bj in 0..2, v in VALS}:
    sum {i in 3*bi+1..3*bi+3, j in 3*bj+1..3*bj+3} X[i,j,v] = 1;
```
]

These enforce the typical sudoku rules. 

Now the objective function in this case is totally arbitrary. I just choose to sum everything up. 

#box(stroke: black, inset: 1em)[
```py
# Totally arbitrary objective function, just sum up everything
maximize dummy: sum {i in 1..gridsize, j in 1..gridsize, v in VALS} X[i,j,v];
```
]

