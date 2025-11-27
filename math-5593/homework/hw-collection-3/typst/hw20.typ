= Homework 20

== Problem

Design a Phase I LP for a problem:

$
  max c^T x \
  A x = b \
  x >= 0
$

Explain briefly (less than 100 words).

== Solution

$
  min sum y_i \
  A x + y =b \
  y >= 0
$

For this LP we use artifical variables $y$ to force initial feasibility using $x=0, y=b$. The objective function allows us to then reduce the values of $y$ until they get as small as possible. This has two possible results. One, that $min sum y_i = 0$. This means we have found a feasible solution where $A x =b$. We no longer depend on $y$ for feasibility and can move on. The other result is $min sum y_i > 0$. This means even at the optimal phase 1 value we still rely on $y$, meaning the original LP was infeasible. 