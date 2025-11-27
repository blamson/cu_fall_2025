= Homework 15 (PRECHECKED)

== Problem

Provide an example where both the primal and its corresponding dual problem are both infeasible. 

== Solution

*Primal*

#let Amat = $mat(-1,1; 1,-1)$
#let bmat = $mat(3;-9)$
#let cmat = $mat(-5;7)$
#let xmat = $mat(x_1;x_2)$
#let ymat = $mat(y_1;y_2)$

$
  "max" -5x_1 + 7x_2
$

such that

$
  -x_1 + x_2 &<= 1 \
  x_1 - x_2 &<= -9 \
  x_1, x_2 &>= 0
$

This is a problem as $x_1 - x_2 <= 9 arrow.r.double -x_1 + x_2 >= 9$ which contradicts the first constraint. So the primal problem here is infeasible. Below I simply have the matrix/vector versions of our problem.

$
  A = #Amat, b = #bmat, c = #cmat
$

with

$
  "max" c^T x \
  "s.t." A x <= b \
  x >= 0
$

*Dual*

First we convert it over.

$
  min b^T y \
  y >= 0 \
  A^T y >= c
$

Looking at the constraintss directly gives us:

$
  #Amat^T #ymat &>= #cmat \
  -y_1 + y_2 &>= -5 \
  y_1 - y_2 &>= 7 arrow.r.double -y_1+y_2 <= -7
$

This is a contradiction just like in the primal. So the dual problem is also infeasible.  