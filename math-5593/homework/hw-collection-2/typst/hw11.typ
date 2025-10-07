#import "@preview/thmbox:0.3.0": *

#show: thmbox-init()


= Homework 11

== Problem

Prove the following theorem:

#theorem[A cone $K$ is convex if and only if $K + K subset.eq K$.]

== Solution

Some definitions:

#definition[Polyhedral Sets][
  A set $S$ in $RR^n$ is called #underline[polyhedral] or a #underline[convex polyhedron] if it can be represented as the intersection of a finite number of halfspaces.

  $
    S in {x in RR^n , A x >= b}
  $
]

#definition[Cone][
  A set $K$ in $RR^n$ is called a #underline[cone] if:
  $
  lambda K subset.eq K forall lambda >= 0
  $ 
  
  A #underline[convex (polyhedral) cone] is a cone that is also conex (polyhedral).
]