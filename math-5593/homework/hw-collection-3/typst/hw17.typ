#import "@preview/thmbox:0.3.0": *

#show: thmbox-init()

#let xbar = $#overline[x]$
#let implies = $arrow.r.double$

= Homework 17 (PRECHECKED)

== Problem

Prove the following theorem:

#theorem[
  Let $P = {x:A x <= b}$. Let $P$ have a vertex. Let $#xbar in P$. Then $#xbar$ is a vertex if and only if an inclusion-maximal set of constraints is active at $#xbar$.

  In other words, $#xbar$ is a vertex if and only if there does not exist a $y in P$ such that $A(#xbar) subset.neq A(y)$. 
]

== Solution

Before we start the proof, let's think about what this means. $A(#xbar)$ is the index set of active constraints at $#xbar$. This theorem is saying that if theres any other feasible point that has an index set that is the superset of $#xbar$, that $#xbar$ can't be a vertex. This intuitively makes sense as it would imply there was some constraint that was inactive at $#xbar$ which would mean its not a vertex.

*Proof:*

$(A implies B)$

Let $#xbar$ be a vertex. Because $#xbar$ is a vertex, we know that by definition: $"rank" A_(#xbar) = n$. From this, we also know that $A_(#xbar)x = b_(#xbar)$ has a unique solution. 

Suppose then that that there exists a $y in P$ such that $A(#xbar) subset.neq A(y)$. As this is a strict subset, $A(y)$ contains all of the same active constraint indices as $A(#xbar)$. Therefore, $y$ satisfies every single equality in $A_(#xbar)x = b_(#xbar)$. 

However, as previously stated, that system has only the unique solution $#xbar$. Therefore, $#xbar = y$ which contradicts the strict inclusion that was set up. 

From this, by contradiction we have shown that there cannot exist a $y in P$ such that $A(#xbar) subset.neq A(y)$.

$(B implies A)$

Assume that there does not exist a $y in P$ such that $A(#xbar) subset.neq A(y)$.

Suppose that $#xbar$ is not a vertex. Because of this, we know that $"rank" A_(#xbar) < n$. Therefore, there must be some $d != 0$ where $A_(#xbar)d = 0$. 

This is important, as it gives us a direction we are free to move along without deactivating any currently active constraints. From this, choosing either $+d$ or $-d$ and moving in that direction will eventually cause a new constraint to become active without deactivating any constraints. So this adds a constraint onto the previous set of active constraints. Let us call the point where this happens $y$. 

Now, we have a new active constraint alongside all of the ones previously active for $#xbar$. As such, the set of active constraints at $y$ fully contains the set of active constraints at $#xbar$. In other words, $A(#xbar) subset.neq A(y)$. This contradicts the assumption made at the beginning. 

Therefore, by contradiction we have shown that $#xbar$ must be a vertex.

This completes the proof.
