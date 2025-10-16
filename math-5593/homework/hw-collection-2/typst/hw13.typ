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
