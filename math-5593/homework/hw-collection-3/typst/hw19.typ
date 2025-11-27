= Homework 19

== Problem

Show that the below example cycles at 0 through a dictionary computation. 

Note: Keep formatting clean and feel free to skip over tedious intermediate computations to save on space. 


$
  max 3/4 x_1 - 20x_2 + 1/2 x_3 - 6x_4 \
  "subject to" 1/4 x_1 - 8x_2 - x_3 + 9x_4 &<= 0 \
  1/2 x_1 - 12x_2 - 1/2 x_3 + 3x_4 &<= 0 \
  x_3 &<= 1 \
  x_1, x_2, x_3, x_4 &>= 0
$

Note that the origin here is redundant with 6 active constraints. In a run of the simplex method with LCR & MRT, the algorithm cycles at 0. The same basis is repeated after 6 pivots. 

== Solution



First we rewrite.

$
  J &= 3/4 x_1 - 20x_2 + 1/2 x_3 - 6x_4 \
  "(subject to)" w_1 &= 0 -1/4 x_1 + 8x_2 + x_3 - 9x_4 \
  w_2 &= 0 -1/2 x_1 + 12x_2 + 1/2 x_3 - 3x_4 \
  w_3 &= 1 - x_3 \
$

Initial solution, set all $x$ variables to $0$. This gives us:
$
  w_1 = 0, w_2 = 0, w_3 = 1, J = 0
$

=== Pivot 1

Pick $x_1$ as it has the largest positive coefficient in the $J$ row at $3/4$. The two minimum ratios we get for this are $0$ and $0$. We'll pick $w_1$. Working through the pivot gives us the dictionary:

$
  J &= -3 w_1 + 4x_2 + 7/2 x_3 - 33x_4 \
  x_1 &= -4w_1 + 32x_2 + 4x_3 - 36x_4 \
  w_2 &= 2w_1 - 4x_2 - 3/2 x_3 + 15x_4 \
  w_3 &= 1-x_3  
$

New basic feasible solution: $x_1 = 0, w_2 = 0, w_3 = 1, J=0$.

=== Pivot 2

Now we pick $x_2$ to enter as it has the largest coefficient at $4$. Our only negative coefficient for $x_2$ is in the $w_2$ row. $w_2 = 0$ from our basic feasible solution so our ratio is $0/(4) = 0$. 

New dictionary:

$
  J &= - w_1 - w_2 + 2 x_3 - 18x_4 \
  x_1 &= -8w_2 + 12w_1 - 8x_3 + 84x_4 \
  x_2 &= -1/4 w_2 + 1/2w_1 - 3/8 x_3 + 15/4 x_4  \
  w_3 &= 1-x_3  
$

New basic feasible solution: $x_1 = 0, x_2 = 0, w_3 = 1, J=0$.

=== Pivot 3

$x_3$ enters as it now has the largest coefficient at $2$. The ratios are as follows.

$
  x_1: 0, x_2: 0, w_3: 1
$

We pick $x_1$ as its the top row. Solving that row for $x_3$ and pivoting gives us the new dictionary:

$
  J &= -1/4 x_1 + 2w_1 - 3w_2 + 3x_4 \
  x_3 &= -1/8 x_1 - w_2 + 3/2 w_1 + 10.5x_4 \
  x_2 &= 3/64 x_1 - 1/16 w_1 + 1/8 w_2 - 3/16 x_4 \
  w_3 &= 1 + 1/8x_1 + w_2 - 3/2w_1 - 10.5x_4 
$

New basic solution: $x_3 = 0, x_2 = 0, w_3 = 1, J=0$

=== Pivot 4

Same song and dance. 

$
  J &= -1/4 x_1 + 2 w_1 - 3 w_2 + 0 x_3 \
  x_4 &= 1/10.5 x_1 + 0 x_2 - 1/10.5 w_1 + 1/10.5 w_2 + 0 x_3 \
  x_2 &= 3/64 x_1 - 1/16 w_1 + 1/8 w_2 - 3/16 x_4 \
  w_3 &= 1 + 1/8 x_1 - 3/2 w_1 + w_2 - 10.5 x_4
$

New basic solution: $x_4 = 0, x_2 = 0, w_3 = 1, J = 0$

=== Pivot 5

$
  J &= -1/4 x_1 + 2 w_1 + 0 x_3 + 0 x_4 \
  w_2 &= 0 + 0 x_1 + 0 x_2 + 0 x_3 + 0 x_4 \
  x_2 &= 0 \
  w_3 &= 1 - 3/2 w_1 - 10.5 x_4 + 1/8 x_1
$

New basic solution: $w_2 = 0, x_2 = 0, w_3 = 1, J = 0$

=== Pivot 6

$
  J &= -1/4 x_1 + 2 w_1 + 0 x_4 \
  x_3 &= 0 \
  x_2 &= 0 \
  w_3 &= 1 + 1/8 x_1 - 3/2 w_1 - 10.5 x_4
$

New basic solution: $x_3 = 0, x_2 = 0, w_3 = 1, J = 0$

What we can see here is this is the same basic solution as Pivot 3. Thus showing the full cycle. 