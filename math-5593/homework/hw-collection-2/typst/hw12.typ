#import "@preview/thmbox:0.3.0": *

#show: thmbox-init()

= Homework 12

== Problem

State and explain and LP to determine if $p^T x >= q$ is redundant for a system $A x >= b$.

=== Solution

#definition[Redundancy][
  A constraint is said to be *redundant* for a system of constraints $A x >= b$ if its addition or removal does not alter the set.
]

The general approach here is to optimize the suspected constraint using the feasible set provided by the other constraints. We know that $p^T x$ has a lower bound at $q$. This approach will allow us to compare to $q$ to draw our conclusions. 

$
 min p^T x \
 A x >= b
$ 

This gives us an optimal set of variables $x^*$, so that gives us an optimal value to compare against.

If $p^T x^* >= q$, this tells us that the other constraints already satisfy everything that the candidate constraint would provide. As such we would deem the candidate redundant. 

If $p^T x^* < q$, then that means the candidate constraint provided would restrict the optimal value more. This would indicate that the candidate is not redundant. 