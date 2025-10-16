#import "@preview/thmbox:0.3.0": *

#show: thmbox-init()


= Homework 11

== Problem

Prove the following theorem:

#theorem[A cone $K$ is convex if and only if $K + K subset.eq K$.]

== Solution

Some definitions:

#definition[Convex Set][
  A set $S subset.eq RR^n$ is #underline[convex] if, for every two points, $x_1, x_2 in S$ and every scalar $lambda in (0,1)$, the point $lambda x_1 + (1-lambda)x_2 in S$.  
]

#definition[Cone][
  A set $K$ in $RR^n$ is called a #underline[cone] if:
  $
  lambda K subset.eq K forall lambda >= 0
  $ 
]

#proof[
  Let $K$ be a cone.

  We will first show that $K "is convex" arrow.r.double K+K subset.eq K$.

  Suppose $K$ is convex, then for all $x_1, x_2 in K$ and any $lambda in (0,1)$,

  $
    lambda x_1 + (1-lambda) x_2 in K
  $

  Let $lambda=1/2$. 

  It follows then that,

  $
    1/2x_1 + 1/2x_2 in K
  $

  Also, as $K$ is a cone,  we also know that $theta K subset.eq K : forall theta >= 0$.

  Letting $theta = 2$, we have

  $
    2(1/2 x_1 + 1/2 x_2) &in K \
    x_1 + x_2 &in K 
  $

  As $x_1, x_2$ were arbitrary elements of $K$, It follows that $K+K subset.eq K$. 
  
  Therefore, $K "is convex" arrow.r.double K+K subset.eq K$.

  Now, we show the other direction : $K+K subset.eq K arrow.r.double K "is convex"$.

  Assume that $K+K subset.eq K$

  Let $x_1, x_2 in K$ and $lambda in [0, 1]$

  From this, building off of the given assumption,

  $
    lambda x_1 &in K : forall lambda \
    (1 - lambda)x_2 &in K : forall lambda
  $

  From this,

  $
  lambda x_1 + (1-lambda) x_2 in K
  $

  As $x_1, x_2$ were arbitrary elements of $K$, this holds for all elements in $K$ and all $lambda in [0,1]$. 
  
  Therefore, $K+K subset.eq K arrow.r.double K "is convex"$.

]