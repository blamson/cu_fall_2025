#import "@preview/thmbox:0.3.0": *

#show: thmbox-init()

#let xbar = $#overline[x]$
#let implies = $arrow.r.double$

= Homework 13

== Problem

Prove the following theorem:

#theorem[
  A point #xbar is a #underline[vertex] of $S$ if and only if it is an #underline[extreme point] of $S$.
]

== Relevant Definitions

#definition[Vertex][
  A #underline[feasible point] $x in S$ is called a #underline[vertex] of $S$ if:
  $
    "Rank" A_(#xbar) = n
  $
  (for a dimension of space $RR^n$)
]

#definition[Extreme Point][
  A point #xbar in a convex set $S$ is called an #underline[extreme point] of $S$ if it cannot be written as a strict convex combination of any other two points in $S$.

  $
    &x = lambda y + (1-lambda)z "for some" 0 < lambda < 1 \ 
    &#implies x=y=z
  $
]

#definition[Active Constraints][
  Given a feasible point $#xbar in S$, a constraint $a_i^T x >= b_i$ is said to be: 
    - Active at $#xbar$ if $a_i^T #xbar = b_i$ or 
    - Inactive at $#xbar$ if $a_i^T #xbar > b_i$
]

== Solution

#proof[
  $(A implies B)$:
  Assume #xbar is a vertex of $S$ and that it is *not* an extreme point. 

  Let $y, z$ also be feasible points in $S$ such that $y != z$. Also let $lambda in [0,1]$. Because #xbar is not an extreme point, it can be represented as a a convex combination of two other points in $S$. Therefore we can state that

  $
    #xbar = lambda y + (1 - lambda)z
  $

  As #xbar is a vertex, we know that it has active constraints such that $a_i^T #xbar = b_i$. Plugging in the equality for #xbar gives us:

  $
    a_i^T #xbar = lambda a_i^T y + a_i^T (1-lambda) z = b_i
  $
  
  
  As for $y$ and $z$, since they're feasible points we know that: 
  
  $
    a_i^T y &>= b_i &#h(1cm) a_i^T z &>= b_i \
    lambda a_i^T y &>= lambda b_i &#h(1cm) (1 - lambda) a_i^T z &>= (1 - lambda) b_i
  $ 

  It follows from this that 

  $
    lambda a_i^T y + (1 - lambda) a_i^T z &>= lambda b_i + (1-lambda)b_i \
    &>= b_i(lambda + 1 - lambda) \
    &>= b_i
  $

  This is only ever an equality when $y=z$ which is contradicted by our construction of $y,z$ where $y != z$. 

]